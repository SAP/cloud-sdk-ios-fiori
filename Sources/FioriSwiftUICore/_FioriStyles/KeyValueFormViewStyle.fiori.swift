import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `KeyValueFormView`.
public struct KeyValueFormViewBaseStyle: KeyValueFormViewStyle {
    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                configuration.title
                if configuration.isRequired {
                    configuration.mandatoryFieldIndicator
                }
                Spacer()
            }
            configuration._noteFormView
        }
        .accessibilityElement(children: .combine)
    }
}
    
// Default fiori styles
extension KeyValueFormViewFioriStyle {
    struct ContentFioriStyle: KeyValueFormViewStyle {
        @FocusState var isFocused: Bool
        func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
            KeyValueFormView(configuration)
                .titleStyle { titleConf in
                    Title(titleConf)
                        .foregroundStyle(self.getTitleColor(configuration))
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                }
                .mandatoryFieldIndicatorStyle { indicatorConf in
                    MandatoryFieldIndicator(indicatorConf)
                        .foregroundStyle(self.getMandatoryIndicatorColor(configuration))
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                }
                .focused(self.$isFocused)
        }

        private func getTitleColor(_ configuration: KeyValueFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getTitleColor()
        }

        private func getMandatoryIndicatorColor(_ configuration: KeyValueFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: false).getTitleColor()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(self.getTitleColor(self.keyValueFormViewConfiguration))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                .padding(.bottom, -4)
                .padding(.top, 11)
        }
        
        private func getTitleColor(_ configuration: KeyValueFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: false).getTitleColor()
        }
        
        private func isDisabled(_ configuration: KeyValueFormViewConfiguration) -> Bool {
            configuration.controlState == .disabled
        }

        private func isErrorStyle(_ configuration: KeyValueFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: false).isErrorStyle()
        }
    }

    struct TextViewFioriStyle: TextViewStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct NoteFormViewFioriStyle: NoteFormViewStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
            NoteFormView(configuration)
        }
    }
    
    struct MandatoryFieldIndicatorFioriStyle: MandatoryFieldIndicatorStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
            MandatoryFieldIndicator(configuration)
                .foregroundStyle(Color.preferredColor(self.keyValueFormViewConfiguration.controlState == .disabled ? .separator : .primaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                .padding(.bottom, -4)
                .padding(.top, 11)
        }
    }
}

// Default nss styles
extension KeyValueFormViewNSSStyle {
    struct ContentNSSStyle: KeyValueFormViewStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
            KeyValueFormView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TitleNSSStyle: TitleStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Title
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TextViewNSSStyle: TextViewStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for TextView
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct PlaceholderNSSStyle: PlaceholderStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Placeholder
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct MandatoryFieldIndicatorNSSStyle: MandatoryFieldIndicatorStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
            MandatoryFieldIndicator(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for MandatoryFieldIndicator
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct NoteFormViewNSSStyle: NoteFormViewStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
            NoteFormView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for NoteFormView
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
