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
    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        HStack {
            configuration.decrementAction
                .onSimultaneousTapGesture {
                    if let stepValue = configuration.step, var currentTextValue = Int(configuration.text) {
                        currentTextValue -= stepValue
                        currentTextValue = currentTextValue < configuration.stepRange.lowerBound ? configuration.stepRange.lowerBound : currentTextValue
                        configuration.text = String(currentTextValue)
                    }
                }
            configuration._textInputField
            configuration.incrementAction
                .onSimultaneousTapGesture {
                    if let stepValue = configuration.step, var currentTextValue = Int(configuration.text) {
                        currentTextValue += stepValue
                        currentTextValue = currentTextValue > configuration.stepRange.upperBound ? configuration.stepRange.upperBound : currentTextValue
                        configuration.text = String(currentTextValue)
                    }
                }
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
            @State var isDecrementBtnEnabled: Bool = self.isEnabled ? Int(self.stepperFieldConfiguration.text) ?? self.stepperFieldConfiguration.stepRange.lowerBound > self.stepperFieldConfiguration.stepRange.lowerBound ? true : false : false
            let decrementDescFormat = NSLocalizedString("Decrease the value by %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            let decrementDesc = String(format: decrementDescFormat, stepperFieldConfiguration.step ?? 1)
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

        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            TextInputField(configuration)
                .accessibilityLabel(NSLocalizedString("Select specific value", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
        }
    }

    struct IncrementActionFioriStyle: IncrementActionStyle {
        let stepperFieldConfiguration: StepperFieldConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool
        @Environment(\.colorScheme) var colorScheme

        func makeBody(_ configuration: IncrementActionConfiguration) -> some View {
            @State var isIncrementBtnEnabled: Bool = self.isEnabled ? Int(self.stepperFieldConfiguration.text) ?? self.stepperFieldConfiguration.stepRange.upperBound < self.stepperFieldConfiguration.stepRange.upperBound ? true : false : false
            let incrementDescFormat = NSLocalizedString("Increase the value by %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            let incrementDesc = String(format: incrementDescFormat, stepperFieldConfiguration.step ?? 1)
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
