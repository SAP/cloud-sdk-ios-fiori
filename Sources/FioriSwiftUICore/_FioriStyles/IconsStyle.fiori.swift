import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct IconsBaseStyle: IconsStyle {
    public func makeBody(_ configuration: IconsConfiguration) -> some View {
        configuration.icons
    }
}

// Default fiori styles
public struct IconsFioriStyle: IconsStyle {
    public func makeBody(_ configuration: IconsConfiguration) -> some View {
        Icons(configuration)
    }
}