// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AvatarsTitle {
    let avatarsTitle: any View

    @Environment(\.avatarsTitleStyle) var style

    var componentIdentifier: String = AvatarsTitle.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder avatarsTitle: () -> any View = { EmptyView() },
                componentIdentifier: String? = AvatarsTitle.identifier)
    {
        self.avatarsTitle = avatarsTitle()
        self.componentIdentifier = componentIdentifier ?? AvatarsTitle.identifier
    }
}

public extension AvatarsTitle {
    static let identifier = "fiori_avatarstitle_component"
}

public extension AvatarsTitle {
    init(avatarsTitle: AttributedString? = nil) {
        self.init(avatarsTitle: { OptionalText(avatarsTitle) })
    }
}

public extension AvatarsTitle {
    init(_ configuration: AvatarsTitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AvatarsTitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.avatarsTitle = configuration.avatarsTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AvatarsTitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, avatarsTitle: .init(self.avatarsTitle))).typeErased
                .transformEnvironment(\.avatarsTitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AvatarsTitle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AvatarsTitle(.init(componentIdentifier: self.componentIdentifier, avatarsTitle: .init(self.avatarsTitle)))
            .shouldApplyDefaultStyle(false)
            .avatarsTitleStyle(.fiori)
            .typeErased
    }
}
