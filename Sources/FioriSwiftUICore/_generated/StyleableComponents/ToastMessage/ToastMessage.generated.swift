// Generated using Sourcery 2.2.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct ToastMessage {
    let icon: any View
    let title: any View
    /// The duration in seconds for which the toast message is shown. The default value is `1`.
    let duration: Double
    /// The position of the toast message relative to its parent view. `.center` puts the toast message in the center of its parent view, `.above` aligns it above the view, and `.below` aligns it below the view. The default value is `.center`.
    let position: ToastMessagePosition
    /// The amount of spacing to put in between the toast message and the frame of its parent view. This only applies to the `.above` and `.below` positions, and negative values are converted to `0`. The default value is `0`.
    let spacing: CGFloat
    /// A number specifying how rounded the corners of the view should be. The default value is `14`.
    let cornerRadius: CGFloat
    /// The background color of the view. The default value is `Color.preferredColor(.tertiaryFill)`.
    let backgroundColor: Color
    /// The width of the border surrounding the toast message. The default value is `0`.
    let borderWidth: CGFloat
    /// The color of the border surrounding the toast message. The default value is `Color.clear`.
    let borderColor: Color
    /// The width of the border surrounding the toast message when Increase Contrast is enabled. The default value is `1`.
    let borderWidthIC: CGFloat
    /// The color of the border surrounding the toast message when Increase Contrast is enabled. The default value is `Color.preferredColor(.tertiaryLabel)`.
    let borderColorIC: Color
    /// A shadow to render underneath the view. The default value is `FioriShadowStyle.level3`.
    let shadow: FioriShadowStyle?

    @Environment(\.toastMessageStyle) var style

    var componentIdentifier: String = ToastMessage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                duration: Double = 1,
                position: ToastMessagePosition = .center,
                spacing: CGFloat = 0,
                cornerRadius: CGFloat = 14,
                backgroundColor: Color = Color.preferredColor(.tertiaryFill),
                borderWidth: CGFloat = 0,
                borderColor: Color = Color.clear,
                borderWidthIC: CGFloat = 1,
                borderColorIC: Color = Color.preferredColor(.tertiaryLabel),
                shadow: FioriShadowStyle? = FioriShadowStyle.level3,
                componentIdentifier: String? = ToastMessage.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.duration = duration
        self.position = position
        self.spacing = spacing
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.borderWidthIC = borderWidthIC
        self.borderColorIC = borderColorIC
        self.shadow = shadow
        self.componentIdentifier = componentIdentifier ?? ToastMessage.identifier
    }
}

public extension ToastMessage {
    static let identifier = "fiori_toastmessage_component"
}

public extension ToastMessage {
    init(icon: Image? = nil,
         title: AttributedString,
         duration: Double = 1,
         position: ToastMessagePosition = .center,
         spacing: CGFloat = 0,
         cornerRadius: CGFloat = 14,
         backgroundColor: Color = Color.preferredColor(.tertiaryFill),
         borderWidth: CGFloat = 0,
         borderColor: Color = Color.clear,
         borderWidthIC: CGFloat = 1,
         borderColorIC: Color = Color.preferredColor(.tertiaryLabel),
         shadow: FioriShadowStyle? = FioriShadowStyle.level3)
    {
        self.init(icon: { icon }, title: { Text(title) }, duration: duration, position: position, spacing: spacing, cornerRadius: cornerRadius, backgroundColor: backgroundColor, borderWidth: borderWidth, borderColor: borderColor, borderWidthIC: borderWidthIC, borderColorIC: borderColorIC, shadow: shadow)
    }
}

public extension ToastMessage {
    init(_ configuration: ToastMessageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ToastMessageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.title = configuration.title
        self.duration = configuration.duration
        self.position = configuration.position
        self.spacing = configuration.spacing
        self.cornerRadius = configuration.cornerRadius
        self.backgroundColor = configuration.backgroundColor
        self.borderWidth = configuration.borderWidth
        self.borderColor = configuration.borderColor
        self.borderWidthIC = configuration.borderWidthIC
        self.borderColorIC = configuration.borderColorIC
        self.shadow = configuration.shadow
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ToastMessage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), duration: self.duration, position: self.position, spacing: self.spacing, cornerRadius: self.cornerRadius, backgroundColor: self.backgroundColor, borderWidth: self.borderWidth, borderColor: self.borderColor, borderWidthIC: self.borderWidthIC, borderColorIC: self.borderColorIC, shadow: self.shadow)).typeErased
                .transformEnvironment(\.toastMessageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ToastMessage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ToastMessage(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), duration: self.duration, position: self.position, spacing: self.spacing, cornerRadius: self.cornerRadius, backgroundColor: self.backgroundColor, borderWidth: self.borderWidth, borderColor: self.borderColor, borderWidthIC: self.borderWidthIC, borderColorIC: self.borderColorIC, shadow: self.shadow))
            .shouldApplyDefaultStyle(false)
            .toastMessageStyle(ToastMessageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
