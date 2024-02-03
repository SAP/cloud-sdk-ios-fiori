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
public struct NewActionBaseStyle: NewActionStyle {
    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        // Add default layout here
        configuration.newAction
    }
}

// Default fiori styles
public struct NewActionFioriStyle: NewActionStyle {
    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        NewAction(configuration)
        // Add default style here
    }
}
