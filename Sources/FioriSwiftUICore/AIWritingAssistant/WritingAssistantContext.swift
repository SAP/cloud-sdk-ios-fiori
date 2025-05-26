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

class WritingAssistantContext: NSObject, ObservableObject {
    var textView: UITextView?
    var textField: UITextField?
    
    @Published var originalValue: String
    @Published var displayedValue: String
    
    var originalSelectedRange: NSRange? = nil
    var selectedRange: NSRange? = nil
    var canResetSelectedRange = true
    
    @Published var inProgress: Bool = false
    @Published var isPresented: Bool = false
    @Published var isFocused: Bool = false
    @Published var showCancelAlert: Bool = false
    @Published var customDestination: CustomDestination? = nil

    var rewriteTextSet: [(range: NSRange, value: String)] = []
    
    @Published var selection: WAMenu? = nil
    
    // rewrite by last selection
    @Published var lastSelection: WAMenu? = nil
    
    @Published var waError: WAError? = nil
    
    var indexOfCurrentValue: Int
    var rangeChangedShouldBeMonitored: Bool = true
    
    let feedbackOptions: [String]
    let feedbackHandler: (AIUserFeedbackVoteState, [String]) async -> Bool
    
    var textIsChanged: Bool {
        self.displayedValue != self.originalValue
    }
    
    init(originalValue: String,
         feedbackOptions: [String],
         feedbackHandler: @escaping ((AIUserFeedbackVoteState, [String]) async -> Bool))
    {
        self.originalValue = originalValue
        self.feedbackOptions = feedbackOptions
        self.feedbackHandler = feedbackHandler
        self.rewriteTextSet = [(NSRange(location: 0, length: originalValue.count), originalValue)]
        self.indexOfCurrentValue = 0
        self.displayedValue = originalValue
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
    
    private var usedSelectedRange: NSRange {
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
        self.refreshContext()
        self.isPresented = false
    }
    
    func revertToOriginalValue() {
        self.rangeChangedShouldBeMonitored = true
        self.selectedRange = self.originalSelectedRange
        self.displayedValue = self.originalValue
        self.rewriteTextSet = [(self.usedSelectedRange, self.originalValue)]
        self.indexOfCurrentValue = 0
        self.selection = nil
        self.lastSelection = nil
        self.waError = nil
        self.canResetSelectedRange = true
        self.customDestination = nil
    }
    
    func refreshContext() {
        self.rangeChangedShouldBeMonitored = true
        self.selectedRange = NSRange(location: self.displayedValue.count, length: 0)
        self.rewriteTextSet = [(self.usedSelectedRange, self.displayedValue)]
        self.indexOfCurrentValue = 0
        self.selection = nil
        self.lastSelection = nil
        self.waError = nil
        self.canResetSelectedRange = true
        self.customDestination = nil
    }
}
