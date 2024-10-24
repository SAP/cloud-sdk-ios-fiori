import FioriSwiftUICore
import SwiftUI

struct StepperViewExample: View {
    @State var normalStepValue = "3"
    @State var doubleStepValue = "6.0"
    @State var longTitleStepValue = "3"
    @State var customStyleStepValue = "3"
    @State var noFocusValue = "79"
    @State var negativeValue = "80"
    @State var activateValue = "63"
    @State var isInputValueValid: Bool = true
    
    @State var isDisabled: Bool = false
    @State var toggleDecrementActivate: Bool = true
    
    var newStyle: any InformationViewStyle {
        if self.isInputValueValid {
            return InformationViewFioriStyle.fiori
        } else {
            return InformationViewErrorStyle.error
        }
    }

    var body: some View {
        List {
            Toggle("Disabled State", isOn: self.$isDisabled)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Toggle("Activate increment decrement button separately", isOn: self.$toggleDecrementActivate)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            StepperView(
                title: { Text("Value") },
                text: self.$normalStepValue,
                stepRange: 0 ... 100,
                description: { Text("Hint Text") }
            )
            .disabled(self.isDisabled)
            
            StepperView(
                title: { Text("Value") },
                text: self.$doubleStepValue,
                step: 0.5,
                stepRange: 0.5 ... 80.5,
                isDecimalSupported: true,
                description: { Text("Double Value") }
            )
            .disabled(self.isDisabled)
            
            StepperView(
                title: { Text("Value") },
                text: self.$negativeValue,
                stepRange: 10 ... 100,
                description: { Text(self.isInputValueValid ? "Hint Text" : "Validation failed.") }
            ).onChange(of: self.negativeValue, perform: { value in
                let cValue = Double(value) ?? 10
                if cValue > 80 || cValue < 20 {
                    self.isInputValueValid = false
                } else {
                    self.isInputValueValid = true
                }
            })
            .informationViewStyle(self.newStyle).typeErased
            .disabled(self.isDisabled)
            
            StepperView(
                title: { Text("loooooooooooooooooooooooooooooooooooongTitle") },
                text: self.$longTitleStepValue,
                step: 3,
                stepRange: 0 ... 100,
                description: { Text("Increment/decrement 3 each step") }
            )
            .disabled(self.isDisabled)
            
            StepperView(
                title: { Text("Disable increment/decrement button when editing") },
                text: self.$noFocusValue,
                step: 1,
                stepRange: 0 ... 100
            )
            .stepperViewStyle(.focus)
            .disabled(self.isDisabled)
            
            if self.toggleDecrementActivate {
                StepperView(
                    title: { Text("Deactivate increment Activate decrement") },
                    text: self.$activateValue,
                    step: 1,
                    stepRange: 0 ... 100
                )
                .decrementActionStyle(.activate)
                .incrementActionStyle(.deactivate)
                .disabled(self.isDisabled)
            } else {
                StepperView(
                    title: { Text("Deactivate decrement Activate increment") },
                    text: self.$activateValue,
                    step: 1,
                    stepRange: 0 ... 100
                )
                .decrementActionStyle(.deactivate)
                .incrementActionStyle(.activate)
                .disabled(self.isDisabled)
            }
            
            StepperView(
                title: { Text("Value") },
                text: self.$customStyleStepValue,
                step: 1,
                stepRange: 0 ... 100,
                description: { Text("Custom style") }
            )
            .titleStyle(content: { titleConfiguration in
                titleConfiguration.title
                    .foregroundColor(.purple)
            })
            .descriptionStyle(content: { config in
                config.description
                    .foregroundColor(.purple)
            })
            .stepperFieldStyle(content: { config in
                StepperField(config)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.purple)
                    )
            })
            .textInputFieldStyle(content: { config in
                TextInputField(config).foregroundColor(.purple)
            })
            .incrementActionStyle(content: { config in
                config.incrementAction.fioriButtonStyle(IncrementBtnStyle())
            })
            .decrementActionStyle(content: { config in
                config.decrementAction.fioriButtonStyle(DecrementBtnStyle())
            })
            .disabled(self.isDisabled)
            Spacer()
        }
    }
    
    func getDescription(isValid: Bool) -> any View {
        if isValid {
            return EmptyView()
        } else {
            return Text("Validation failed")
        }
    }
}

struct IncrementBtnStyle: FioriButtonStyle {
    func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
        configuration.label.foregroundColor(Color.purple)
    }
}

struct DecrementBtnStyle: FioriButtonStyle {
    func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
        configuration.label.foregroundColor(Color.purple)
    }
}

#Preview {
    StepperViewExample()
}
