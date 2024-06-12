import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TextFieldFormView`.
public struct TextFieldFormViewBaseStyle: TextFieldFormViewStyle {
    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                configuration.title
                if configuration.isRequired {
                    configuration.mandatoryFieldIndicator
                }
                Spacer()
            }
            configuration._titleFormView
        }
    }
}
    
// Default fiori styles
extension TextFieldFormViewFioriStyle {
    struct ContentFioriStyle: TextFieldFormViewStyle {
        @FocusState var isFocused: Bool
        
        func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
            TextFieldFormView(configuration)
                .titleStyle { titleConf in
                    Title(titleConf)
                        .foregroundStyle(self.getTitleColor(configuration))
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                }
                .mandatoryFieldIndicatorStyle { indicatorConf in
                    MandatoryFieldIndicator(indicatorConf)
                        .foregroundStyle(self.getTitleColor(configuration))
                }
                .placeholderTextFieldStyle { config in
                    HStack {
                        PlaceholderTextField(config)
                            .foregroundStyle(self.getTextColor(configuration))
                            .font(.fiori(forTextStyle: .body))
                            .accentColor(self.getCursorColor(configuration))
                            .focused(self.$isFocused)
                            .onChange(of: configuration.text) { s in
                                self.checkCharCount(configuration, textString: s)
                            }
                            .frame(minHeight: 44)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        if self.showsActionButton(configuration), let action = getAction(configuration), let actionIcon = self.getActionIcon(configuration) {
                            Button(action: action) {
                                actionIcon
                            }
                            .padding(.trailing, 8)
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 8).stroke(self.getBorderColor(configuration), lineWidth: self.getBorderWidth(configuration)).background(self.getBackgroundColor(configuration)))
                    .cornerRadius(8)
                }
                .textInputInfoViewStyle { config in
                    let isError = self.isErrorStyle(configuration)
                    let style: any TextInputInfoViewStyle = isError ? .error : .fiori
                    TextInputInfoView(config)
                        .textInputInfoViewStyle(style)
                        .typeErased
                }
        }

        func isDisabled(_ configuration: TextFieldFormViewConfiguration) -> Bool {
            configuration.controlState == .disabled
        }

        func getTitleColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
            guard !self.isDisabled(configuration) else {
                return .preferredColor(.separator)
            }
            return .preferredColor(.primaryLabel)
        }

        func getTextColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getTextColor()
        }

        func getCursorColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getCursorColor()
        }

        func getBackgroundColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getBackgroundColor()
        }

        func getBorderColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getBorderColor()
        }

        func getBorderWidth(_ configuration: TextFieldFormViewConfiguration) -> CGFloat {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getBorderWidth()
        }

        func isErrorStyle(_ configuration: TextFieldFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isErrorStyle()
        }

        func isInfoViewNeeded(_ configuration: TextFieldFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isInfoViewNeeded()
        }

        func checkCharCount(_ configuration: TextFieldFormViewConfiguration, textString: String) {
            guard let maxTextLength = configuration.maxTextLength, maxTextLength > 0 else {
                return
            }
            if !(configuration.allowsBeyondLimit == true), textString.count > maxTextLength {
                configuration.text = String(textString.prefix(maxTextLength))
            }
        }

        func showsActionButton(_ configuration: TextFieldFormViewConfiguration) -> Bool {
            guard configuration.controlState == .normal, !self.isFocused else {
                return false
            }
            guard let actionIcon = configuration.actionIcon, let action = configuration.action else {
                return false
            }
            return true
        }

        func getAction(_ configuration: TextFieldFormViewConfiguration) -> (() -> Void)? {
            guard configuration.controlState == .normal, !self.isFocused else {
                return nil
            }
            return configuration.action
        }

        func getActionIcon(_ configuration: TextFieldFormViewConfiguration) -> Image? {
            guard configuration.controlState == .normal, !self.isFocused else {
                return nil
            }
            return configuration.actionIcon
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let textFieldFormViewConfiguration: TextFieldFormViewConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
        }
    }

    struct TextInputFieldFioriStyle: TextInputFieldStyle {
        let textFieldFormViewConfiguration: TextFieldFormViewConfiguration
        
        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            TextInputField(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        let textFieldFormViewConfiguration: TextFieldFormViewConfiguration
        
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct TitleFormViewFioriStyle: TitleFormViewStyle {
        let textFieldFormViewConfiguration: TextFieldFormViewConfiguration
        
        func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
            TitleFormView(configuration)
        }
    }
    
    struct MandatoryFieldIndicatorFioriStyle: MandatoryFieldIndicatorStyle {
        let textFieldFormViewConfiguration: TextFieldFormViewConfiguration
        
        func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
            MandatoryFieldIndicator(configuration)
                .foregroundStyle(Color.preferredColor(self.textFieldFormViewConfiguration.controlState == .disabled ? .separator : .primaryLabel))
        }
    }
}
