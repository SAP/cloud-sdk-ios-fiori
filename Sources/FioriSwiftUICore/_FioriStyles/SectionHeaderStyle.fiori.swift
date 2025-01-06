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
public struct SectionHeaderBaseStyle: SectionHeaderStyle {
    public func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
        // Add default layout here
        HStack {
            configuration.title
            Spacer()
            configuration.attribute
                .multilineTextAlignment(.trailing)
        }
    }
}

// Default fiori styles
extension SectionHeaderFioriStyle {
    struct ContentFioriStyle: SectionHeaderStyle {
        func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
            SectionHeader(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let sectionHeaderConfiguration: SectionHeaderConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .headline))
        }
    }

    struct AttributeFioriStyle: AttributeStyle {
        let sectionHeaderConfiguration: SectionHeaderConfiguration

        func makeBody(_ configuration: AttributeConfiguration) -> some View {
            Attribute(configuration)
            // Add default style for Attribute
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}
