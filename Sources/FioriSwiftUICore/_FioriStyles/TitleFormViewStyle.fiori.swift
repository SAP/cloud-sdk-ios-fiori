import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TitleFormView`.
public struct TitleFormViewBaseStyle: TitleFormViewStyle {
    @FocusState var isFocused: Bool
    
    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        VStack(alignment: .leading) {
            configuration._placeholderTextField
                .focused(self.$isFocused)
                .disabled(self.getDisabled(configuration))
        }
        .textInputInfoView(isPresented: Binding(get: { self.isInfoViewNeeded(configuration) }, set: { _ in }), description: self.getInfoString(configuration), counter: self.getCounterString(configuration))
        .padding(.top, -1)
        .padding(.bottom, self.isInfoViewNeeded(configuration) ? -12 : -1)
        .accessibilityElement(children: .combine)
        .accessibilityHint(self.getAccessibilityHint(configuration, isFocused: self.isFocused))
        .disabled(configuration.controlState == .disabled)
    }

    func getDisabled(_ configuration: TitleFormViewConfiguration) -> Bool {
        !TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getEditable()
    }

    func getCounterString(_ configuration: TitleFormViewConfiguration) -> AttributedString? {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getCounterString()
    }

    func getInfoString(_ configuration: TitleFormViewConfiguration) -> AttributedString? {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getInfoString()
    }

    func isInfoViewNeeded(_ configuration: TitleFormViewConfiguration) -> Bool {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isInfoViewNeeded()
    }

    func getAccessibilityHint(_ configuration: TitleFormViewConfiguration, isFocused: Bool) -> String {
        var accHintString = ""

        switch configuration.controlState {
        case .normal:
            if isFocused {
                if configuration.text.isEmpty {
                    accHintString = NSLocalizedString("Text field, is editing", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Text field, is editing")
                } else {
                    accHintString = NSLocalizedString("Text field, is editing. Double tap to clear text", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Text field, is editing. Double tap to clear text")
                }
            } else {
                accHintString = NSLocalizedString("Text field, Double tap to edit", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Text field, Double tap to edit")
            }
        default:
            break
        }

        return accHintString
    }
}

// Default fiori styles
extension TitleFormViewFioriStyle {
    struct ContentFioriStyle: TitleFormViewStyle {
        @FocusState var isFocused: Bool

        func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
            VStack {
                TitleFormView(configuration)
                    .foregroundStyle(self.getTextColor(configuration))
                    .font(.fiori(forTextStyle: .body))
                    .accentColor(self.getCursorColor(configuration))
                    .focused(self.$isFocused)
                    .textInputInfoViewStyle { config in
                        let isError = self.isErrorStyle(configuration)
                        let style: any TextInputInfoViewStyle = isError ? .error : .fiori
                        TextInputInfoView(config)
                            .textInputInfoViewStyle(style)
                            .typeErased
                            .padding(.top, -4)
                    }
                    .placeholderTextFieldStyle { config in
                        PlaceholderTextField(config)
                            .setOnChange(of: configuration.text, action1: { s in
                                self.checkCharCount(configuration, textString: s)
                            }) { _, s in
                                self.checkCharCount(configuration, textString: s)
                            }
                            .background(self.getBackgroundColor(configuration))
                    }
            }
        }

        func getTextColor(_ configuration: TitleFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getTextColor()
        }

        func getCursorColor(_ configuration: TitleFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getCursorColor()
        }

        func getBackgroundColor(_ configuration: TitleFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getBackgroundColor()
        }

        func isErrorStyle(_ configuration: TitleFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isErrorStyle()
        }

        func isInfoViewNeeded(_ configuration: TitleFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isInfoViewNeeded()
        }

        func checkCharCount(_ configuration: TitleFormViewConfiguration, textString: String) {
            guard let maxTextLength = configuration.maxTextLength, maxTextLength > 0 else {
                return
            }
            if !(configuration.allowsBeyondLimit == true), textString.count > maxTextLength {
                configuration.text = String(textString.prefix(maxTextLength))
            }
        }
    }

    struct TextInputFieldFioriStyle: TextInputFieldStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        
        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            TextInputField(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct PlaceholderTextFieldFioriStyle: PlaceholderTextFieldStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        
        func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
            PlaceholderTextField(configuration)
        }
    }

    struct FormViewFioriStyle: FormViewStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}

// Default nss styles
extension TitleFormViewNSSStyle {
    struct ContentNSSStyle: TitleFormViewStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
            TitleFormView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TextInputFieldNSSStyle: TextInputFieldStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            TextInputField(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for TextInputField
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct PlaceholderNSSStyle: PlaceholderStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Placeholder
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct PlaceholderTextFieldNSSStyle: PlaceholderTextFieldStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
            PlaceholderTextField(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for PlaceholderTextField
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct FormViewNSSStyle: FormViewStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for FormView
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
