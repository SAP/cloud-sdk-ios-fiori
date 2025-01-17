// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct OffStarImage {
    /// / The image to be used for "Off" rating star.
    let offStarImage: any View

    @Environment(\.offStarImageStyle) var style

    var componentIdentifier: String = OffStarImage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder offStarImage: () -> any View,
                componentIdentifier: String? = OffStarImage.identifier)
    {
        self.offStarImage = offStarImage()
        self.componentIdentifier = componentIdentifier ?? OffStarImage.identifier
    }
}

public extension OffStarImage {
    static let identifier = "fiori_offstarimage_component"
}

public extension OffStarImage {
    init(offStarImage: Image = FioriIcon.actions.unfavorite.renderingMode(.template).resizable(),
         componentIdentifier: String? = OffStarImage.identifier)
    {
        self.init(offStarImage: { offStarImage }, componentIdentifier: componentIdentifier)
    }
}

public extension OffStarImage {
    init(_ configuration: OffStarImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: OffStarImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.offStarImage = configuration.offStarImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension OffStarImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, offStarImage: .init(self.offStarImage))).typeErased
                .transformEnvironment(\.offStarImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension OffStarImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        OffStarImage(.init(componentIdentifier: self.componentIdentifier, offStarImage: .init(self.offStarImage)))
            .shouldApplyDefaultStyle(false)
            .offStarImageStyle(.fiori)
            .typeErased
    }
}
