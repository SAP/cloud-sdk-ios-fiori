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
public struct FilterFeedbackBarBaseStyle: FilterFeedbackBarStyle {
    public func makeBody(_ configuration: FilterFeedbackBarConfiguration) -> some View {
        // Add default layout here
        configuration.items
            .onModelUpdateAppCallback(configuration.onUpdate ?? {})
    }
}

// Default fiori styles
extension FilterFeedbackBarFioriStyle {
    struct ContentFioriStyle: FilterFeedbackBarStyle {
        func makeBody(_ configuration: FilterFeedbackBarConfiguration) -> some View {
            FilterFeedbackBar(configuration)
        }
    }
}
