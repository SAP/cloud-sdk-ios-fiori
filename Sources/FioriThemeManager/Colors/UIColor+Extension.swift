import Foundation
import UIKit

public extension UIColor {
    /// Extension to `UIColor`, to return colors from the latest version of preset color palette used by `ThemeManager`.
    ///
    /// - parameters:
    ///     - style: `ColorStyle` enum from the color palette.
    ///     - scheme: specifies whether the color should be used in front of a *light* background, or a *dark* background.  E.g. a "white" background is a "light" background.  A "dark blue" background is a "dark" background.  Defaults to `.device`.
    ///     - level: specifies whether the color sould be used in the *base* or *elevated* level of the interface. E.g. alerts and popovers will be assigned with the *elevated* interface level. Defaults to `.device`.
    /// - Returns: a dynamic color provider wrapped in `UIColor`
    static func preferredColor(_ style: ColorStyle, background scheme: BackgroundColorScheme? = .device, interface level: InterfaceLevel? = .device, display mode: ColorDisplayMode? = .device) -> UIColor {
        ThemeManager.shared.uiColor(for: style, background: scheme, interface: level, display: mode)
    }
}
