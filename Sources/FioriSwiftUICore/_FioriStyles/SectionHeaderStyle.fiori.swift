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
                .lineLimit(1)
            Spacer()
            configuration.attribute
                .lineLimit(1)
                .multilineTextAlignment(.trailing)
            
            if configuration.sectionHeaderStyle == .attribute {
                AccessoryIcon {
                    AccessoryType.disclosure.image
                }
            }
        }
        .padding([.top, .bottom], configuration.sectionHeaderStyle == .title ? 10 : 12)
        .contentShape(Rectangle())
        .onTapGesture {
            configuration.didSelectHandler?()
        }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits((configuration.didSelectHandler != nil) ? [.isHeader, .isButton] : [.isHeader, .isStaticText])
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
                .foregroundStyle(Color.preferredColor(self.sectionHeaderConfiguration.sectionHeaderStyle == .title ? .secondaryLabel : .primaryLabel))
                .font(.fiori(forTextStyle: self.sectionHeaderConfiguration.sectionHeaderStyle == .title ? .subheadline : .body))
        }
    }

    struct AttributeFioriStyle: AttributeStyle {
        let sectionHeaderConfiguration: SectionHeaderConfiguration

        func makeBody(_ configuration: AttributeConfiguration) -> some View {
            Attribute(configuration)
                // Add default style for Attribute
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .body))
        }
    }
}

/// The style determines whether disclosureAccessory of SectionHeader is hidden.
public struct SectionHeaderAccessoryStyle: SectionHeaderStyle {
    public var isDisclosureAccessoryHidden: Bool
    public func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
        HStack {
            configuration.title
                .lineLimit(1)
                .sectionHeaderStyle(.titleStyle(.fiori))
            Spacer()
            configuration.attribute
                .lineLimit(1)
                .sectionHeaderStyle(.attributeStyle(.fiori))
                .multilineTextAlignment(.trailing)
                
            if self.isDisclosureAccessoryHidden {
                EmptyView()
            } else {
                AccessoryIcon {
                    AccessoryType.disclosure.image
                }
            }
        }
        .padding([.top, .bottom], configuration.sectionHeaderStyle == .title ? 10 : 12)
        .contentShape(Rectangle())
        .onTapGesture {
            configuration.didSelectHandler?()
        }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits((configuration.didSelectHandler != nil) ? [.isHeader, .isButton] : [.isHeader, .isStaticText])
    }
}

/// The style determines whether disclosureAccessory of SectionHeader is hidden.
public extension SectionHeaderStyle where Self == SectionHeaderAccessoryStyle {
    /// Set disclosureAccessory is hidden or visible.
    /// - Parameter isHidden: Indicates if the disclosureAccessory is hidden or visible.
    /// - Returns: SectionHeaderAccessoryStyle
    static func isDisclosureAccessoryHidden(isHidden: Bool) -> SectionHeaderAccessoryStyle {
        SectionHeaderAccessoryStyle(isDisclosureAccessoryHidden: isHidden)
    }
}
