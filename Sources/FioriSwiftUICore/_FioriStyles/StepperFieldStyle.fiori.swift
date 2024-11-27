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
    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        HStack(spacing: 0) {
            configuration.decrementAction
                .onSimultaneousTapGesture {
                    self.adjustValue(by: -configuration.step, configuration: configuration)
                }
            configuration._textInputField
                .textInputFieldStyle(.number)
                .setOnChange(of: configuration.text, action1: { newValue in
                    self.updateText(for: newValue, configuration: configuration)
                }) { _, newValue in
                    self.updateText(for: newValue, configuration: configuration)
                }
            configuration.incrementAction
                .onSimultaneousTapGesture {
                    self.adjustValue(by: configuration.step, configuration: configuration)
                }
        }
    }
    
    private func adjustValue(by step: Double, configuration: StepperFieldConfiguration) {
        let currentValue = Double(configuration.text)
        let newValue = currentValue.map { $0 + step } ?? 0.0
        let clampedValue = self.clampValue(newValue, configuration: configuration)
        if configuration.isDecimalSupported {
            configuration.text = String(describing: clampedValue)
        } else {
            configuration.text = String(describing: Int(clampedValue))
        }
        self.previousValue = configuration.text
    }
    
    private func updateText(for text: String, configuration: StepperFieldConfiguration) {
        if configuration.isDecimalSupported {
            if let doubleValue = Double(text) {
                let clampedValue = self.clampValue(doubleValue, configuration: configuration)
                let formattedValue = self.numberFormatter(forStep: configuration.step).string(from: NSNumber(value: clampedValue)) ?? ""
                configuration.text = formattedValue
            }
        } else {
            if text.contains(".") || text.isEmpty {
                configuration.text = self.previousValue
            } else if let doubleValue = Double(text) {
                let clampedValue = self.clampValue(doubleValue, configuration: configuration)
                configuration.text = String(Int(clampedValue))
            }
        }
        self.previousValue = configuration.text
    }
    
    private func clampValue(_ value: Double, configuration: StepperFieldConfiguration) -> Double {
        min(max(value, configuration.stepRange.lowerBound), configuration.stepRange.upperBound)
    }
    
    private func getDecimalPlaces(step: Double) -> Int {
        let stepString = String(step)
        if let decimalPointIndex = stepString.firstIndex(of: ".") {
            let decimalPointPosition = stepString.distance(from: stepString.startIndex, to: decimalPointIndex)
            let endPosition = stepString.distance(from: stepString.startIndex, to: stepString.endIndex)
            let decimalPlacesCount = endPosition - decimalPointPosition - 1
            return max(0, decimalPlacesCount)
        } else {
            return 0
        }
    }
    
    private func numberFormatter(forStep step: Double) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let decimalPlaces = self.getDecimalPlaces(step: step)
        formatter.minimumFractionDigits = decimalPlaces
        formatter.maximumFractionDigits = decimalPlaces
        return formatter
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
