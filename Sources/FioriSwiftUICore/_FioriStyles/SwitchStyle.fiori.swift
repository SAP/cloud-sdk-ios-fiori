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
public struct SwitchBaseStyle: SwitchStyle {
    public func makeBody(_ configuration: SwitchConfiguration) -> some View {
        // Add default layout here
        Toggle(isOn: configuration.$isOn, label: {})
            .labelsHidden()
    }
}

// Default fiori styles
public struct SwitchFioriStyle: SwitchStyle {
    public func makeBody(_ configuration: SwitchConfiguration) -> some View {
        Switch(configuration)
        // Add default style here
    }
}
