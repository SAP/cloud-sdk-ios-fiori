// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct HalfStarImage {
    /// / The image to be used for "half" rating star.
    let halfStarImage: any View

    @Environment(\.halfStarImageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder halfStarImage: () -> any View) {
        self.halfStarImage = halfStarImage()
    }
}

public extension HalfStarImage {
    init(halfStarImage: Image = FioriIcon.actions.halfStar.renderingMode(.template).resizable()) {
        self.init(halfStarImage: { halfStarImage })
    }
}

public extension HalfStarImage {
    init(_ configuration: HalfStarImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: HalfStarImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.halfStarImage = configuration.halfStarImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension HalfStarImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(halfStarImage: .init(self.halfStarImage))).typeErased
                .transformEnvironment(\.halfStarImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension HalfStarImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        HalfStarImage(.init(halfStarImage: .init(self.halfStarImage)))
            .shouldApplyDefaultStyle(false)
            .halfStarImageStyle(.fiori)
            .typeErased
    }
}
