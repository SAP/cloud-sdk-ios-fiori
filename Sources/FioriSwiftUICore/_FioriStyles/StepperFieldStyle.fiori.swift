import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct StepperFieldBaseStyle: StepperFieldStyle {
    @State private var previousValue: String = ""
    @State private var pendingText: String = ""
    @FocusState private var isFocused: Bool
    
    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        HStack(spacing: 0) {
            configuration.decrementAction
                .onSimultaneousTapGesture {
                    self.adjustValue(by: -configuration.step, configuration: configuration)
                }
            configuration._textInputField
                .multilineTextAlignment(.center)
                .ifApply(configuration.isDecimalSupported) {
                    $0.textInputFieldStyle(.decimal)
                }
                .ifApply(!configuration.isDecimalSupported) {
                    $0.textInputFieldStyle(.number)
                }
                .focused(self.$isFocused)
                .onChange(of: configuration.text) { _, newValue in
                    let filteredValue = configuration.isDecimalSupported ? self.filterDecimalInput(newValue) : newValue
                    let validatedText = self.validateAndUpdateText(for: filteredValue, configuration: configuration, enforceMinimum: false)
                    self.pendingText = validatedText
                    DispatchQueue.main.async {
                        configuration.text = self.pendingText
                    }
                }
                .onChange(of: self.isFocused) { _, newValue in
                    if !newValue {
                        if configuration.text.isEmpty {
                            let lowerBoundText = self.formatValue(
                                Decimal(configuration.stepRange.lowerBound),
                                isDecimalSupported: configuration.isDecimalSupported,
                                step: configuration.step
                            )
                            self.pendingText = lowerBoundText
                            configuration.text = lowerBoundText
                            self.previousValue = lowerBoundText
                        } else {
                            let validatedText = self.validateAndUpdateText(for: configuration.text, configuration: configuration, enforceMinimum: true)
                            self.pendingText = validatedText
                            configuration.text = validatedText
                        }
                    }
                }
                .onSubmit {
                    self.isFocused = false
                }
                .onAppear {
                    let initialText = configuration.$text.wrappedValue
                    let validatedText = self.validateAndUpdateText(
                        for: initialText,
                        configuration: configuration,
                        enforceMinimum: true
                    )
                    self.pendingText = validatedText
                    configuration.text = validatedText
                    self.previousValue = validatedText
                }
            configuration.incrementAction
                .onSimultaneousTapGesture {
                    self.adjustValue(by: configuration.step, configuration: configuration)
                }
        }
    }
    
    private func adjustValue(by step: Double, configuration: StepperFieldConfiguration) {
        if configuration.text.isEmpty {
            let lowerBoundText = self.formatValue(
                Decimal(configuration.stepRange.lowerBound),
                isDecimalSupported: configuration.isDecimalSupported,
                step: configuration.step
            )
            self.pendingText = lowerBoundText
            configuration.text = lowerBoundText
            self.previousValue = lowerBoundText
        } else {
            let validatedText = self.validateAndUpdateText(for: configuration.text, configuration: configuration, enforceMinimum: true)
            self.pendingText = validatedText
            configuration.text = validatedText
        }
        
        if let currentValue = Decimal(string: configuration.text), currentValue.isFinite {
            let newValue = currentValue + Decimal(step)
            let clampedValue = self.clampValue(newValue, configuration: configuration)
            let formattedText = self.formatValue(
                clampedValue,
                isDecimalSupported: configuration.isDecimalSupported,
                step: configuration.step
            )
            self.pendingText = formattedText
            configuration.text = formattedText
            self.previousValue = formattedText
        } else {
            let lowerBoundText = self.formatValue(
                Decimal(configuration.stepRange.lowerBound),
                isDecimalSupported: configuration.isDecimalSupported,
                step: configuration.step
            )
            self.pendingText = lowerBoundText
            configuration.text = lowerBoundText
            self.previousValue = lowerBoundText
        }
    }
    
    private func filterDecimalInput(_ value: String) -> String {
        var result = ""
        var hasDecimalPoint = false
        
        for char in value {
            if char.isNumber {
                result.append(char)
            } else if char == ".", !hasDecimalPoint {
                result.append(char)
                hasDecimalPoint = true
            }
        }
        return result
    }

    private func validateAndUpdateText(for text: String, configuration: StepperFieldConfiguration, enforceMinimum: Bool) -> String {
        if text.isEmpty {
            return text
        }
        
        // Handle decimal inputs
        if configuration.isDecimalSupported {
            if let decimalValue = Decimal(string: text), decimalValue.isFinite {
                let clampedValue: Decimal
                if enforceMinimum {
                    clampedValue = self.clampValue(decimalValue, configuration: configuration)
                } else if decimalValue > Decimal(configuration.stepRange.upperBound) {
                    clampedValue = Decimal(configuration.stepRange.upperBound)
                } else {
                    return text
                }
                return self.formatValue(
                    clampedValue,
                    isDecimalSupported: true,
                    step: configuration.step
                )
            } else {
                let decimalParts = text.components(separatedBy: ".")
                if decimalParts.count <= 2,
                   decimalParts[0].isEmpty || decimalParts[0].allSatisfy(\.isNumber),
                   decimalParts.count == 1 || decimalParts[1].isEmpty || decimalParts[1].allSatisfy(\.isNumber)
                {
                    return text
                }
                return self.previousValue.isEmpty ?
                    self.formatValue(
                        Decimal(configuration.stepRange.lowerBound),
                        isDecimalSupported: true,
                        step: configuration.step
                    ) :
                    self.previousValue
            }
        } else {
            // handle integer inputs
            if let decimalValue = Decimal(string: text), decimalValue.isFinite {
                let clampedValue: Decimal
                if enforceMinimum {
                    clampedValue = self.clampValue(decimalValue, configuration: configuration)
                } else if decimalValue > Decimal(configuration.stepRange.upperBound) {
                    clampedValue = Decimal(configuration.stepRange.upperBound)
                } else {
                    return text
                }
                return self.formatValue(
                    clampedValue,
                    isDecimalSupported: false,
                    step: configuration.step
                )
            } else {
                return self.previousValue.isEmpty ?
                    self.formatValue(
                        Decimal(configuration.stepRange.lowerBound),
                        isDecimalSupported: false,
                        step: configuration.step
                    ) :
                    self.previousValue
            }
        }
    }
    
    private func clampValue(_ value: Decimal, configuration: StepperFieldConfiguration) -> Decimal {
        min(max(value, Decimal(configuration.stepRange.lowerBound)), Decimal(configuration.stepRange.upperBound))
    }
    
    private func formatValue(_ value: Decimal, isDecimalSupported: Bool, step: Double) -> String {
        if isDecimalSupported {
            let stepString = String(step)
            let decimalPlaces = stepString.contains(".") ? stepString.split(separator: ".").last?.count ?? 0 : 0
            let maximumFractionDigits = max(1, decimalPlaces)
            
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = maximumFractionDigits
            return formatter.string(from: NSDecimalNumber(decimal: value)) ?? String(describing: value)
        } else {
            return String(NSDecimalNumber(decimal: value).intValue)
        }
    }
}

// Default fiori styles
extension StepperFieldFioriStyle {
    struct ContentFioriStyle: StepperFieldStyle {
        func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
            StepperField(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct DecrementActionFioriStyle: DecrementActionStyle {
        let stepperFieldConfiguration: StepperFieldConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool
        @Environment(\.colorScheme) var colorScheme

        func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
            let isDecrementBtnEnabled: Bool = self.isEnabled ? Double(self.stepperFieldConfiguration.text) ?? self.stepperFieldConfiguration.stepRange.lowerBound > self.stepperFieldConfiguration.stepRange.lowerBound ? true : false : false
            let decrementDescFormat = NSLocalizedString("Decrease the value by %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            let decrementDesc = String(format: decrementDescFormat, stepperFieldConfiguration.step)
            return DecrementAction(configuration)
                .foregroundColor(.preferredColor(.tintColor))
                .frame(minWidth: 44, minHeight: 44)
                .fioriButtonStyle(StepperPlainButtonStyle(colorScheme: self.colorScheme))
                .disabled(!isDecrementBtnEnabled)
                .accessibilityLabel(NSLocalizedString("Stepper decrease", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                .accessibilityValue(Text(decrementDesc))
        }
    }

    struct TextInputFieldFioriStyle: TextInputFieldStyle {
        let stepperFieldConfiguration: StepperFieldConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool
        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            TextInputField(configuration)
                .foregroundColor(.preferredColor(self.isEnabled ? .tertiaryLabel : .separator))
                .accessibilityLabel(NSLocalizedString("Select specific value", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
        }
    }

    struct IncrementActionFioriStyle: IncrementActionStyle {
        let stepperFieldConfiguration: StepperFieldConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool
        @Environment(\.colorScheme) var colorScheme

        func makeBody(_ configuration: IncrementActionConfiguration) -> some View {
            let isIncrementBtnEnabled: Bool = self.isEnabled ? Double(self.stepperFieldConfiguration.text) ?? self.stepperFieldConfiguration.stepRange.upperBound < self.stepperFieldConfiguration.stepRange.upperBound ? true : false : false
            let incrementDescFormat = NSLocalizedString("Increase the value by %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            let incrementDesc = String(format: incrementDescFormat, stepperFieldConfiguration.step)
            return IncrementAction(configuration)
                .foregroundColor(.preferredColor(.tintColor))
                .frame(minWidth: 44, minHeight: 44)
                .fioriButtonStyle(StepperPlainButtonStyle(colorScheme: self.colorScheme))
                .disabled(!isIncrementBtnEnabled)
                .accessibilityLabel(NSLocalizedString("Stepper increase", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                .accessibilityValue(Text(incrementDesc))
        }
    }
    
    struct StepperPlainButtonStyle: FioriButtonStyle {
        let colorScheme: ColorScheme
        
        public init(colorScheme: ColorScheme) {
            self.colorScheme = colorScheme
        }
        
        func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
            let backgroundColor: Color = self.colorScheme == .dark ? Color.clear : .preferredColor(.primaryBackground)
            let foregroundColor: Color
            switch configuration.state {
            case .normal:
                foregroundColor = Color.preferredColor(.tintColor)
            case .highlighted, .selected:
                foregroundColor = Color.preferredColor(.tintColorTapState)
            default:
                foregroundColor = Color.preferredColor(.separator)
            }
            
            let config = FioriButtonConfiguration(foregroundColor: foregroundColor, backgroundColor: backgroundColor, font: .fiori(forTextStyle: .callout), padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            return configuration.label
                .fioriButtonConfiguration(config)
        }
    }
}
