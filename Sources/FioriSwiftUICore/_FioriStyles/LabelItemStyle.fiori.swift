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
        let labelItemConfiguration: LabelItemConfiguration
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                // Add default style for Icon
                .foregroundColor(.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .subheadline))
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let labelItemConfiguration: LabelItemConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                .foregroundColor(.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .subheadline))
                .lineLimit(1)
        }
    }
}

// Default nss styles
extension LabelItemNSSStyle {
    struct ContentNSSStyle: LabelItemStyle {
        let labelItemConfiguration: LabelItemConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: LabelItemConfiguration) -> some View {
            LabelItem(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct IconNSSStyle: IconStyle {
        let labelItemConfiguration: LabelItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Icon
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TitleNSSStyle: TitleStyle {
        let labelItemConfiguration: LabelItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Title
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
