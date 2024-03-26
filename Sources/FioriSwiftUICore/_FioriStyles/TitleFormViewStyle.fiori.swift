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
        .backgroundStyle(.red)
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
                    }
                    .placeholderTextFieldStyle { config in
                        PlaceholderTextField(config)
                            .onChange(of: configuration.text) { s in
                                self.checkCharCount(configuration, textString: s)
                            }
                            .background(self.getBackgroundColor(configuration))
                    }
                    .padding(.top, 0)
                    .padding(.bottom, self.isInfoViewNeeded(configuration) ? -9 : 0)
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
        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            TextInputField(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct PlaceholderTextFieldFioriStyle: PlaceholderTextFieldStyle {
        func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
            PlaceholderTextField(configuration)
        }
    }

    struct FormViewFioriStyle: FormViewStyle {
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}
