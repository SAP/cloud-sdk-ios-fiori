// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `AIUserFeedback` is used to display a feedback page with customizable title, description, navigation title, filter form view and key value form view.
/// `AIUserFeedback` can be presented modally using .sheet, or pushed onto a navigation stack.
/// ## Usage
/// ```swift
/// @State var voteState: AIUserFeedbackVoteState = .notDetermined
/// @State var submitButtonState: AIUserFeedbackSubmitButtonState = .normal
/// @State var filterFormViewSelectionValue: [Int] = [0]
/// @State var valueText: String = ""
/// let valueOptions: [AttributedString] = ["Inaccuraies", "Inappropriate Content", "Security Risks", "Slow Response", "Repetitive or Wordy", "Others"]
/// let filterFormView = FilterFormView(title: "Select all that apply", isRequired: true, options: valueOptions, errorMessage: nil, isEnabled: true, allowsMultipleSelection: true, allowsEmptySelection: false, value: self.$filterFormViewSelectionValue, buttonSize: .fixed, onValueChange: { value in
///    print("FilterFormView value change: \(value)")
/// })
/// let keyValueFormView = KeyValueFormView(title: "Additional feedback", text: self.$valueText, placeholder: "Write additional comments here", errorMessage: nil, minTextEditorHeight: 88, maxTextEditorHeight: 200, maxTextLength: 200, hintText: AttributedString("Hint Text"), isCharCountEnabled: true, allowsBeyondLimit: false, isRequired: true)
///
/// AIUserFeedback(title: { Title(title: "How was your AI experience?") },
///             description: { Text("Please rate your experience to help us improve.") },
///             navigationTitle: "Feedback" ,
///             filterFormView: filterFormView,
///             keyValueFormView: keyValueFormView,
///             displayMode: .sheet,
///             onCancel: {
///
///             }, onUpVote: {
///
///             }, onDownVote: {
///
///             }, onSubmit: { voteState, feedbacks, additional, submitResult in
///                 submitResult(true)
///             }, voteState: $voteState,
///             submitButtonState: $submitButtonState)
/// ```
///  ### Toggle:
/// ```swift
/// @State var isFeedbackPresented = false
/// Button {
///     isFeedbackPresented.toggle()
/// } label: {
///     Text("Present AI User Feedback")
/// }
/// .popover(isPresented: $isFeedbackPresented) {
///     AIUserFeedback
/// }
/// ```
public struct AIUserFeedback {
    let detailImage: any View
    let title: any View
    let description: any View
    let action: any View
    let secondaryAction: any View
    /// Specifies the size of the detailImage. This value should be an enum from the DetailImageSize set.
    let detailImageSize: IllustratedMessage.DetailImageSize?
    /// Determines the layout of the action buttons. If set to true, the buttons will be arranged vertically. If set to false, they will be arranged horizontally. The default value is false.
    let isActionVerticallyAligned: Bool
    /// Determines the alignment of the title, description and the action buttons in the horizontal mode. The default value e is `.leading`.
    let contentAlignment: HorizontalAlignment
    let submitAction: any View
    let cancelAction: any View
    let navigationTitle: AttributedString?
    /// The view for selecting the reasons for negative feedback.
    let filterFormView: FilterFormView?
    /// The view for inputting additional reason for negative feedback.
    let keyValueFormView: KeyValueFormView?
    /// Indicate whether the AIUserFeedback is pushed in, poped up or as an inspector. Default value is `.sheet`.
    /// When it is pushed in, the height of sheet is fixed. The drag indicator is hidden, sheet can not be dragged.
    let displayMode: AIUserFeedbackDisplayMode
    /// Whether the user can interact with the background when AIUserFeedback is presented as a modal..
    let isBackgroundInteractionEnabled: Bool
    /// The custom error view when an error occurs when submitting.
    let errorView: any View
    /// The action to be performed when the cancel button is tapped.
    let onCancel: (() -> Void)?
    /// The action to be performed when the up vote button is tapped.
    let onUpVote: (() -> Void)?
    /// The action to be performed when the down vote button is tapped.
    let onDownVote: (() -> Void)?
    /// The action to be performed when the submit button is tapped.
    /// Application can get the user feedback values, can tell the component the submition result with the `submitResult` call back.
    let onSubmit: ((_ voteState: AIUserFeedbackVoteState, _ feedbacks: [String], _ additional: String, _ submitResult: @escaping (Bool) -> Void) -> Void)?
    @Binding var voteState: AIUserFeedbackVoteState
    @Binding var submitButtonState: AIUserFeedbackSubmitButtonState

    @Environment(\.aIUserFeedbackStyle) var style

    var componentIdentifier: String = AIUserFeedback.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder secondaryAction: () -> any View = { EmptyView() },
                detailImageSize: IllustratedMessage.DetailImageSize? = nil,
                isActionVerticallyAligned: Bool = false,
                contentAlignment: HorizontalAlignment = .leading,
                @ViewBuilder submitAction: () -> any View = { EmptyView() },
                @ViewBuilder cancelAction: () -> any View = { FioriButton { _ in Text("Cancel".localizedFioriString()) } },
                navigationTitle: AttributedString? = nil,
                filterFormView: FilterFormView? = nil,
                keyValueFormView: KeyValueFormView? = nil,
                displayMode: AIUserFeedbackDisplayMode = .sheet,
                isBackgroundInteractionEnabled: Bool = false,
                @ViewBuilder errorView: () -> any View = { EmptyView() },
                onCancel: (() -> Void)? = nil,
                onUpVote: (() -> Void)? = nil,
                onDownVote: (() -> Void)? = nil,
                onSubmit: ((_ voteState: AIUserFeedbackVoteState, _ feedbacks: [String], _ additional: String, _ submitResult: @escaping (Bool) -> Void) -> Void)? = nil,
                voteState: Binding<AIUserFeedbackVoteState>,
                submitButtonState: Binding<AIUserFeedbackSubmitButtonState>,
                componentIdentifier: String? = AIUserFeedback.identifier)
    {
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self.secondaryAction = SecondaryAction(secondaryAction: secondaryAction, componentIdentifier: componentIdentifier)
        self.detailImageSize = detailImageSize
        self.isActionVerticallyAligned = isActionVerticallyAligned
        self.contentAlignment = contentAlignment
        self.submitAction = SubmitAction(submitAction: submitAction, componentIdentifier: componentIdentifier)
        self.cancelAction = CancelAction(cancelAction: cancelAction, componentIdentifier: componentIdentifier)
        self.navigationTitle = navigationTitle
        self.filterFormView = filterFormView
        self.keyValueFormView = keyValueFormView
        self.displayMode = displayMode
        self.isBackgroundInteractionEnabled = isBackgroundInteractionEnabled
        self.errorView = errorView()
        self.onCancel = onCancel
        self.onUpVote = onUpVote
        self.onDownVote = onDownVote
        self.onSubmit = onSubmit
        self._voteState = voteState
        self._submitButtonState = submitButtonState
        self.componentIdentifier = componentIdentifier ?? AIUserFeedback.identifier
    }
}

public extension AIUserFeedback {
    static let identifier = "fiori_aiuserfeedback_component"
}

public extension AIUserFeedback {
    init(detailImage: Image? = nil,
         title: AttributedString,
         description: AttributedString? = nil,
         action: FioriButton? = nil,
         secondaryAction: FioriButton? = nil,
         detailImageSize: IllustratedMessage.DetailImageSize? = nil,
         isActionVerticallyAligned: Bool = false,
         contentAlignment: HorizontalAlignment = .leading,
         submitAction: FioriButton? = nil,
         cancelAction: FioriButton? = FioriButton { _ in Text("Cancel".localizedFioriString()) },
         navigationTitle: AttributedString? = nil,
         filterFormView: FilterFormView? = nil,
         keyValueFormView: KeyValueFormView? = nil,
         displayMode: AIUserFeedbackDisplayMode = .sheet,
         isBackgroundInteractionEnabled: Bool = false,
         errorView: IllustratedMessage? = nil,
         onCancel: (() -> Void)? = nil,
         onUpVote: (() -> Void)? = nil,
         onDownVote: (() -> Void)? = nil,
         onSubmit: ((_ voteState: AIUserFeedbackVoteState, _ feedbacks: [String], _ additional: String, _ submitResult: @escaping (Bool) -> Void) -> Void)? = nil,
         voteState: Binding<AIUserFeedbackVoteState>,
         submitButtonState: Binding<AIUserFeedbackSubmitButtonState>)
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, description: { OptionalText(description) }, action: { action }, secondaryAction: { secondaryAction }, detailImageSize: detailImageSize, isActionVerticallyAligned: isActionVerticallyAligned, contentAlignment: contentAlignment, submitAction: { submitAction }, cancelAction: { cancelAction }, navigationTitle: navigationTitle, filterFormView: filterFormView, keyValueFormView: keyValueFormView, displayMode: displayMode, isBackgroundInteractionEnabled: isBackgroundInteractionEnabled, errorView: { errorView }, onCancel: onCancel, onUpVote: onUpVote, onDownVote: onDownVote, onSubmit: onSubmit, voteState: voteState, submitButtonState: submitButtonState)
    }
}

public extension AIUserFeedback {
    init(_ configuration: AIUserFeedbackConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AIUserFeedbackConfiguration, shouldApplyDefaultStyle: Bool) {
        self.detailImage = configuration.detailImage
        self.title = configuration.title
        self.description = configuration.description
        self.action = configuration.action
        self.secondaryAction = configuration.secondaryAction
        self.detailImageSize = configuration.detailImageSize
        self.isActionVerticallyAligned = configuration.isActionVerticallyAligned
        self.contentAlignment = configuration.contentAlignment
        self.submitAction = configuration.submitAction
        self.cancelAction = configuration.cancelAction
        self.navigationTitle = configuration.navigationTitle
        self.filterFormView = configuration.filterFormView
        self.keyValueFormView = configuration.keyValueFormView
        self.displayMode = configuration.displayMode
        self.isBackgroundInteractionEnabled = configuration.isBackgroundInteractionEnabled
        self.errorView = configuration.errorView
        self.onCancel = configuration.onCancel
        self.onUpVote = configuration.onUpVote
        self.onDownVote = configuration.onDownVote
        self.onSubmit = configuration.onSubmit
        self._voteState = configuration.$voteState
        self._submitButtonState = configuration.$submitButtonState
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AIUserFeedback: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action), secondaryAction: .init(self.secondaryAction), detailImageSize: self.detailImageSize, isActionVerticallyAligned: self.isActionVerticallyAligned, contentAlignment: self.contentAlignment, submitAction: .init(self.submitAction), cancelAction: .init(self.cancelAction), navigationTitle: self.navigationTitle, filterFormView: self.filterFormView, keyValueFormView: self.keyValueFormView, displayMode: self.displayMode, isBackgroundInteractionEnabled: self.isBackgroundInteractionEnabled, errorView: .init(self.errorView), onCancel: self.onCancel, onUpVote: self.onUpVote, onDownVote: self.onDownVote, onSubmit: self.onSubmit, voteState: self.$voteState, submitButtonState: self.$submitButtonState)).typeErased
                .transformEnvironment(\.aIUserFeedbackStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AIUserFeedback {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AIUserFeedback(.init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action), secondaryAction: .init(self.secondaryAction), detailImageSize: self.detailImageSize, isActionVerticallyAligned: self.isActionVerticallyAligned, contentAlignment: self.contentAlignment, submitAction: .init(self.submitAction), cancelAction: .init(self.cancelAction), navigationTitle: self.navigationTitle, filterFormView: self.filterFormView, keyValueFormView: self.keyValueFormView, displayMode: self.displayMode, isBackgroundInteractionEnabled: self.isBackgroundInteractionEnabled, errorView: .init(self.errorView), onCancel: self.onCancel, onUpVote: self.onUpVote, onDownVote: self.onDownVote, onSubmit: self.onSubmit, voteState: self.$voteState, submitButtonState: self.$submitButtonState))
            .shouldApplyDefaultStyle(false)
            .aIUserFeedbackStyle(AIUserFeedbackFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
