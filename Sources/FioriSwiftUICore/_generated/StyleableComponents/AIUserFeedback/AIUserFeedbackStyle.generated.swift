// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AIUserFeedbackStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AIUserFeedbackConfiguration) -> Body
}

struct AnyAIUserFeedbackStyle: AIUserFeedbackStyle {
    let content: (AIUserFeedbackConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AIUserFeedbackConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AIUserFeedbackConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AIUserFeedbackConfiguration {
    public var componentIdentifier: String = "fiori_aiuserfeedback_component"
    public let detailImage: DetailImage
    public let title: Title
    public let description: Description
    public let action: Action
    public let secondaryAction: SecondaryAction
    public let detailImageSize: IllustratedMessage.DetailImageSize?
    public let isActionVerticallyAligned: Bool
    public let contentAlignment: HorizontalAlignment
    public let submitAction: SubmitAction
    public let cancelAction: CancelAction
    public let navigationTitle: AttributedString?
    public let filterFormView: FilterFormView?
    public let keyValueFormView: KeyValueFormView?
    public let displayMode: AIUserFeedbackDisplayMode
    public let isBackgroundInteractionEnabled: Bool
    public let errorView: ErrorView
    public let onCancel: (() -> Void)?
    public let onUpVote: (() -> Void)?
    public let onDownVote: (() -> Void)?
    public let onSubmit: ((_ voteState: AIUserFeedbackVoteState, _ feedbacks: [String], _ additional: String, _ submitStateUpdate: @escaping (AIUserFeedbackSubmitState) -> Void) -> Void)?
    public let voteState: AIUserFeedbackVoteState

    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
    public typealias SecondaryAction = ConfigurationViewWrapper
    public typealias SubmitAction = ConfigurationViewWrapper
    public typealias CancelAction = ConfigurationViewWrapper
    public typealias ErrorView = ConfigurationViewWrapper
}

extension AIUserFeedbackConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct AIUserFeedbackFioriStyle: AIUserFeedbackStyle {
    public func makeBody(_ configuration: AIUserFeedbackConfiguration) -> some View {
        AIUserFeedback(configuration)
            .detailImageStyle(DetailImageFioriStyle(aIUserFeedbackConfiguration: configuration))
            .titleStyle(TitleFioriStyle(aIUserFeedbackConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(aIUserFeedbackConfiguration: configuration))
            .actionStyle(ActionFioriStyle(aIUserFeedbackConfiguration: configuration))
            .secondaryActionStyle(SecondaryActionFioriStyle(aIUserFeedbackConfiguration: configuration))
            .submitActionStyle(SubmitActionFioriStyle(aIUserFeedbackConfiguration: configuration))
            .cancelActionStyle(CancelActionFioriStyle(aIUserFeedbackConfiguration: configuration))
            .illustratedMessageStyle(IllustratedMessageFioriStyle(aIUserFeedbackConfiguration: configuration))
    }
}
