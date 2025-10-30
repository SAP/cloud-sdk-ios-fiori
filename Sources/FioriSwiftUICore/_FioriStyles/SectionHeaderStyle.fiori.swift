import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SectionHeaderBaseStyle: SectionHeaderStyle {
    @Environment(\.isLoading) var isLoading
    public func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
        SkeletonLoadingContainer {
            HStack {
                configuration.title
                    .lineLimit(1)
                Spacer()
                HStack {
                    configuration.attribute
                        .lineLimit(1)
                        .multilineTextAlignment(.trailing)
                    
                    if configuration.sectionHeaderStyle == .attribute {
                        AccessoryIcon {
                            AccessoryType.disclosure.image
                        }
                    }
                }
                .accessibilityElement(children: .combine)
                .accessibilityAddTraits((configuration.didSelectHandler != nil) ? .isButton : .isStaticText)
            }
            .padding([.top, .bottom], configuration.sectionHeaderStyle == .title ? 10 : 12)
            .contentShape(Rectangle())
            .onTapGesture {
                configuration.didSelectHandler?()
            }
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
        @Environment(\.isLoading) var isLoading
        let sectionHeaderConfiguration: SectionHeaderConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : (self.sectionHeaderConfiguration.sectionHeaderStyle == .title ? .secondaryLabel : .primaryLabel)))
                .font(.fiori(forTextStyle: self.sectionHeaderConfiguration.sectionHeaderStyle == .title ? .subheadline : .body))
        }
    }

    struct AttributeFioriStyle: AttributeStyle {
        @Environment(\.isLoading) var isLoading
        let sectionHeaderConfiguration: SectionHeaderConfiguration

        func makeBody(_ configuration: AttributeConfiguration) -> some View {
            Attribute(configuration)
                .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : .primaryLabel))
                .font(.fiori(forTextStyle: .body))
        }
    }
}

/// The style determines whether disclosureAccessory of SectionHeader is hidden.
public struct SectionHeaderAccessoryStyle: SectionHeaderStyle {
    @Environment(\.isLoading) var isLoading
    public var isDisclosureAccessoryHidden: Bool
    public func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
        SkeletonLoadingContainer {
            HStack {
                configuration.title
                    .lineLimit(1)
                    .sectionHeaderStyle(.titleStyle(.fiori))
                Spacer()
                HStack {
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
                .accessibilityElement(children: .combine)
                .accessibilityAddTraits((configuration.didSelectHandler != nil) ? [.isHeader, .isButton] : [.isHeader, .isStaticText])
            }
            .padding([.top, .bottom], configuration.sectionHeaderStyle == .title ? 10 : 12)
            .contentShape(Rectangle())
            .onTapGesture {
                configuration.didSelectHandler?()
            }
        }
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
