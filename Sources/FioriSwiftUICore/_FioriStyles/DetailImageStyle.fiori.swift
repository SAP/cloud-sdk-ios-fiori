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
public struct DetailImageBaseStyle: DetailImageStyle {
    public func makeBody(_ configuration: DetailImageConfiguration) -> some View {
        configuration.detailImage
    }
}

// Default fiori styles
public struct DetailImageFioriStyle: DetailImageStyle {
    public func makeBody(_ configuration: DetailImageConfiguration) -> some View {
        DetailImage(configuration)
    }
}
