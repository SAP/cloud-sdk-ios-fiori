// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Avatars {
    let avatars: any View

    @Environment(\.avatarsStyle) var style

    var componentIdentifier: String = Avatars.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@AvatarsBuilder avatars: () -> any View = { EmptyView() },
                componentIdentifier: String? = Avatars.identifier)
    {
        self.avatars = avatars()
        self.componentIdentifier = componentIdentifier ?? Avatars.identifier
    }
}

public extension Avatars {
    static let identifier = "fiori_avatars_component"
}

public extension Avatars {
    init(avatars: [TextOrIcon] = [],
         componentIdentifier: String? = Avatars.identifier)
    {
        self.init(avatars: { AvatarsListStack(avatars) }, componentIdentifier: componentIdentifier)
    }
}

public extension Avatars {
    init(_ configuration: AvatarsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AvatarsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.avatars = configuration.avatars
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Avatars: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, avatars: .init(self.avatars))).typeErased
                .transformEnvironment(\.avatarsStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Avatars {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Avatars(.init(componentIdentifier: self.componentIdentifier, avatars: .init(self.avatars)))
            .shouldApplyDefaultStyle(false)
            .avatarsStyle(.fiori)
            .typeErased
    }
}
