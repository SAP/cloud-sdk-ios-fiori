// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct UpVoteAction {
    let upVoteAction: any View

    @Environment(\.upVoteActionStyle) var style

    var componentIdentifier: String = UpVoteAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder upVoteAction: () -> any View = { FioriButton { _ in FioriIcon.actions.thumbUp } },
                componentIdentifier: String? = UpVoteAction.identifier)
    {
        self.upVoteAction = upVoteAction()
        self.componentIdentifier = componentIdentifier ?? UpVoteAction.identifier
    }
}

public extension UpVoteAction {
    static let identifier = "fiori_upvoteaction_component"
}

public extension UpVoteAction {
    init(upVoteAction: FioriButton? = FioriButton { _ in FioriIcon.actions.thumbUp }) {
        self.init(upVoteAction: { upVoteAction })
    }
}

public extension UpVoteAction {
    init(_ configuration: UpVoteActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: UpVoteActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.upVoteAction = configuration.upVoteAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension UpVoteAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, upVoteAction: .init(self.upVoteAction))).typeErased
                .transformEnvironment(\.upVoteActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension UpVoteAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        UpVoteAction(.init(componentIdentifier: self.componentIdentifier, upVoteAction: .init(self.upVoteAction)))
            .shouldApplyDefaultStyle(false)
            .upVoteActionStyle(.fiori)
            .typeErased
    }
}
