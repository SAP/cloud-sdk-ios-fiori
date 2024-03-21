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
                .placeholderTextEditorStyle { config in
                    PlaceholderTextEditor(config)
                        .frame(minHeight: self.getMinHeight(configuration))
                        .frame(maxHeight: self.getMaxHeight(configuration))
                        .background(RoundedRectangle(cornerRadius: 8).stroke(self.getBorderColor(configuration), lineWidth: self.getBorderWidth(configuration)).background(self.getBackgroundColor(configuration)))
                        .cornerRadius(8)
                        .onChange(of: configuration.text) { s in
                            self.checkCharCount(configuration, textString: s)
                        }
                        .padding(.bottom, self.isInfoViewNeeded(configuration) ? 0 : 9)
                }
                .padding(.top, 9)
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
            // Somehow, the minHeight is 14pt higher than the specified. Use this adjustment.
            let minHeightAdjustMent = 14.0
            guard let minHeight = configuration.minTextEditorHeight else {
                return 88 - minHeightAdjustMent
            }
            guard minHeight > 44 else {
                return 88 - minHeightAdjustMent
            }
            return minHeight - minHeightAdjustMent
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
        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct PlaceholderTextEditorFioriStyle: PlaceholderTextEditorStyle {
        func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
            PlaceholderTextEditor(configuration)
        }
    }

    struct FormViewFioriStyle: FormViewStyle {
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}
