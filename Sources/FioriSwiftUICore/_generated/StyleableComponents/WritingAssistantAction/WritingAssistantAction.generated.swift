// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct WritingAssistantAction {
    let writingAssistantAction: any View

    @Environment(\.writingAssistantActionStyle) var style

    var componentIdentifier: String = WritingAssistantAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder writingAssistantAction: () -> any View = { FioriButton._writingAssistantButton },
                componentIdentifier: String? = WritingAssistantAction.identifier)
    {
        self.writingAssistantAction = writingAssistantAction()
        self.componentIdentifier = componentIdentifier ?? WritingAssistantAction.identifier
    }
}

public extension WritingAssistantAction {
    static let identifier = "fiori_writingassistantaction_component"
}

public extension WritingAssistantAction {
    init(writingAssistantAction: FioriButton? = FioriButton._writingAssistantButton) {
        self.init(writingAssistantAction: { writingAssistantAction })
    }
}

public extension WritingAssistantAction {
    init(_ configuration: WritingAssistantActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: WritingAssistantActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.writingAssistantAction = configuration.writingAssistantAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension WritingAssistantAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, writingAssistantAction: .init(self.writingAssistantAction))).typeErased
                .transformEnvironment(\.writingAssistantActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension WritingAssistantAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        WritingAssistantAction(.init(componentIdentifier: self.componentIdentifier, writingAssistantAction: .init(self.writingAssistantAction)))
            .shouldApplyDefaultStyle(false)
            .writingAssistantActionStyle(.fiori)
            .typeErased
    }
}
