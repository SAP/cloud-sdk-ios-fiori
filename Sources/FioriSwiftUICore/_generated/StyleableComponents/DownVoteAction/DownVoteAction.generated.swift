// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct DownVoteAction {
    let downVoteAction: any View

    @Environment(\.downVoteActionStyle) var style

    var componentIdentifier: String = DownVoteAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder downVoteAction: () -> any View = { FioriButton { _ in FioriIcon.actions.thumbDown } },
                componentIdentifier: String? = DownVoteAction.identifier)
    {
        self.downVoteAction = downVoteAction()
        self.componentIdentifier = componentIdentifier ?? DownVoteAction.identifier
    }
}

public extension DownVoteAction {
    static let identifier = "fiori_downvoteaction_component"
}

public extension DownVoteAction {
    init(downVoteAction: FioriButton? = FioriButton { _ in FioriIcon.actions.thumbDown }) {
        self.init(downVoteAction: { downVoteAction })
    }
}

public extension DownVoteAction {
    init(_ configuration: DownVoteActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DownVoteActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.downVoteAction = configuration.downVoteAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DownVoteAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, downVoteAction: .init(self.downVoteAction))).typeErased
                .transformEnvironment(\.downVoteActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DownVoteAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DownVoteAction(.init(componentIdentifier: self.componentIdentifier, downVoteAction: .init(self.downVoteAction)))
            .shouldApplyDefaultStyle(false)
            .downVoteActionStyle(.fiori)
            .typeErased
    }
}
