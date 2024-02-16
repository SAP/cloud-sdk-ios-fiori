import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct ActionBaseStyle: ActionStyle {
    public func makeBody(_ configuration: ActionConfiguration) -> some View {
        // Add default layout here
        configuration.action
    }
}

// Default fiori styles
public struct ActionFioriStyle: ActionStyle {
    public func makeBody(_ configuration: ActionConfiguration) -> some View {
        Action(configuration)
        // Add default style here
    }
}
