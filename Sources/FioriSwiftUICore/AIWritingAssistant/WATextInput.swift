import Combine
import FioriThemeManager
import SwiftUI

public extension View {
    /// This modifier will support writing assistant in your `TextEditor`.
    ///
    /// ## Usage:
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     //A helper action need if you want to do some customization, like retry an operation, update the text directly, or navigate to a custom view.
    ///     @State var helperAction = WAHelperAction.none
    ///     // A binding text is also needed for W.A. that will help to update the text if needed.
    ///     @State private var noteText = "Write your note here..."
    ///
    ///     var body: some View {
    ///         NoteFormView()
    ///             .waTextInput(self.$text, menus: WAMenu.availableMenus, menuHandler: { menu, value in
    ///                 await self.fetchData(for: menu, value: value)
    ///             }, feedbackOptions: feedbackOptions, feedbackHandler: { state, values in
    ///                 await self.submitFeedback(state: state, values: values)
    ///             })
    ///             .waHelperAction(self.$helperAction)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ## Error Handling:
    ///  A `WAError` is accepted by the `menuHandler` and `feedbackHandler`. If an error occurs, it will be used to display an `IllustratedMessage` view.
    ///
    /// ```swift
    /// private func submitFeedback(state: AIUserFeedbackVoteState, values: [String]) async -> WAFeedbackResult {
    ///    try? await Task.sleep(nanoseconds: 1500000000)
    ///    if self.errorOccurred {
    ///        return .failure(WAError(detailImage: FioriIcon.illustrations.simpleConnectionSpot, title: "Error Title", description: "Error Description", action: self.illustratedMessageAction, detailImageSize: .small))
    ///    } else {
    ///        return .success
    ///    }
    /// }
    ///
    /// var illustratedMessageAction: FioriButton {
    ///     FioriButton { _ in
    ///         self.helperAction = .retry
    ///     } label: { _ in
    ///         Text("Retry")
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - text: Binding to the text input.
    ///   - menus: A list of menus that can be used in the writing assistant.
    ///   - menuHandler: A closure that handles the menu when it is selected. You can call your server to fetch necessary updated result for writing assistant.
    ///   - feedbackOptions: An optional list of feedback options that can be used in the writing assistant.
    ///   - feedbackHandler: An optional closure that handles the feedback. You can submit the feedback to your server or do any other necessary actions.
    /// - Returns: A view that supports writing assistant.
    func waTextInput(_ text: Binding<String>,
                     menus: [[WAMenu]],
                     menuHandler: @escaping ((WAMenu, String) async -> WAResult),
                     feedbackOptions: [String] = [],
                     feedbackHandler: ((AIUserFeedbackVoteState, [String]) async -> WAFeedbackResult)?) -> some View
    {
        self.modifier(WATextInputModifier(text: text, menus: menus, menuHandler: menuHandler,
                                          feedbackOptions: feedbackOptions, feedbackHandler: feedbackHandler))
    }
}

struct WATextInputModifier: ViewModifier {
    @Binding var text: String
    
    @StateObject var context: WritingAssistantContext
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @FocusState private var isTextInputFocused: Bool
    @Environment(\.waHelperAction) private var waHelperAction
    @Environment(\.waSheetHeightUpdated) private var waSheetHeightUpdated
    @Environment(\.isLoading) var isLoading
    
    var formView: WritingAssistantForm
    let waAction = WritingAssistantAction()
    
    init(text: Binding<String>,
         menus: [[WAMenu]],
         menuHandler: @escaping ((WAMenu, String) async -> WAResult),
         feedbackOptions: [String] = [],
         feedbackHandler: ((AIUserFeedbackVoteState, [String]) async -> WAFeedbackResult)?)
    {
        self._text = text
        let context = WritingAssistantContext(originalValue: text.wrappedValue,
                                              menus: menus,
                                              menuHandler: menuHandler,
                                              feedbackOptions: feedbackOptions,
                                              feedbackHandler: feedbackHandler)
        self._context = StateObject(wrappedValue: context)
        self.formView = WritingAssistantForm(text: text, menus: menus)
    }
    
    func isSameTextInput(_ l: (any WATextInput)?, _ r: (any WATextInput)?) -> Bool {
        ObjectIdentifier(l as AnyObject) == ObjectIdentifier(r as AnyObject)
    }
    
    // swiftlint:disable function_body_length cyclomatic_complexity
    func body(content: Content) -> some View {
        content
            .modifier(
                FioriIntrospectModifier<UITextView> { textView in
                    self.context.waTextInput = textView
                    self.context.observeSelectionChange(for: textView)
                }
            )
            .modifier(
                FioriIntrospectModifier<UITextField> { textField in
                    self.context.waTextInput = textField
                    self.context.observeSelectionChange(for: textField)
                }
            )
            .focused(self.$isTextInputFocused)
            .onReceive(self.keyboardPublisher) { value in
                if self.context.logKeyboardChanged {
                    let isSameTextInput = self.isSameTextInput(value.1, self.context.waTextInput)
                    if value.0, self.isTextInputFocused, isSameTextInput {
                        self.context.updateInWAFlow(true)
                    } else if value.0, !isSameTextInput {
                        self.context.updateInWAFlow(false)
                    }
                }
            }
            .toolbar {
                #if !os(visionOS)
                    ToolbarItem(placement: .keyboard) {
                        if self.isTextInputFocused, !self.context.isPresented, self.context.isInWAFlow {
                            HStack {
                                Spacer()
                                self.waAction
                                    .fixedSize()
                                    .onSimultaneousTapGesture {
                                        self.context.originalValue = self.text
                                        self.context.updateOriginalSelectedRange()
                                        self.context.isPresented = true
                                    }
                            }
                        }
                    }
                #endif
            }
            .onChange(of: self.context.isInWAFlow) { _, newValue in
                if !newValue {
                    if self.context.showCancelAlert {
                        // show alert will lost the focus, we need restore the selected range manually.
                        self.restoreSelectedRange()
                    } else if self.context.isPresented {
                        if self.context.rewriteTextSet.count > 1 {
                            self.context.showCancelAlert = true
                        } else {
                            self.context.cancelAction()
                        }
                    }
                }
            }
            .onChange(of: self.context.selection) { _, menu in
                if let menu {
                    self.context.startMenuTask(menu: menu)
                    
                    if UIAccessibility.isVoiceOverRunning {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            let formatString = "Text updated to Version %d of %d".localizedFioriString()
                            let versionString = String(format: formatString, self.context.indexOfCurrentValue + 1, self.context.rewriteTextSet.count)

                            UIAccessibility.post(notification: .announcement, argument: versionString)
                        }
                    }
                }
            }
            .onChange(of: self.waHelperAction.wrappedValue) { _, newValue in
                switch newValue {
                case .none:
                    break
                case .retry:
                    if self.context.errorModel.isFeedbackError {
                        self.context.showFeedbackSuccessToast = false
                        self.context.retryFeedbackTask()
                        self.waHelperAction.wrappedValue = .none
                    } else {
                        self.context.selection = self.context.lastSelection
                        self.waHelperAction.wrappedValue = .none
                    }
                case .update(let value):
                    self.context.addNewValue(value, for: nil)
                case .navigateTo(let destination):
                    self.context.customDestination = CustomDestination(destination: destination)
                }
            }
            .onChange(of: self.context.originalValue) { _, _ in
                self.context.displayedValue = self.context.originalValue
            }
            .onChange(of: self.context.displayedValue) { _, newValue in
                self.text = newValue
            }
            .onChange(of: self.context.isPresented) { _, newValue in
                // when cancel alert is shown, we should not switch keyboard.
                if !self.context.showCancelAlert {
                    self.switchKeyboard(useWAPanel: newValue)
                }
            }
            .onChange(of: self.context.selectedRange) { _, newValue in
                if let range = newValue,
                   self.context.rangeChangedShouldBeMonitored,
                   self.context.isInWAFlow
                {
                    self.restoreSelectedRange(by: range)
                }
            }
            .onChange(of: self.context.showCancelAlert) {
                if self.context.showCancelAlert {
                    self.isTextInputFocused = true
                    self.restoreSelectedRange()
                }
            }
            .onDisappear {
                self.context.showCancelAlert = false
                self.context.isPresented = false
            }
            .popover(isPresented: self.$context.isPresented, attachmentAnchor: .point(.center)) {
                self.formView
                    .frame(idealWidth: 400, idealHeight: 400)
                    .environmentObject(self.context)
                    .presentationCompactAdaptation(.sheet)
                    .presentationDetents([.fraction(0.5)])
                    .interactiveDismissDisabled()
                    .presentationDragIndicator(.hidden)
                    .disabled(self.context.inProgress)
                    .toastMessage(isPresented: self.$context.showFeedbackSuccessToast, title: "Thank you for your feedback", duration: 3)
                    .ifApply(UIDevice.isIPhone) {
                        $0.presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.5)))
                    }
                    .background(
                        GeometryReader { proxy in
                            Color.clear
                                .task {
                                    if self.horizontalSizeClass == .compact {
                                        self.waSheetHeightUpdated?(proxy.size.height)
                                    }
                                }
                        }
                    )
                    .onDisappear {
                        self.waSheetHeightUpdated?(0)
                    }
            }
    }
    
    @MainActor func restoreSelectedRange(by range: NSRange? = nil) {
        if let textView = self.context.waTextInput as? UITextView {
            let selectedRange = range ?? self.context.usedSelectedRange
            DispatchQueue.main.async {
                self.context.canResetSelectedRange = false
                textView.select(textView)
                textView.selectedRange = selectedRange
            }
        } else if let textField = self.context.waTextInput as? UITextField {
            let selectedRange = range ?? self.context.usedSelectedRange
            DispatchQueue.main.async {
                self.context.canResetSelectedRange = false
                textField.select(textField)
                textField.selectedRange = selectedRange
            }
        }
    }
    
    @MainActor func switchKeyboard(useWAPanel: Bool) {
        defer {
            self.context.logKeyboardChanged = true
        }
        self.context.logKeyboardChanged = false
        if let textView = self.context.waTextInput as? UITextView {
            if !self.context.isInWAFlow {
                textView.inputView = nil
                textView.isEditable = true
                textView.resignFirstResponder()
                return
            }
            if useWAPanel {
                textView.resignFirstResponder()
                textView.inputView = UIView()
                textView.isEditable = false
                textView.isSelectable = true
                textView.becomeFirstResponder()
            } else {
                self.waSheetHeightUpdated?(0)
                textView.resignFirstResponder()
                textView.inputView = nil
                textView.isEditable = true
                textView.isSelectable = true
                textView.becomeFirstResponder()
            }
        } else if let textField = self.context.waTextInput as? UITextField {
            if !self.context.isInWAFlow {
                textField.inputView = nil
                textField.resignFirstResponder()
                return
            }
            if useWAPanel {
                textField.resignFirstResponder()
                textField.inputView = UIView()
                textField.becomeFirstResponder()
            } else {
                self.waSheetHeightUpdated?(0)
                textField.resignFirstResponder()
                textField.inputView = nil
                textField.becomeFirstResponder()
            }
        }
    }
    
    var keyboardPublisher: AnyPublisher<(keyboardShown: Bool, textView: (any WATextInput)?), Never> {
        Publishers.Merge(
            NotificationCenter
                .default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .map { _ in
                    if let textView = UIResponder.findFirstResponder() as? UITextView {
                        return (true, textView)
                    } else if let textField = UIResponder.findFirstResponder() as? UITextField {
                        return (true, textField)
                    } else {
                        return (true, nil)
                    }
                },
            NotificationCenter
                .default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in
                    if let textView = UIResponder.findFirstResponder() as? UITextView {
                        return (false, textView)
                    } else if let textField = UIResponder.findFirstResponder() as? UITextField {
                        return (false, textField)
                    } else {
                        return (false, nil)
                    }
                }
        )
        .eraseToAnyPublisher()
    }
}

extension Notification.Name {
    static let UITextViewSelectionDidChange = Notification.Name("UITextViewSelectionDidChange")
}

extension WritingAssistantContext {
    func observeSelectionChange(for textView: UITextView) {
        selectionKVO?.invalidate()
        selectionKVO = textView.observe(\.selectedTextRange, options: [.new]) { [weak self] tv, _ in
            guard let self else { return }
            if let range = tv.selectedTextRange {
                let start = tv.offset(from: tv.beginningOfDocument, to: range.start)
                let end = tv.offset(from: tv.beginningOfDocument, to: range.end)
                let nsRange = NSRange(location: start, length: end - start)
                self.resetSelectedRange(nsRange)
            }
        }
    }
    
    func observeSelectionChange(for textField: UITextField) {
        selectionKVO?.invalidate()
        selectionKVO = textField.observe(\.selectedTextRange, options: [.new]) { [weak self] tv, _ in
            guard let self else { return }
            if let range = tv.selectedTextRange {
                let start = tv.offset(from: tv.beginningOfDocument, to: range.start)
                let end = tv.offset(from: tv.beginningOfDocument, to: range.end)
                let nsRange = NSRange(location: start, length: end - start)
                self.resetSelectedRange(nsRange)
            }
        }
    }
}

protocol WATextInput: Equatable {
    var isFirstResponder: Bool { get }
    var selectedRange: NSRange { get set }
}

extension UITextField: WATextInput {}
extension UITextView: WATextInput {}

extension UITextField {
    var selectedRange: NSRange {
        get {
            if let range = self.selectedTextRange {
                let start = self.offset(from: self.beginningOfDocument, to: range.start)
                let end = self.offset(from: self.beginningOfDocument, to: range.end)
                let selectedRange = NSRange(location: start, length: end - start)
                return selectedRange
            } else {
                return NSRange(location: self.text?.count ?? 0, length: 0)
            }
        }
        set {
            if let start = self.position(from: self.beginningOfDocument, offset: newValue.location),
               let end = self.position(from: start, offset: newValue.length),
               let selectedRange = self.textRange(from: start, to: end)
            {
                self.selectedTextRange = selectedRange
            }
        }
    }
}

private weak var currentWAFirstResponder: UIResponder?

extension UIResponder {
    static func findFirstResponder() -> UIResponder? {
        currentWAFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trapFirstResponder), to: nil, from: nil, for: nil)
        return currentWAFirstResponder
    }

    @objc private func _trapFirstResponder() {
        currentWAFirstResponder = self
    }
}
