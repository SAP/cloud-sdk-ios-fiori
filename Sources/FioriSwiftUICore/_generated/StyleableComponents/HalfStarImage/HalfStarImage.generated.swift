// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct HalfStarImage {
    /// / The image to be used for "half" rating star.
    let halfStarImage: any View

    @Environment(\.halfStarImageStyle) var style

    var componentIdentifier: String = HalfStarImage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder halfStarImage: () -> any View,
                componentIdentifier: String? = HalfStarImage.identifier)
    {
        self.halfStarImage = halfStarImage()
        self.componentIdentifier = componentIdentifier ?? HalfStarImage.identifier
    }
}

public extension HalfStarImage {
    static let identifier = "fiori_halfstarimage_component"
}

public extension HalfStarImage {
    init(halfStarImage: Image = FioriIcon.actions.halfStar.renderingMode(.template).resizable(),
         componentIdentifier: String? = HalfStarImage.identifier)
    {
        self.init(halfStarImage: { halfStarImage }, componentIdentifier: componentIdentifier)
    }
}

public extension HalfStarImage {
    init(_ configuration: HalfStarImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: HalfStarImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.halfStarImage = configuration.halfStarImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension HalfStarImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, halfStarImage: .init(self.halfStarImage))).typeErased
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
        HalfStarImage(.init(componentIdentifier: self.componentIdentifier, halfStarImage: .init(self.halfStarImage)))
            .shouldApplyDefaultStyle(false)
            .halfStarImageStyle(.fiori)
            .typeErased
    }
}
