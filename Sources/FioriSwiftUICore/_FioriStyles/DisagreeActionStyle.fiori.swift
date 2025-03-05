import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment the following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct DisagreeActionBaseStyle: DisagreeActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DisagreeActionConfiguration) -> some View {
        // Add default layout here
        configuration.disagreeAction
    }
}

// Default fiori styles
public struct DisagreeActionFioriStyle: DisagreeActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DisagreeActionConfiguration) -> some View {
        DisagreeAction(configuration)
    }
}
