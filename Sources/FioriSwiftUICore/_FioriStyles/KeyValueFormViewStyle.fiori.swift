import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `KeyValueFormView`.
public struct KeyValueFormViewBaseStyle: KeyValueFormViewStyle {
    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                configuration.title
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
}

public extension KeyValueFormView {
    init(title: AttributedString,
         text: Binding<String>,
         placeholder: AttributedString? = nil,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         minTextEditorHeight: CGFloat? = nil,
         maxTextEditorHeight: CGFloat? = nil,
         maxTextLength: Int? = nil,
         hintText: AttributedString? = nil,
         hidesReadOnlyHint: Bool = false,
         isCharCountEnabled: Bool = false,
         allowsBeyondLimit: Bool = false,
         charCountReachLimitMessage: String? = nil,
         charCountBeyondLimitMsg: String? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false)
    {
        self.init(title: {
            Group {
                if let mandatoryField = mandatoryFieldIndicator, isRequired {
                    switch mandatoryField {
                    case .text(let attributedString):
                        Text(title) + Text(attributedString).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                    case .icon(let image):
                        Text(title) + Text(image).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                    case .both(let attributedString, let image):
                        Text(title) + Text(attributedString) + Text(image).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                    }
                } else {
                    Text(title)
                }
            }.typeErased
        }, text: text, placeholder: { OptionalText(placeholder) }, controlState: controlState, errorMessage: errorMessage, minTextEditorHeight: minTextEditorHeight, maxTextEditorHeight: maxTextEditorHeight, maxTextLength: maxTextLength, hintText: hintText, hidesReadOnlyHint: hidesReadOnlyHint, isCharCountEnabled: isCharCountEnabled, allowsBeyondLimit: allowsBeyondLimit, charCountReachLimitMessage: charCountReachLimitMessage, charCountBeyondLimitMsg: charCountBeyondLimitMsg)
    }
}
