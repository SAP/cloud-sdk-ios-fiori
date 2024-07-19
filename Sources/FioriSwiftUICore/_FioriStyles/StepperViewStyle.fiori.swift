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
public struct StepperViewBaseStyle: StepperViewStyle {
    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        @State var showDescription = !configuration.description.isEmpty
        return VStack {
            ViewThatFits {
                HStack {
                    configuration.title
                    Spacer().layoutPriority(1)
                    configuration._stepperField
                }
                VStack(alignment: .leading) {
                    configuration.title
                    HStack {
                        Spacer()
                        configuration._stepperField
                    }
                }
            }
            if showDescription {
                HStack {
                    configuration._informationView
                    Spacer()
                }.padding(.top, 4)
            }
        }
    }
}

// Default fiori styles
extension StepperViewFioriStyle {
    struct ContentFioriStyle: StepperViewStyle {
        @Environment(\.isEnabled) var isEnabled: Bool
        @FocusState var isFocused: Bool

        func makeBody(_ configuration: StepperViewConfiguration) -> some View {
            StepperView(configuration)
//                .padding(EdgeInsets(top: 9, leading: 16, bottom: 11, trailing: 0))
                .titleStyle(content: { titleConfiguration in
                    Title(titleConfiguration)
                        .foregroundColor(.preferredColor(self.isEnabled ? (self.isFocused ? .tintColor : .primaryLabel) : .separator))
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                })
                .stepperFieldStyle { config in
                    StepperField(config)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: self.isFocused ? 2 : 0.5)
                                .foregroundColor(.preferredColor(self.isFocused ? .tintColor : .separator))
                        )
                        .focused(self.$isFocused)
                }
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let stepperViewConfiguration: StepperViewConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundColor(.preferredColor(.primaryLabel))
                .padding(EdgeInsets(top: 11, leading: 0, bottom: 11, trailing: 0))
                .layoutPriority(1)
        }
    }

    struct DecrementActionFioriStyle: DecrementActionStyle {
        let stepperViewConfiguration: StepperViewConfiguration
    
        func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
            DecrementAction(configuration)
            // Add default style for DecrementAction
            // .foregroundStyle(Color.preferredColor(fiori color))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct TextInputFieldFioriStyle: TextInputFieldStyle {
        let stepperViewConfiguration: StepperViewConfiguration
        @Environment(\.isEnabled) var isEnabled

        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            TextInputField(configuration)
                .foregroundColor(.preferredColor(self.isEnabled ? .primaryLabel : .separator))
                .font(.fiori(forTextStyle: .body))
                .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
                .frame(minWidth: 30)
                .multilineTextAlignment(.center)
                .textFieldStyle(PlainTextFieldStyle())
                .fixedSize(horizontal: true, vertical: false)
        }
    }

    struct IncrementActionFioriStyle: IncrementActionStyle {
        let stepperViewConfiguration: StepperViewConfiguration
    
        func makeBody(_ configuration: IncrementActionConfiguration) -> some View {
            IncrementAction(configuration)
            // Add default style for IncrementAction
            // .foregroundStyle(Color.preferredColor(fiori color))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let stepperViewConfiguration: StepperViewConfiguration
        @Environment(\.isEnabled) var isEnabled

        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundColor(.preferredColor(self.isEnabled ? .tertiaryLabel : .separator))
        }
    }
    
    struct StepperFieldFioriStyle: StepperFieldStyle {
        let stepperViewConfiguration: StepperViewConfiguration
    
        func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
            StepperField(configuration)
                .frame(minWidth: 150, minHeight: 44)
        }
    }
    
    struct IconFioriStyle: IconStyle {
        let stepperViewConfiguration: StepperViewConfiguration
    
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
        }
    }

    struct InformationViewFioriStyle: InformationViewStyle {
        let stepperViewConfiguration: StepperViewConfiguration
    
        func makeBody(_ configuration: InformationViewConfiguration) -> some View {
            InformationView(configuration)
        }
    }
}

public struct StepperViewFocusedStyle: StepperViewStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @FocusState var isFocused: Bool
    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .stepperFieldStyle { config in
                StepperField(config)
                    .focused(self.$isFocused)
            }
            .decrementActionStyle(content: { config in
                config.decrementAction
                    .disabled(self.isEnabled ? self.isFocused : true)
            })
            .incrementActionStyle(content: { config in
                config.incrementAction
                    .disabled(self.isEnabled ? self.isFocused : true)
            })
    }
}

/// Style for disable the increment and decrement button when editing.
public extension StepperViewStyle where Self == StepperViewFocusedStyle {
    /// The `focus` style is applied in the case that the increment and decrement button are disabled when the text field is selected and editing.
    static var focus: StepperViewFocusedStyle {
        StepperViewFocusedStyle()
    }
}
