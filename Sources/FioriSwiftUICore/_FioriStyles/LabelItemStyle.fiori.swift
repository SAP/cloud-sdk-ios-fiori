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
public struct LabelItemBaseStyle: LabelItemStyle {
    public func makeBody(_ configuration: LabelItemConfiguration) -> some View {
        // Add default layout here
        HStack(alignment: .firstTextBaseline, spacing: 2) {
            if configuration.alignment ?? .leading == .trailing {
                configuration.title
                configuration.icon
            } else {
                configuration.icon
                configuration.title
            }
        }
    }
}

// Default fiori styles
extension LabelItemFioriStyle {
    struct ContentFioriStyle: LabelItemStyle {
        func makeBody(_ configuration: LabelItemConfiguration) -> some View {
            LabelItem(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct IconFioriStyle: IconStyle {
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                // Add default style for Icon
                .foregroundColor(.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .subheadline))
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                .foregroundColor(.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .subheadline))
        }
    }
}
