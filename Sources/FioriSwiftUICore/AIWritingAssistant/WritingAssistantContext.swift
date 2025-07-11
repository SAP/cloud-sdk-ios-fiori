import Combine
import FioriThemeManager
import Foundation
import os.log
import SwiftUI

struct CustomDestination: Hashable {
    let id = UUID()
    let destination: any View
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    static func == (lhs: CustomDestination, rhs: CustomDestination) -> Bool {
        lhs.id == rhs.id
    }
}

struct WAErrorModel: Equatable {
    var isFeedbackError: Bool
    var isInMenuView: Bool
    var error: WAError?
    
    init(isFeedbackError: Bool = false, isInMenuView: Bool = false, error: WAError? = nil) {
        self.isFeedbackError = isFeedbackError
        self.isInMenuView = isInMenuView
        self.error = error
    }
    
    static func == (lhs: WAErrorModel, rhs: WAErrorModel) -> Bool {
        lhs.isFeedbackError == rhs.isFeedbackError &&
            lhs.isInMenuView == rhs.isInMenuView &&
            lhs.error?.id == rhs.error?.id
    }
}

class WritingAssistantContext: NSObject, ObservableObject {
    var selectionKVO: NSKeyValueObservation?
    var textView: UITextView?
    var textField: UITextField?
    
    @Published var originalValue: String = ""
    @Published var displayedValue: String = ""
    
    var originalSelectedRange: NSRange? = nil
    var selectedRange: NSRange? = nil
    var canResetSelectedRange = true
    
    @Published var inProgress: Bool = false
    @Published var isPresented: Bool = false
    @Published var showCancelAlert: Bool = false
    @Published var showFeedbackSuccessToast: Bool = false
    @Published var customDestination: CustomDestination? = nil

    var rewriteTextSet: [(range: NSRange, value: String)] = []
    
    @Published var isInWAFlow: Bool = false
    var logKeyboardChanged = true
    
    func updateInWAFlow(_ showKeyboard: Bool) {
        self.isInWAFlow = showKeyboard && self.textView?.isFirstResponder ?? false
    }
    
    @Published var selection: WAMenu? = nil
    @Published var lastSelection: WAMenu? = nil
    
    @Published var errorModel = WAErrorModel()
    
    var isErrorHappenedInMenuView: Bool {
        self.errorModel.isInMenuView && self.errorModel.error != nil
    }
    
    var showErrorInFeedbackView: Bool {
        self.errorModel.isFeedbackError && !self.errorModel.isInMenuView && self.errorModel.error != nil
    }
    
    var indexOfCurrentValue: Int = 0
    var rangeChangedShouldBeMonitored: Bool = true
    var lastFeedbackInformation: (voteState: AIUserFeedbackVoteState, options: [String], inMenuView: Bool)? = nil
    var menus: [[WAMenu]] = []
    var menuHandler: ((WAMenu, String) async -> WAResult)!
    var feedbackOptions: [String] = []
    var feedbackHandler: ((AIUserFeedbackVoteState, [String]) async -> WAFeedbackResult)?
    
    @Published var feedbackVoteState: AIUserFeedbackVoteState = .notDetermined
    @Published var feedbackSubmitButtonState: AIUserFeedbackSubmitButtonState = .normal
    
    var feedbackDownvoted: Bool {
        self.feedbackVoteState == .downVote
    }
    
    var feedbackUpvoted: Bool {
        self.feedbackVoteState == .upVote
    }
    
    @State private var task: Task<Void, Never>? = nil
    
    var textIsChanged: Bool {
        self.displayedValue != self.originalValue
    }
    
    func setError(_ error: WAError, isFeedbackError: Bool = false, isInMenuView: Bool = true) {
        self.errorModel = WAErrorModel(isFeedbackError: isFeedbackError, isInMenuView: isInMenuView, error: error)
    }
    
    func reset(originalValue: String,
               menus: [[WAMenu]],
               menuHandler: @escaping (WAMenu, String) async -> WAResult,
               feedbackOptions: [String],
               feedbackHandler: ((AIUserFeedbackVoteState, [String]) async -> WAFeedbackResult)?)
    {
        self.originalValue = originalValue
        self.menus = menus
        self.menuHandler = menuHandler
        self.feedbackOptions = feedbackOptions
        self.feedbackHandler = feedbackHandler
        self.rewriteTextSet = [(NSRange(location: 0, length: originalValue.count), originalValue)]
        self.indexOfCurrentValue = 0
        self.displayedValue = originalValue
    }
    
    func startMenuTask(menu: WAMenu) {
        guard let menuHandler else {
            os_log("Menu handler is not set", log: .default, type: .error)
            return
        }
        self.errorModel.error = nil
        self.inProgress = true
        self.logKeyboardChanged = false
        self.task = Task {
            let result = await menuHandler(menu, self.displayedValue)
            await MainActor.run {
                self.updateMenuResult(menu, result)
            }
        }
        self.removeSelection(menu)
    }
    
    @MainActor func updateMenuResult(_ menu: WAMenu, _ result: WAResult) {
        self.inProgress = false
        switch result {
        case .success(let value):
            self.addNewValue(value, for: menu)
        case .customDestination(let view):
            self.customDestination = CustomDestination(destination: view)
        case .failure(let error):
            self.setError(error, isFeedbackError: false, isInMenuView: true)
        }
        self.logKeyboardChanged = true
    }
    
    func startFeedbackTask(voteState: AIUserFeedbackVoteState, options: [String], inMenuView: Bool = true) {
        if let feedbackHandler {
            self.errorModel.error = nil
            self.lastFeedbackInformation = (voteState, options, inMenuView)
            self.inProgress = true
            self.task = Task {
                let result = await feedbackHandler(voteState, options)
                await MainActor.run {
                    self.updateFeedbackResult(result, voteState: voteState, inMenuView: inMenuView)
                }
            }
        }
    }
    
    func retryFeedbackTask() {
        guard let lastFeedbackInformation = self.lastFeedbackInformation else { return }
        self.startFeedbackTask(voteState: lastFeedbackInformation.voteState,
                               options: lastFeedbackInformation.options,
                               inMenuView: lastFeedbackInformation.inMenuView)
    }
    
    @MainActor func updateFeedbackResult(_ result: WAFeedbackResult, voteState: AIUserFeedbackVoteState, inMenuView: Bool) {
        self.inProgress = false
        switch result {
        case .success:
            if voteState == .upVote {
                self.feedbackVoteState = .upVote
            } else if voteState == .downVote {
                self.feedbackVoteState = .downVote
            }
            self.showFeedbackSuccessToast.toggle()
        case .failure(let error):
            self.setError(error, isFeedbackError: true, isInMenuView: inMenuView)
        }
    }
    
    func cancelTask() {
        if let task = self.task {
            task.cancel()
            self.task = nil
        }
    }

    func updateOriginalSelectedRange() {
        if let textView = self.textView {
            self.originalSelectedRange = textView.selectedRange
        } else if let textField = self.textField {
            self.originalSelectedRange = textField.selectedRange
        }
    }
    
    func resetSelectedRange(_ range: NSRange) {
        guard self.canResetSelectedRange, self.selectedRange != range else {
            self.canResetSelectedRange = true
            return
        }
        self.rangeChangedShouldBeMonitored = false
        self.selectedRange = range
        if self.indexOfCurrentValue == 0, self.indexOfCurrentValue < self.rewriteTextSet.count {
            self.rewriteTextSet[self.indexOfCurrentValue].range = range
        }
    }
    
    func removeSelection(_ menu: WAMenu) {
        self.lastSelection = menu
        self.selection = nil
    }
    
    func addNewValue(_ value: String, for menu: WAMenu?) {
        self.rangeChangedShouldBeMonitored = true
        self.updateOriginalSetIfNeeded()
        self.removeUnnecessaryRewriteTextSet()
        let newRange = NSRange(location: usedSelectedRange.location, length: value.count)
        if let lastRange = Range(usedSelectedRange, in: self.displayedValue) {
            self.displayedValue.replaceSubrange(lastRange, with: value)
        }
        self.rewriteTextSet.append((newRange, self.displayedValue))
        self.selectedRange = newRange
        self.indexOfCurrentValue = self.rewriteTextSet.count - 1
        if let menu {
            self.lastSelection = menu
        }
    }
    
    private func updateOriginalSetIfNeeded() {
        if self.indexOfCurrentValue == 0, !self.rewriteTextSet.isEmpty {
            self.rewriteTextSet[0].range = self.usedSelectedRange
            self.rewriteTextSet[0].value = self.displayedValue
        }
    }
    
    private func removeUnnecessaryRewriteTextSet() {
        if self.indexOfCurrentValue < self.rewriteTextSet.count - 1 {
            self.rewriteTextSet.removeSubrange((self.indexOfCurrentValue + 1) ..< self.rewriteTextSet.count)
        }
    }
    
    var usedSelectedRange: NSRange {
        let r: NSRange
        if let range = selectedRange, range.length > 0 {
            r = range
        } else {
            r = NSRange(location: 0, length: self.displayedValue.count)
        }
        return r
    }
    
    func revertToPreviousValue() {
        if self.indexOfCurrentValue > 0 {
            self.indexOfCurrentValue -= 1
            self.handleTextWhenIndexChanged()
        }
    }
    
    func forwardToNextValue() {
        if self.indexOfCurrentValue < self.rewriteTextSet.count - 1 {
            self.indexOfCurrentValue += 1
            self.handleTextWhenIndexChanged()
        }
    }
    
    func handleTextWhenIndexChanged() {
        self.rangeChangedShouldBeMonitored = true
        let textTuple = self.rewriteTextSet[self.indexOfCurrentValue]
        self.displayedValue = textTuple.value
        self.selectedRange = textTuple.range
    }
    
    var revertIsEnabled: Bool {
        self.indexOfCurrentValue > 0
    }
    
    var forwardIsEnabled: Bool {
        self.indexOfCurrentValue < self.rewriteTextSet.count - 1
    }
    
    func cancelAction() {
        self.revertToOriginalValue()
        self.isPresented = false
    }
    
    func aiWritingDone() {
        self.originalValue = self.displayedValue
        self.doneContext()
        self.isPresented = false
    }
    
    func revertToOriginalValue() {
        self.rangeChangedShouldBeMonitored = true
        self.selectedRange = self.originalSelectedRange
        self.displayedValue = self.originalValue
        self.refreshContext()
    }
    
    func doneContext() {
        self.rangeChangedShouldBeMonitored = true
        self.selectedRange = NSRange(location: self.displayedValue.count, length: 0)
        self.refreshContext()
    }
    
    func refreshContext() {
        self.cancelTask()
        self.rewriteTextSet = [(self.usedSelectedRange, self.displayedValue)]
        self.indexOfCurrentValue = 0
        self.selection = nil
        self.lastSelection = nil
        self.errorModel.error = nil
        self.canResetSelectedRange = true
        self.customDestination = nil
        self.showFeedbackSuccessToast = false
        self.feedbackVoteState = .notDetermined
        self.logKeyboardChanged = true
    }
}
