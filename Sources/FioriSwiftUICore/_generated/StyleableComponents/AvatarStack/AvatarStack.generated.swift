// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AvatarStack {
    let avatars: any View
    let avatarsTitle: any View

    @Environment(\.avatarStackStyle) var style

    var componentIdentifier: String = AvatarStack.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@AvatarsBuilder avatars: () -> any View = { EmptyView() },
                @ViewBuilder avatarsTitle: () -> any View = { EmptyView() },
                componentIdentifier: String? = AvatarStack.identifier)
    {
        self.avatars = Avatars(avatars: avatars, componentIdentifier: componentIdentifier)
        self.avatarsTitle = AvatarsTitle(avatarsTitle: avatarsTitle, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? AvatarStack.identifier
    }
}

public extension AvatarStack {
    static let identifier = "fiori_avatarstack_component"
}

public extension AvatarStack {
    init(avatars: [TextOrIcon] = [],
         avatarsTitle: AttributedString? = nil,
         componentIdentifier: String? = AvatarStack.identifier)
    {
        self.init(avatars: { AvatarsListStack(avatars) }, avatarsTitle: { OptionalText(avatarsTitle) }, componentIdentifier: componentIdentifier)
    }
}

public extension AvatarStack {
    init(_ configuration: AvatarStackConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AvatarStackConfiguration, shouldApplyDefaultStyle: Bool) {
        self.avatars = configuration.avatars
        self.avatarsTitle = configuration.avatarsTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AvatarStack: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, avatars: .init(self.avatars), avatarsTitle: .init(self.avatarsTitle))).typeErased
                .transformEnvironment(\.avatarStackStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AvatarStack {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AvatarStack(.init(componentIdentifier: self.componentIdentifier, avatars: .init(self.avatars), avatarsTitle: .init(self.avatarsTitle)))
            .shouldApplyDefaultStyle(false)
            .avatarStackStyle(AvatarStackFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
