// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct OnStarImage {
    /// The image to be used for "On" rating star.
    let onStarImage: any View

    @Environment(\.onStarImageStyle) var style

    var componentIdentifier: String = OnStarImage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder onStarImage: () -> any View,
                componentIdentifier: String? = OnStarImage.identifier)
    {
        self.onStarImage = onStarImage()
        self.componentIdentifier = componentIdentifier ?? OnStarImage.identifier
    }
}

public extension OnStarImage {
    static let identifier = "fiori_onstarimage_component"
}

public extension OnStarImage {
    init(onStarImage: Image = FioriIcon.actions.favorite.renderingMode(.template).resizable()) {
        self.init(onStarImage: { onStarImage })
    }
}

public extension OnStarImage {
    init(_ configuration: OnStarImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: OnStarImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.onStarImage = configuration.onStarImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension OnStarImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, onStarImage: .init(self.onStarImage))).typeErased
                .transformEnvironment(\.onStarImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension OnStarImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        OnStarImage(.init(componentIdentifier: self.componentIdentifier, onStarImage: .init(self.onStarImage)))
            .shouldApplyDefaultStyle(false)
            .onStarImageStyle(.fiori)
            .typeErased
    }
}
