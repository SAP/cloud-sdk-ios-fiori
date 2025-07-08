// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol WritingAssistantFormStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: WritingAssistantFormConfiguration) -> Body
}

struct AnyWritingAssistantFormStyle: WritingAssistantFormStyle {
    let content: (WritingAssistantFormConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (WritingAssistantFormConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: WritingAssistantFormConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct WritingAssistantFormConfiguration {
    public var componentIdentifier: String = "fiori_writingassistantform_component"
    public let cancelAction: CancelAction
    public let doneAction: DoneAction
    public let closeAction: CloseAction
    public let backAction: BackAction
    public let undoAction: UndoAction
    public let redoAction: RedoAction
    public let upVoteAction: UpVoteAction
    public let downVoteAction: DownVoteAction
    public let footnote: Footnote
    @Binding public var text: String
    public let menus: [[WAMenu]]

    public typealias CancelAction = ConfigurationViewWrapper
    public typealias DoneAction = ConfigurationViewWrapper
    public typealias CloseAction = ConfigurationViewWrapper
    public typealias BackAction = ConfigurationViewWrapper
    public typealias UndoAction = ConfigurationViewWrapper
    public typealias RedoAction = ConfigurationViewWrapper
    public typealias UpVoteAction = ConfigurationViewWrapper
    public typealias DownVoteAction = ConfigurationViewWrapper
    public typealias Footnote = ConfigurationViewWrapper
}

extension WritingAssistantFormConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct WritingAssistantFormFioriStyle: WritingAssistantFormStyle {
    public func makeBody(_ configuration: WritingAssistantFormConfiguration) -> some View {
        WritingAssistantForm(configuration)
            .cancelActionStyle(CancelActionFioriStyle(writingAssistantFormConfiguration: configuration))
            .doneActionStyle(DoneActionFioriStyle(writingAssistantFormConfiguration: configuration))
            .closeActionStyle(CloseActionFioriStyle(writingAssistantFormConfiguration: configuration))
            .backActionStyle(BackActionFioriStyle(writingAssistantFormConfiguration: configuration))
            .undoActionStyle(UndoActionFioriStyle(writingAssistantFormConfiguration: configuration))
            .redoActionStyle(RedoActionFioriStyle(writingAssistantFormConfiguration: configuration))
            .upVoteActionStyle(UpVoteActionFioriStyle(writingAssistantFormConfiguration: configuration))
            .downVoteActionStyle(DownVoteActionFioriStyle(writingAssistantFormConfiguration: configuration))
            .footnoteStyle(FootnoteFioriStyle(writingAssistantFormConfiguration: configuration))
    }
}
