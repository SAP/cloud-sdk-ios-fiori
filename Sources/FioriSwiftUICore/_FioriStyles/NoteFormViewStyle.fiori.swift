import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `NoteFormView`.
public struct NoteFormViewBaseStyle: NoteFormViewStyle {
    @FocusState var isFocused: Bool

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        VStack(alignment: .leading) {
            configuration._placeholderTextEditor
                .focused(self.$isFocused)
                .disabled(self.getDisabled(configuration))
        }
        .textInputInfoView(isPresented: Binding(get: { self.isInfoViewNeeded(configuration) }, set: { _ in }), description: self.getInfoString(configuration), counter: self.getCounterString(configuration))
        .accessibilityElement(children: .combine)
        .accessibilityHint(configuration.controlState == .normal ? (self.isFocused ? NSLocalizedString("Text field, is editing", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Text field, is editing") : NSLocalizedString("Text field, Double tap to edit", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Text field, Double tap to edit")) : "")
    }

    func getDisabled(_ configuration: NoteFormViewConfiguration) -> Bool {
        !TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getEditable()
    }

    func getCounterString(_ configuration: NoteFormViewConfiguration) -> AttributedString? {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getCounterString()
    }

    func getInfoString(_ configuration: NoteFormViewConfiguration) -> AttributedString? {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getInfoString()
    }

    func isInfoViewNeeded(_ configuration: NoteFormViewConfiguration) -> Bool {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isInfoViewNeeded()
    }
}

// Default fiori styles
extension NoteFormViewFioriStyle {
    struct ContentFioriStyle: NoteFormViewStyle {
        @FocusState var isFocused: Bool

        @ViewBuilder
        func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
            NoteFormView(configuration)
                .accentColor(self.getCursorColor(configuration))
                .focused(self.$isFocused)
                .textInputInfoViewStyle { config in
                    let isError = self.isErrorStyle(configuration)
                    let style: any TextInputInfoViewStyle = isError ? .error : .fiori
                    TextInputInfoView(config)
                        .textInputInfoViewStyle(style)
                        .typeErased
                        .padding(.top, -8)
                }
                .placeholderTextEditorStyle { config in
                    PlaceholderTextEditor(config)
                        .frame(minHeight: self.getMinHeight(configuration))
                        .frame(maxHeight: self.getMaxHeight(configuration))
                        .background(self.getBackgroundColor(configuration))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(self.getBorderColor(configuration), lineWidth: self.getBorderWidth(configuration))
                        )
                        .cornerRadius(8)
                        .setOnChange(of: configuration.text, action1: { s in
                            self.checkCharCount(configuration, textString: s)
                        }) { _, s in
                            self.checkCharCount(configuration, textString: s)
                        }
                        .padding(.bottom, self.isInfoViewNeeded(configuration) ? 0 : 7)
                }
                .textViewStyle { config in
                    TextView(config)
                        .foregroundStyle(self.getTextColor(configuration))
                        .font(.fiori(forTextStyle: .body))
                }
                .padding(.top, 7)
        }

        func getTextColor(_ configuration: NoteFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getTextColor()
        }

        func getCursorColor(_ configuration: NoteFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getCursorColor()
        }
        
        func getBorderColor(_ configuration: NoteFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getBorderColor()
        }

        func getBackgroundColor(_ configuration: NoteFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getBackgroundColor()
        }

        func getBorderWidth(_ configuration: NoteFormViewConfiguration) -> CGFloat {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getBorderWidth()
        }

        func isErrorStyle(_ configuration: NoteFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isErrorStyle()
        }

        func isInfoViewNeeded(_ configuration: NoteFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isInfoViewNeeded()
        }

        func getMinHeight(_ configuration: NoteFormViewConfiguration) -> CGFloat {
            // TextEditor will add some other views that the minHeight is 16pt higher than the specified. Use this to adjust.
            let minHeightAdjustment = 16.0
            guard let minHeight = configuration.minTextEditorHeight else {
                return 88 - minHeightAdjustment
            }
            guard minHeight > 44 else {
                return 88 - minHeightAdjustment
            }
            return minHeight - minHeightAdjustment
        }

        func getMaxHeight(_ configuration: NoteFormViewConfiguration) -> CGFloat {
            guard let maxHeight = configuration.maxTextEditorHeight else {
                return .infinity
            }
            let minHeght = self.getMinHeight(configuration)
            return maxHeight > minHeght ? maxHeight : minHeght
        }

        func checkCharCount(_ configuration: NoteFormViewConfiguration, textString: String) {
            guard let maxTextLength = configuration.maxTextLength, maxTextLength > 0 else {
                return
            }
            if !(configuration.allowsBeyondLimit == true), textString.count > maxTextLength {
                configuration.text = String(textString.prefix(maxTextLength))
            }
        }
    }

    struct TextViewFioriStyle: TextViewStyle {
        let noteFormViewConfiguration: NoteFormViewConfiguration
        
        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        let noteFormViewConfiguration: NoteFormViewConfiguration
        
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct PlaceholderTextEditorFioriStyle: PlaceholderTextEditorStyle {
        let noteFormViewConfiguration: NoteFormViewConfiguration
        
        func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
            PlaceholderTextEditor(configuration)
        }
    }

    struct FormViewFioriStyle: FormViewStyle {
        let noteFormViewConfiguration: NoteFormViewConfiguration
        
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}

// Default nss styles
extension NoteFormViewNSSStyle {
    struct ContentNSSStyle: NoteFormViewStyle {
        let noteFormViewConfiguration: NoteFormViewConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
            NoteFormView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TextViewNSSStyle: TextViewStyle {
        let noteFormViewConfiguration: NoteFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for TextView
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct PlaceholderNSSStyle: PlaceholderStyle {
        let noteFormViewConfiguration: NoteFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Placeholder
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct PlaceholderTextEditorNSSStyle: PlaceholderTextEditorStyle {
        let noteFormViewConfiguration: NoteFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
            PlaceholderTextEditor(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for PlaceholderTextEditor
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct FormViewNSSStyle: FormViewStyle {
        let noteFormViewConfiguration: NoteFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for FormView
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
