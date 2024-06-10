import FioriThemeManager
import Foundation
import SwiftUI

//
/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct AccessoryIconBaseStyle: AccessoryIconStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AccessoryIconConfiguration) -> some View {
        // Add default layout here
        configuration.accessoryIcon
    }
}

// Default fiori styles
public struct AccessoryIconFioriStyle: AccessoryIconStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AccessoryIconConfiguration) -> some View {
        AccessoryIcon(configuration)
    }
}
