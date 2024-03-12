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
public struct FormViewBaseStyle: FormViewStyle {
    public func makeBody(_ configuration: FormViewConfiguration) -> some View {
        // Add default layout here
        FormView(configuration)
    }
}

// Default fiori styles
extension FormViewFioriStyle {
    struct ContentFioriStyle: FormViewStyle {
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
            // Add default style for its content
            // .background()
        }
    }
}
