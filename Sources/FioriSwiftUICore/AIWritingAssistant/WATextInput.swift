import Combine
import FioriThemeManager
import SwiftUI

public extension View {
    /// This modifier will support writing assistant in your text input e.g. `TextEditor` or `TextField`.
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
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @FocusState private var isTextViewFocused: Bool
    @Environment(\.waHelperAction) private var waHelperAction

    var formView: WritingAssistantForm
    let waAction = WritingAssistantAction()
    
    init(text: Binding<String>,
         menus: [[WAMenu]],
         menuHandler: @escaping ((WAMenu, String) async -> WAResult),
         feedbackOptions: [String] = [],
         feedbackHandler: ((AIUserFeedbackVoteState, [String]) async -> WAFeedbackResult)?)
    {
        self._text = text
        self.formView = WritingAssistantForm(text: text, menus: menus)
        self._context = StateObject(wrappedValue: WritingAssistantContext(originalValue: text.wrappedValue,
                                                                          menus: menus,
                                                                          menuHandler: menuHandler,
                                                                          feedbackOptions: feedbackOptions,
                                                                          feedbackHandler: feedbackHandler))
    }
    
    // swiftlint:disable function_body_length
    func body(content: Content) -> some View {
        content
            .focused(self.$isTextViewFocused)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    if !self.context.isPresented, self.isTextViewFocused {
                        HStack {
                            Spacer()
                            self.waAction
                                .onSimultaneousTapGesture {
                                    self.context.updateOriginalSelectedRange()
                                    self.context.isPresented = true
                                }
                        }
                    }
                }
            }
            .onChange(of: self.isTextViewFocused) { _, newValue in
                if !newValue {
                    if self.context.showCancelAlert {
                        // show alert will lost the focus, we need restore the selected range manually.
                        self.restoreSelectedRange()
                    } else {
                        // save context when lost focus.
                        if self.context.isPresented {
                            self.context.aiWritingDone()
                            self.context.isPresented = false
                        }
                    }
                }
            }
            .modifier(
                FioriIntrospectModifier<UITextView> { textView in
                    self.context.textView = textView
                    self.context.textField = nil
                    textView.delegate = self.context
                }
            )
            .modifier(
                FioriIntrospectModifier<UITextField> { textField in
                    self.context.textField = textField
                    self.context.textView = nil
                    textField.delegate = self.context
                }
            )
            .onChange(of: self.context.selection) { _, menu in
                if let menu {
                    self.context.startMenuTask(menu: menu)
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
                   self.isTextViewFocused
                {
                    self.restoreSelectedRange(by: range)
                }
            }
            .popover(isPresented: self.$context.isPresented, attachmentAnchor: .point(.center)) {
                self.formView
                    .frame(idealWidth: 400, idealHeight: 400)
                    .environmentObject(self.context)
                    .presentationCompactAdaptation(.sheet)
                    .presentationDetents([.medium, .fraction(0.5)])
                    .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                    .interactiveDismissDisabled()
                    .presentationDragIndicator(.hidden)
                    .disabled(self.context.inProgress)
                    .toastMessage(isPresented: self.$context.showFeedbackSuccessToast, title: "Thank you for your feedback", duration: 3)
            }
    }
    
    @MainActor func restoreSelectedRange(by range: NSRange? = nil) {
        if let textView = self.context.textView,
           let selectedRange = range ?? self.context.selectedRange
        {
            DispatchQueue.main.async {
                self.context.canResetSelectedRange = false
                textView.select(textView)
                textView.selectedRange = selectedRange
            }
        } else if let textField = self.context.textField,
                  let selectedRange = range ?? self.context.selectedRange
        {
            DispatchQueue.main.async {
                self.context.canResetSelectedRange = false
                textField.select(textField)
                textField.resetSelectedTextRange(by: selectedRange)
            }
        }
    }
    
    @MainActor func switchKeyboard(useWAPanel: Bool) {
        if let textView = self.context.textView {
            if !self.isTextViewFocused {
                textView.inputView = nil
                textView.isEditable = true
                textView.resignFirstResponder()
                return
            }
            if useWAPanel {
                textView.resignFirstResponder()
                textView.inputView = UIView()
                textView.isEditable = false
                textView.becomeFirstResponder()
            } else {
                textView.resignFirstResponder()
                textView.inputView = nil
                textView.isEditable = true
                textView.becomeFirstResponder()
            }
        } else if let textField = self.context.textField {
            if !self.isTextViewFocused {
                textField.inputView = nil
                textField.resignFirstResponder()
                return
            }
            let currentRange = textField.selectedRange
            if useWAPanel {
                textField.resignFirstResponder()
                textField.inputView = UIView()
                textField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
                textField.inputView = nil
                textField.becomeFirstResponder()
            }
            textField.resetSelectedTextRange(by: currentRange)
        }
    }
}

extension WritingAssistantContext: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        self.resetSelectedRange(textView.selectedRange)
    }
}

extension WritingAssistantContext: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.resetSelectedRange(textField.selectedRange)
    }
}

extension UITextField {
    var selectedRange: NSRange {
        if let range = self.selectedTextRange {
            let start = self.offset(from: self.beginningOfDocument, to: range.start)
            let end = self.offset(from: self.beginningOfDocument, to: range.end)
            let selectedRange = NSRange(location: start, length: end - start)
            return selectedRange
        } else {
            return NSRange(location: self.text?.count ?? 0, length: 0)
        }
    }
    
    func resetSelectedTextRange(by range: NSRange) {
        if let start = self.position(from: self.beginningOfDocument, offset: range.location),
           let end = self.position(from: start, offset: range.length),
           let selectedRange = self.textRange(from: start, to: end)
        {
            self.selectedTextRange = selectedRange
        }
    }
}
