import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TextFieldFormView`.
public struct TextFieldFormViewBaseStyle: TextFieldFormViewStyle {
    @Environment(\.isLoading) var isLoading
    @Environment(\.isAILoading) var isAILoading
    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        if self.isLoading, self.isAILoading {
            return AnyView(
                VStack(alignment: .leading, spacing: 4) {
                    self.getTitle(configuration)
                    SkeletonLoadingContainer {
                        self.getTextInput(configuration)
                    }
                    .environment(\.isLoading, self.isLoading)
                }
                .padding(.top, -1)
                .padding(.bottom, self.isInfoViewNeeded(configuration) ? 0 : 1)
            )
        } else {
            return AnyView(
                SkeletonLoadingContainer {
                    VStack(alignment: .leading, spacing: 4) {
                        self.getTitle(configuration)
                        self.getTextInput(configuration)
                    }
                    .padding(.top, -1)
                    .padding(.bottom, self.isInfoViewNeeded(configuration) ? 0 : 1)
                }
                .environment(\.isLoading, self.isLoading)
            )
        }
    }
    
    func getTitle(_ configuration: TextFieldFormViewConfiguration) -> some View {
        if self.isLoading, !self.isAILoading {
            return Text("TextFieldFormView title")
                .typeErased
        } else {
            return configuration.title.typeErased
        }
    }
    
    func getTextInput(_ configuration: TextFieldFormViewConfiguration) -> some View {
        if self.isLoading, !self.isAILoading {
            return TitleFormView(.init(text: .constant("TextFieldFormView text input value in multiple lines"), isSecureEnabled: false, formatter: configuration.formatter, placeholder: .init(configuration.placeholder), controlState: .normal, errorMessage: nil, maxTextLength: 20, hintText: nil, hidesReadOnlyHint: false, isCharCountEnabled: false, allowsBeyondLimit: false, charCountReachLimitMessage: "", charCountBeyondLimitMsg: ""))
                .typeErased
        } else {
            return configuration._titleFormView.typeErased
        }
    }

    func isInfoViewNeeded(_ configuration: TextFieldFormViewConfiguration) -> Bool {
        TextInputFormViewConfiguration(configuration, isFocused: false).isInfoViewNeeded()
    }
}
    
// Default fiori styles
extension TextFieldFormViewFioriStyle {
    struct ContentFioriStyle: TextFieldFormViewStyle {
        @Environment(\.currencyField) private var currencyFieldConfiguration
        @FocusState var isFocused: Bool
        @State var isEditing: Bool = false
        @State private var rawInput: String = ""
        @State private var displayText: String = ""
        @Environment(\.isLoading) var isLoading
        @Environment(\.isAILoading) var isAILoading
        
        func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
            TextFieldFormView(configuration)
                .titleStyle { titleConf in
                    Title(titleConf)
                        .foregroundStyle((self.isLoading && !self.isAILoading) ? .preferredColor(.separator) : self.getTitleColor(configuration))
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                }
                .placeholderTextFieldStyle { config in
                    HStack {
                        PlaceholderTextField(text: Binding(
                            get: {
                                // In currency field mode, display formatted text or raw input
                                if self.currencyFieldConfiguration.isCurrencyField {
                                    return self.isFocused ? self.rawInput : self.displayText
                                } else {
                                    return configuration.text
                                }
                            },
                            set: { newValue in
                                if self.currencyFieldConfiguration.isCurrencyField {
                                    // In the currency field mode, handle the input
                                    if self.isFocused {
                                        self.processRawInput(configuration, textString: newValue)
                                    }
                                } else {
                                    configuration.text = newValue
                                }
                            }
                        ), isSecureEnabled: config.isSecureEnabled, formatter: configuration.formatter, placeholder: { config.placeholder.body })
                            .foregroundStyle((self.isLoading && !self.isAILoading) ? .preferredColor(.separator) : self.getTextColor(configuration))
                            .font(.fiori(forTextStyle: .body))
                            .accentColor(self.getCursorColor(configuration))
                            .focused(self.$isFocused)
                            .ifApply(self.currencyFieldConfiguration.isCurrencyField) { content in
                                content
                                    .keyboardType(.decimalPad)
                                    .onChange(of: self.isFocused) {
                                        if !self.isFocused {
                                            // When losing focus, update the formatted display text and the original data.
                                            self.updateCurrencyFormatting(configuration)
                                        }
                                    }
                                    .onAppear {
                                        // Initialize the currency field
                                        self.initializeCurrencyField(configuration)
                                    }
                                    .onChange(of: self.rawInput) {
                                        self.rawInput = self.validateText()
                                    }
                            }
                            .setOnChange(of: configuration.text, action1: { s in
                                self.handleTextChange(configuration, textString: s)
                            }) { _, s in
                                self.handleTextChange(configuration, textString: s)
                            }
                            .frame(minHeight: 44)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        if !(configuration.isSecureEnabled ?? false) {
                            if self.showsActionButton(configuration), let action = getAction(configuration), let actionIcon = self.getActionIcon(configuration) {
                                actionIcon
                                    .frame(minHeight: 44)
                                    .padding(.trailing, 8)
                                    .onTapGesture {
                                        action()
                                    }
                            }
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 8).stroke(self.getBorderColor(configuration), lineWidth: self.getBorderWidth(configuration)).background(self.isLoading ? .clear : self.getBackgroundColor(configuration)))
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
        
        // Validate Text
        private func validateText() -> String {
            // Filter out non-numeric characters and special symbols
            let decimalSeparator = self.currencyFieldConfiguration.formatter.locale.decimalSeparator ?? "."
            let validCharSet = CharacterSet(charactersIn: "-0123456789\(decimalSeparator)")
            var processedInput = self.rawInput.components(separatedBy: validCharSet.inverted).joined()
            
            // Handle the situation of multiple decimal points
            if processedInput.components(separatedBy: decimalSeparator).count > 2 {
                processedInput.removeLast()
            }
            
            // Handle multiple minus
            if let firstChar = processedInput.first, firstChar == "-", processedInput.components(separatedBy: "-").count > 2 {
                processedInput.removeLast()
            }
            
            return processedInput
        }
        
        // Handle text changes for both currency and non-currency fields
        private func handleTextChange(_ configuration: TextFieldFormViewConfiguration, textString: String) {
            if !self.currencyFieldConfiguration.isCurrencyField {
                self.checkCharCount(configuration, textString: textString)
            } else {
                self.syncRawInput(textString)
            }
        }
        
        // Initialize the currency field
        private func initializeCurrencyField(_ configuration: TextFieldFormViewConfiguration) {
            if configuration.text.isEmpty {
                self.rawInput = ""
                self.displayText = ""
            } else {
                // Assume the initial value is the original numerical value
                self.rawInput = configuration.text
                self.updateDisplayText(configuration)
            }
        }
        
        // Sync the raw input data
        private func syncRawInput(_ newValue: String) {
            if !self.isFocused, newValue != self.displayText {
                // When the bound value is modified externally, synchronize it to rawInput
                self.rawInput = newValue
            }
        }
        
        // Process the raw input and only clean invalid characters during the input process.
        private func processRawInput(_ configuration: TextFieldFormViewConfiguration, textString: String) {
            var processedInput = self.validateText()
            
            // Apply maximum length limit
            if let maxTextLength = configuration.maxTextLength, maxTextLength > 0 {
                if !(configuration.allowsBeyondLimit == true), processedInput.count > maxTextLength {
                    processedInput = String(processedInput.prefix(maxTextLength))
                }
            }
            self.rawInput = textString
            
            // Update the bound raw data
            if processedInput != configuration.text {
                configuration.text = processedInput
            }
        }
        
        // Update the currency formatting while keeping the original data unchanged
        private func updateCurrencyFormatting(_ configuration: TextFieldFormViewConfiguration) {
            self.updateDisplayText(configuration)
            
            // Ensure that the bound text remains as the original numerical value
            if self.rawInput != configuration.text {
                configuration.text = self.rawInput
            }
        }
        
        // Update the display text
        private func updateDisplayText(_ configuration: TextFieldFormViewConfiguration) {
            if self.rawInput.isEmpty {
                self.displayText = ""
                return
            }
            let processedInput = self.validateText()
            if let number = Double(processedInput) {
                self.displayText = self.currencyFieldConfiguration.formatter.format(Decimal(number)) ?? self.rawInput
            } else {
                self.displayText = self.rawInput
            }
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
