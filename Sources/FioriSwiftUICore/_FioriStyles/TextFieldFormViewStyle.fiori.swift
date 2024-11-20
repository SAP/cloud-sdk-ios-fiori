import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TextFieldFormView`.
public struct TextFieldFormViewBaseStyle: TextFieldFormViewStyle {
    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 0) {
                configuration.title
                if configuration.isRequired {
                    configuration.mandatoryFieldIndicator
                }
                Spacer()
            }
            configuration._titleFormView
        }
        .padding(.top, -1)
        .padding(.bottom, self.isInfoViewNeeded(configuration) ? 0 : 1)
    }

    func isInfoViewNeeded(_ configuration: TextFieldFormViewConfiguration) -> Bool {
        TextInputFormViewConfiguration(configuration, isFocused: false).isInfoViewNeeded()
    }
}
    
// Default fiori styles
extension TextFieldFormViewFioriStyle {
    struct ContentFioriStyle: TextFieldFormViewStyle {
        @FocusState var isFocused: Bool
        @State var isEditing: Bool = false

        func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
            TextFieldFormView(configuration)
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
                            actionIcon
                                .frame(minHeight: 44)
                                .padding(.trailing, 8)
                                .onTapGesture {
                                    action()
                                }
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
                        .padding(.top, -3)
                }
                .accessibilityElement(children: .combine)
                .setCustomAction(self.showsActionButton(configuration), configuration: configuration, isFocused: self.$isFocused, isEditing: self.$isEditing, actionIconAccessibilityLabel: self.getActionAccessibilityLabel(configuration))
                .setGestureOnTextFieldView(self.$isFocused, isEditing: self.$isEditing)
        }

        func isDisabled(_ configuration: TextFieldFormViewConfiguration) -> Bool {
            configuration.controlState == .disabled
        }

        func getTitleColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getTitleColor()
        }

        func getMandatoryIndicatorColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: false).getTitleColor()
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
            guard configuration.controlState == .normal, !self.isFocused, !self.isEditing else {
                return false
            }
            guard configuration.actionIcon != nil, configuration.action != nil else {
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

        func getActionAccessibilityLabel(_ configuration: TextFieldFormViewConfiguration) -> String {
            if let actionAccessibilityLabel = configuration.actionIconAccessibilityLabel {
                return actionAccessibilityLabel
            }
            return NSLocalizedString("Custom Action", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Custom Action")
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

extension View {
    @ViewBuilder func setCustomAction(_ showsAction: Bool, configuration: TextFieldFormViewConfiguration, isFocused: FocusState<Bool>.Binding, isEditing: Binding<Bool>, actionIconAccessibilityLabel: String) -> some View {
        // Note that the VO is not resetting the current active action.
        // That means that if a custom action is selected, it will remain selected
        // until user use roter to select another action. This behavior is different in UIKit.
        if UIAccessibility.isVoiceOverRunning, showsAction, let action = configuration.action {
            self
                .accessibilityAction(named: actionIconAccessibilityLabel) {
                    action()
                }
        } else {
            self
        }
    }

    @ViewBuilder func setGestureOnTextFieldView(_ isFocused: FocusState<Bool>.Binding, isEditing: Binding<Bool>) -> some View {
        if UIAccessibility.isVoiceOverRunning {
            self
                .onTapGesture {
                    isEditing.wrappedValue = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isFocused.wrappedValue = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isEditing.wrappedValue = false
                        }
                    }
                }
        } else {
            self
        }
    }
}
