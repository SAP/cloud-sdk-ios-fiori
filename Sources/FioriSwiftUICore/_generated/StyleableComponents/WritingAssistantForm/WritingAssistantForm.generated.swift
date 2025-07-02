// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct WritingAssistantForm {
    let cancelAction: any View
    let doneAction: any View
    let closeAction: any View
    let backAction: any View
    let undoAction: any View
    let redoAction: any View
    let upVoteAction: any View
    let downVoteAction: any View
    let footnote: any View
    @Binding var text: String
    let menus: [[WAMenu]]

    @Environment(\.writingAssistantFormStyle) var style

    var componentIdentifier: String = WritingAssistantForm.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder cancelAction: () -> any View = { FioriButton { _ in Text("Cancel".localizedFioriString()) } },
                @ViewBuilder doneAction: () -> any View = { FioriButton { _ in Text("Done".localizedFioriString()) } },
                @ViewBuilder closeAction: () -> any View = { FioriButton { _ in Image(systemName: "xmark") } },
                @ViewBuilder backAction: () -> any View = { FioriButton._backButton },
                @ViewBuilder undoAction: () -> any View = { FioriButton._undoButton },
                @ViewBuilder redoAction: () -> any View = { FioriButton._redoButton },
                @ViewBuilder upVoteAction: () -> any View = { FioriButton { _ in FioriIcon.actions.thumbUp } },
                @ViewBuilder downVoteAction: () -> any View = { FioriButton { _ in FioriIcon.actions.thumbDown } },
                @ViewBuilder footnote: () -> any View = { EmptyView() },
                text: Binding<String>,
                menus: [[WAMenu]] = [],
                componentIdentifier: String? = WritingAssistantForm.identifier)
    {
        self.cancelAction = CancelAction(cancelAction: cancelAction, componentIdentifier: componentIdentifier)
        self.doneAction = DoneAction(doneAction: doneAction, componentIdentifier: componentIdentifier)
        self.closeAction = CloseAction(closeAction: closeAction, componentIdentifier: componentIdentifier)
        self.backAction = BackAction(backAction: backAction, componentIdentifier: componentIdentifier)
        self.undoAction = UndoAction(undoAction: undoAction, componentIdentifier: componentIdentifier)
        self.redoAction = RedoAction(redoAction: redoAction, componentIdentifier: componentIdentifier)
        self.upVoteAction = UpVoteAction(upVoteAction: upVoteAction, componentIdentifier: componentIdentifier)
        self.downVoteAction = DownVoteAction(downVoteAction: downVoteAction, componentIdentifier: componentIdentifier)
        self.footnote = Footnote(footnote: footnote, componentIdentifier: componentIdentifier)
        self._text = text
        self.menus = menus
        self.componentIdentifier = componentIdentifier ?? WritingAssistantForm.identifier
    }
}

public extension WritingAssistantForm {
    static let identifier = "fiori_writingassistantform_component"
}

public extension WritingAssistantForm {
    init(cancelAction: FioriButton? = FioriButton { _ in Text("Cancel".localizedFioriString()) },
         doneAction: FioriButton? = FioriButton { _ in Text("Done".localizedFioriString()) },
         closeAction: FioriButton? = FioriButton { _ in Image(systemName: "xmark") },
         backAction: FioriButton? = FioriButton._backButton,
         undoAction: FioriButton? = FioriButton._undoButton,
         redoAction: FioriButton? = FioriButton._redoButton,
         upVoteAction: FioriButton? = FioriButton { _ in FioriIcon.actions.thumbUp },
         downVoteAction: FioriButton? = FioriButton { _ in FioriIcon.actions.thumbDown },
         footnote: AttributedString? = nil,
         text: Binding<String>,
         menus: [[WAMenu]] = [])
    {
        self.init(cancelAction: { cancelAction }, doneAction: { doneAction }, closeAction: { closeAction }, backAction: { backAction }, undoAction: { undoAction }, redoAction: { redoAction }, upVoteAction: { upVoteAction }, downVoteAction: { downVoteAction }, footnote: { OptionalText(footnote) }, text: text, menus: menus)
    }
}

public extension WritingAssistantForm {
    init(_ configuration: WritingAssistantFormConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: WritingAssistantFormConfiguration, shouldApplyDefaultStyle: Bool) {
        self.cancelAction = configuration.cancelAction
        self.doneAction = configuration.doneAction
        self.closeAction = configuration.closeAction
        self.backAction = configuration.backAction
        self.undoAction = configuration.undoAction
        self.redoAction = configuration.redoAction
        self.upVoteAction = configuration.upVoteAction
        self.downVoteAction = configuration.downVoteAction
        self.footnote = configuration.footnote
        self._text = configuration.$text
        self.menus = configuration.menus
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension WritingAssistantForm: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, cancelAction: .init(self.cancelAction), doneAction: .init(self.doneAction), closeAction: .init(self.closeAction), backAction: .init(self.backAction), undoAction: .init(self.undoAction), redoAction: .init(self.redoAction), upVoteAction: .init(self.upVoteAction), downVoteAction: .init(self.downVoteAction), footnote: .init(self.footnote), text: self.$text, menus: self.menus)).typeErased
                .transformEnvironment(\.writingAssistantFormStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension WritingAssistantForm {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        WritingAssistantForm(.init(componentIdentifier: self.componentIdentifier, cancelAction: .init(self.cancelAction), doneAction: .init(self.doneAction), closeAction: .init(self.closeAction), backAction: .init(self.backAction), undoAction: .init(self.undoAction), redoAction: .init(self.redoAction), upVoteAction: .init(self.upVoteAction), downVoteAction: .init(self.downVoteAction), footnote: .init(self.footnote), text: self.$text, menus: self.menus))
            .shouldApplyDefaultStyle(false)
            .writingAssistantFormStyle(WritingAssistantFormFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
