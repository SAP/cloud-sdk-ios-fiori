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
public struct ProgressBaseStyle: ProgressStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ProgressConfiguration) -> some View {
        // Add default layout here
        configuration.progress
    }
}

// Default fiori styles
public struct ProgressFioriStyle: ProgressStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ProgressConfiguration) -> some View {
        Progress(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}
