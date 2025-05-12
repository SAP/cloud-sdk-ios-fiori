import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TextFieldFormView`.
public struct TextFieldFormViewBaseStyle: TextFieldFormViewStyle {
    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            configuration.title
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
                .placeholderTextFieldStyle { config in
                    HStack {
                        PlaceholderTextField(config)
                            .foregroundStyle(self.getTextColor(configuration))
                            .font(.fiori(forTextStyle: .body))
                            .accentColor(self.getCursorColor(configuration))
                            .focused(self.$isFocused)
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
}

// MARK: - Text Field Currency Style

public struct TextFieldCurrencyStyle: TextFieldFormViewStyle {
    @FocusState private var isFocused: Bool
    @State private var isEditing: Bool = false
    @State private var formattedText: String = ""
    @State private var isEditingDecimal: Bool = false
    @State private var rawInput: String = ""
    
    private var currencyOptions: CurrencyFormatOptions
    
    public init(
        currencyCode: String,
        locale: Locale = .current,
        displayStyle: CurrencyDisplayStyle? = nil,
        position: CurrencyPosition? = nil,
        maxFractionDigits: Int = 2,
        minFractionDigits: Int = 0,
        alwaysShowFractionDigits: Bool = false,
        roundingMode: NumberFormatter.RoundingMode = .halfUp
    ) {
        self.currencyOptions = CurrencyFormatOptions(
            currencyCode: currencyCode,
            locale: locale,
            displayStyle: displayStyle,
            position: position,
            maxFractionDigits: maxFractionDigits,
            minFractionDigits: minFractionDigits,
            alwaysShowFractionDigits: alwaysShowFractionDigits,
            roundingMode: roundingMode
        )
    }
    
    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .titleStyle { titleConf in
                Title(titleConf)
                    .foregroundStyle(self.getTitleColor(configuration))
                    .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
            }
            .placeholderTextFieldStyle { config in
                HStack {
                    PlaceholderTextField(config)
                        .foregroundStyle(self.getTextColor(configuration))
                        .font(.fiori(forTextStyle: .body))
                        .accentColor(self.getCursorColor(configuration))
                        .focused(self.$isFocused)
                        .keyboardType(.decimalPad)
                        .onChange(of: configuration.text) {
                            self.formatCurrencyInput(configuration, textString: configuration.text)
                        }
                        .onAppear {
                            // Initialize formatted display
                            self.formatCurrencyInput(configuration, textString: configuration.text)
                        }
                        .frame(minHeight: 44)
                    
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
    
    private func formatCurrencyInput(_ configuration: TextFieldFormViewConfiguration, textString: String) {
        let decimalSeparator = self.currencyOptions.locale.decimalSeparator ?? "."
        
        // Special case: if the text is empty, reset
        if textString.isEmpty {
            self.formattedText = ""
            self.rawInput = ""
            self.isEditingDecimal = false
            return
        }
        
        // Check if this is user input or programmatic update
        // If textString is already formatted (contains currency symbol), treat as raw input
        if textString != self.formattedText {
            self.rawInput = textString
        }
        
        // Special handling for decimal point input
        // If the last character is a decimal separator, we're in decimal edit mode
        if self.rawInput.last?.description == decimalSeparator {
            self.isEditingDecimal = true
            
            // Allow the decimal point to be displayed during editing
            DispatchQueue.main.async {
                if configuration.text != self.rawInput {
                    configuration.text = self.rawInput
                }
            }
            return
        }
        
        // Clean input to keep only valid characters
        let validCharSet = CharacterSet(charactersIn: "0123456789\(decimalSeparator)")
        var cleanInput = self.rawInput.components(separatedBy: validCharSet.inverted).joined()
        
        // Apply decimal limit if we have a decimal part
        let components = cleanInput.components(separatedBy: decimalSeparator)
        if components.count > 1 {
            let integerPart = components[0]
            var decimalPart = components[1]
            
            // Limit decimal places to maxFractionDigits
            if decimalPart.count > self.currencyOptions.maxFractionDigits {
                decimalPart = String(decimalPart.prefix(self.currencyOptions.maxFractionDigits))
                cleanInput = "\(integerPart)\(decimalSeparator)\(decimalPart)"
                self.rawInput = cleanInput
            }
        }
        
        // Convert to number and format
        if let number = Double(cleanInput.replacingOccurrences(of: decimalSeparator, with: ".")) {
            // Format with currency symbol
            let formattedValue = self.currencyOptions.format(number)
            
            // Update state and UI
            self.formattedText = formattedValue
            
            // Check max text length if applicable
            if let maxTextLength = configuration.maxTextLength, maxTextLength > 0 {
                if !(configuration.allowsBeyondLimit == true), formattedValue.count > maxTextLength {
                    let trimmedValue = String(formattedValue.prefix(maxTextLength))
                    self.formattedText = trimmedValue
                }
            }
            
            // Only update the UI if needed
            DispatchQueue.main.async {
                // Don't update if the user is still typing and has a decimal point with no decimal digits
                if !self.isEditingDecimal || components.count > 1 && !components[1].isEmpty {
                    configuration.text = self.formattedText
                    // Exit decimal edit mode if we have applied formatting
                    if components.count > 1, !components[1].isEmpty {
                        self.isEditingDecimal = false
                    }
                } else {
                    // Keep showing the raw input with decimal point during editing
                    configuration.text = self.rawInput
                }
            }
        } else {
            // If parsing fails, just keep the cleaned input
            self.formattedText = cleanInput
            
            DispatchQueue.main.async {
                configuration.text = self.isEditingDecimal ? self.rawInput : self.formattedText
            }
        }
    }
    
    // MARK: - Helper methods from ContentFioriStyle
    
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

// MARK: - Style Extension

/// Currency style
public extension TextFieldFormViewStyle where Self == TextFieldCurrencyStyle {
    static func currency(
        currencyCode: String,
        locale: Locale = .current,
        displayStyle: CurrencyDisplayStyle = .symbol,
        position: CurrencyPosition = .prefix,
        maxFractionDigits: Int = 2,
        minFractionDigits: Int = 0
    ) -> TextFieldCurrencyStyle {
        TextFieldCurrencyStyle(
            currencyCode: currencyCode,
            locale: locale,
            displayStyle: displayStyle,
            position: position,
            maxFractionDigits: maxFractionDigits,
            minFractionDigits: minFractionDigits
        )
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
