import FioriThemeManager
import SwiftUI

extension FioriButtonStyle where Self == AnyFioriButtonStyle {
    /// The shared button style for the "What's New" primary CTA
    /// (the list view's "Start" button and the page builder's "Next/Start" button).
    ///
    /// Interactive tinted glass on Liquid Glass systems (iOS 26+), falling back to
    /// the primary Fiori button style on earlier versions.
    /// - Parameter maxWidth: The maximum width of the button. Defaults to `200`.
    static func whatsNewPrimary(maxWidth: CGFloat = 200) -> AnyFioriButtonStyle {
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            FioriCustomizeGlassButtonStyle(maxWidth: maxWidth).eraseToAnyFioriButtonStyle()
        } else {
            FioriPrimaryButtonStyle(maxWidth).eraseToAnyFioriButtonStyle()
        }
    }
}
