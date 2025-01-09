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
public struct SectionFooterBaseStyle: SectionFooterStyle {
    public func makeBody(_ configuration: SectionFooterConfiguration) -> some View {
        // Add default layout here
        HStack {
            configuration.title
                .lineLimit(1)
            Spacer()
            configuration.attribute
                .lineLimit(1)
                .multilineTextAlignment(.trailing)
            
            if configuration.sectionFooterStyle == .attribute {
                AccessoryIcon {
                    AccessoryType.disclosure.image
                }
            }
        }
        .padding([.top, .bottom], configuration.sectionFooterStyle == .title ? 10 : 12)
        .contentShape(Rectangle())
        .onTapGesture {
            configuration.didSelectHandler?()
        }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits((configuration.didSelectHandler != nil) ? [.isStaticText, .isButton] : .isStaticText)
    }
}

// Default fiori styles
extension SectionFooterFioriStyle {
    struct ContentFioriStyle: SectionFooterStyle {
        func makeBody(_ configuration: SectionFooterConfiguration) -> some View {
            SectionFooter(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let sectionFooterConfiguration: SectionFooterConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                .foregroundStyle(Color.preferredColor(self.sectionFooterConfiguration.sectionFooterStyle == .title ? .secondaryLabel : .primaryLabel))
                .font(.fiori(forTextStyle: self.sectionFooterConfiguration.sectionFooterStyle == .title ? .subheadline : .body))
        }
    }

    struct AttributeFioriStyle: AttributeStyle {
        let sectionFooterConfiguration: SectionFooterConfiguration

        func makeBody(_ configuration: AttributeConfiguration) -> some View {
            Attribute(configuration)
                // Add default style for Attribute
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .body))
        }
    }
}

/// The style determines whether disclosureAccessory of SectionFooter is hidden.
public struct SectionFooterAccessoryStyle: SectionFooterStyle {
    public var isDisclosureAccessoryHidden: Bool
    public func makeBody(_ configuration: SectionFooterConfiguration) -> some View {
        HStack {
            configuration.title
                .lineLimit(1)
                .sectionFooterStyle(.titleStyle(.fiori))
            Spacer()
            configuration.attribute
                .lineLimit(1)
                .sectionFooterStyle(.attributeStyle(.fiori))
                .multilineTextAlignment(.trailing)
                
            if self.isDisclosureAccessoryHidden {
                EmptyView()
            } else {
                AccessoryIcon {
                    AccessoryType.disclosure.image
                }
            }
        }
        .padding([.top, .bottom], configuration.sectionFooterStyle == .title ? 10 : 12)
        .contentShape(Rectangle())
        .onTapGesture {
            configuration.didSelectHandler?()
        }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits((configuration.didSelectHandler != nil) ? [.isHeader, .isButton] : [.isHeader, .isStaticText])
    }
}

/// The style determines whether disclosureAccessory of SectionFooter is hidden.
public extension SectionFooterStyle where Self == SectionFooterAccessoryStyle {
    static func isDisclosureAccessoryHidden(isHidden: Bool) -> SectionFooterAccessoryStyle {
        SectionFooterAccessoryStyle(isDisclosureAccessoryHidden: isHidden)
    }
}
