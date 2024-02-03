// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Icons {
    let icons: any View

    @Environment(\.iconsStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@IconBuilder icons: () -> any View = { EmptyView() }) {
        self.icons = icons()
    }
}

public extension Icons {
    init(icons: [TextOrIcon] = []) {
        self.init(icons: { IconStack(icons) })
    }
}

public extension Icons {
    init(_ configuration: IconsConfiguration) {
        self.icons = configuration.icons
        self._shouldApplyDefaultStyle = false
    }
}

extension Icons: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(icons: .init(self.icons))).typeErased
                .transformEnvironment(\.iconsStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Icons {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Icons(icons: { self.icons })
            .shouldApplyDefaultStyle(false)
            .iconsStyle(.fiori)
    }
}
