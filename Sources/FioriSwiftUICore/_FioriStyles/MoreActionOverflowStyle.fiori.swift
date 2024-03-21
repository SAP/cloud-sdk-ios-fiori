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
public struct MoreActionOverflowBaseStyle: MoreActionOverflowStyle {
    @ViewBuilder
    public func makeBody(_ configuration: MoreActionOverflowConfiguration) -> some View {
        // Add default layout here
        configuration.moreActionOverflow
    }
}

// Default fiori styles
public struct MoreActionOverflowFioriStyle: MoreActionOverflowStyle {
    @ViewBuilder
    public func makeBody(_ configuration: MoreActionOverflowConfiguration) -> some View {
        MoreActionOverflow(configuration)
    }
}
