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
            return TitleFormView(.init(text: .constant("TextFieldFormView text input value in multiple lines"), isSecureEnabled: false, placeholder: .init(configuration.placeholder), controlState: .normal, errorMessage: nil, maxTextLength: 20, hintText: nil, hidesReadOnlyHint: false, isCharCountEnabled: false, allowsBeyondLimit: false, charCountReachLimitMessage: "", charCountBeyondLimitMsg: ""))
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
        @State private var formattedText: String = ""
        @State private var rawInput: String = ""
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
                        PlaceholderTextField(config)
                            .foregroundStyle((self.isLoading && !self.isAILoading) ? .preferredColor(.separator) : self.getTextColor(configuration))
                            .font(.fiori(forTextStyle: .body))
                            .accentColor(self.getCursorColor(configuration))
                            .focused(self.$isFocused)
                            .ifApply(self.currencyFieldConfiguration.isCurrencyField) { content in
                                content
                                    .keyboardType(.decimalPad)
                                    .onChange(of: configuration.text) {
                                        if configuration.text != self.formattedText, configuration.text != self.rawInput {
                                            if self.isFocused {
                                                // In typing mode, just store the raw input with decimal limit
                                                self.processRawInput(configuration, textString: configuration.text)
                                            } else {
                                                // In non-typing mode, apply full formatting
                                                self.formatCurrencyInput(configuration)
                                            }
                                        }
                                    }
                                    .onChange(of: self.isFocused) {
                                        if !self.isFocused {
                                            // When focus is lost, apply formatting
                                            self.formatCurrencyInput(configuration)
                                        } else {
                                            // When focus is gained, show the raw input for easier editing
                                            if !self.formattedText.isEmpty, self.rawInput != configuration.text {
                                                DispatchQueue.main.async {
                                                    configuration.text = self.rawInput
                                                }
                                            }
                                        }
                                    }
                                    .onAppear {
                                        // Initialize values - only if not already set
                                        if configuration.text.isEmpty {
                                            self.rawInput = ""
                                            self.formattedText = ""
                                        } else {
                                            self.rawInput = configuration.text
                                            // Only format non-empty initial values
                                            if !self.rawInput.isEmpty {
                                                self.formatCurrencyInput(configuration)
                                            }
                                        }
                                    }
                            }
                            .setOnChange(of: configuration.text, action1: { s in
                                self.checkCharCount(configuration, textString: s)
                            }) { _, s in
                                self.checkCharCount(configuration, textString: s)
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
        
        // Process raw input during typing, only removing invalid characters and respecting maxTextLength
        private func processRawInput(_ configuration: TextFieldFormViewConfiguration, textString: String) {
            // Skip processing for empty string
            if textString.isEmpty {
                self.rawInput = ""
                return
            }
            
            // If configuration text is different from what we have, update our raw input
            if textString != self.rawInput {
                let decimalSeparator = self.currencyFieldConfiguration.formatter.locale.decimalSeparator ?? "."
                let validCharSet = CharacterSet(charactersIn: "0123456789\(decimalSeparator)")
                
                // Only filter invalid characters, don't limit decimal places during typing
                var processedInput = textString.components(separatedBy: validCharSet.inverted).joined()
                
                // Only apply maxTextLength if specified
                if let maxTextLength = configuration.maxTextLength, maxTextLength > 0 {
                    if !(configuration.allowsBeyondLimit == true), processedInput.count > maxTextLength {
                        processedInput = String(processedInput.prefix(maxTextLength))
                    }
                }
                
                // Store the processed input
                self.rawInput = processedInput
                
                // Update UI with the processed raw input only if it changed
                if processedInput != textString {
                    // Avoid unnecessary updates that could trigger loops
                    DispatchQueue.main.async {
                        // Set directly to avoid triggering onChange again
                        configuration.text = processedInput
                    }
                }
            }
        }
        
        // Format the currency input when typing is complete
        private func formatCurrencyInput(_ configuration: TextFieldFormViewConfiguration) {
            // Skip formatting for empty string
            if self.rawInput.isEmpty {
                if self.formattedText != "" {
                    self.formattedText = ""
                    // Only update if necessary to avoid loops
                    if configuration.text != "" {
                        DispatchQueue.main.async {
                            configuration.text = ""
                        }
                    }
                }
                return
            }
            
            // When focus is lost, apply full formatting including decimal place limits
            if !self.isFocused {
                // First clean up the input (just removing invalid chars, not limiting decimals yet)
                let decimalSeparator = self.currencyFieldConfiguration.formatter.locale.decimalSeparator ?? "."
                let validCharSet = CharacterSet(charactersIn: "0123456789\(decimalSeparator)")
                let cleanInput = self.rawInput.components(separatedBy: validCharSet.inverted).joined()
                
                // Then convert to number and let NumberFormatter handle the decimal places
                if let number = Double(cleanInput.replacingOccurrences(of: decimalSeparator, with: ".")) {
                    let newFormattedText = self.currencyFieldConfiguration.formatter.format(Decimal(number)) ?? cleanInput
                    
                    // Always update when losing focus to ensure formatting is applied
                    self.formattedText = newFormattedText
                    
                    // Always update UI when focus is lost to ensure formatting
                    DispatchQueue.main.async {
                        configuration.text = self.formattedText
                    }
                } else {
                    // If conversion fails, just use cleaned input
                    self.formattedText = cleanInput
                    
                    DispatchQueue.main.async {
                        configuration.text = cleanInput
                    }
                }
            } else {
                // In editing mode, ensure raw input is displayed
                if configuration.text != self.rawInput {
                    DispatchQueue.main.async {
                        configuration.text = self.rawInput
                    }
                }
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
