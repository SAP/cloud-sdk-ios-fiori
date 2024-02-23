import FioriThemeManager
// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
public struct HeaderActionBaseStyle: HeaderActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
        // Add default layout here
        configuration.headerAction
    }
}

// Default fiori styles
public struct HeaderActionFioriStyle: HeaderActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
        HeaderAction(configuration)
            .fioriButtonStyle(FioriTertiaryButtonStyle())
    }
}
