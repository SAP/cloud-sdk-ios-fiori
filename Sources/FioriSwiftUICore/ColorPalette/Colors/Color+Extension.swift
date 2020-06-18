//
//  Color+Extension.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/17/20.
//

import Foundation
import SwiftUI

extension Color {
    /// Extension to `Color`, to return colors from the latest version of preset color palette used by `ThemeManager`.
    ///
    /// - parameter style: `ColorStyle` enum from the color palette.
    /// - parameter scheme: specifies whether the color should be used in front of a *light* background, or a *dark* background.  E.g. a "white" background is a "light" background.  A "dark blue" background is a "dark" background.  Defaults to `.device`.
    /// - Returns: `Color`
    public static func preferredColor(forStyle style: ColorStyle, background scheme: BackgroundColorScheme? = .device) -> Color {
        return ThemeManager.shared.color(for: style, background: scheme)
    }
}
