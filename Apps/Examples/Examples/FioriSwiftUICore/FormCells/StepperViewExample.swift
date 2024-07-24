import FioriSwiftUICore
import SwiftUI

struct StepperViewExample: View {
    @State var normalStepValue = "3"
    @State var longTitleStepValue = "3"
    @State var customStyleStepValue = "3"
    @State var noHintStepValue = "79"
    @State var negativeValue = "80"
    @State var disabledValue = "63"
    @State var isInputValueValid: Bool = true
    
    var newStyle: any InformationViewStyle {
        if self.isInputValueValid {
            return InformationViewFioriStyle.fiori
        } else {
            return InformationViewErrorStyle.error
        }
    }

    var body: some View {
        List {
            StepperView(
                title: { Text("Value") },
                text: self.$normalStepValue,
                step: 1,
                stepRange: 0 ... 100,
                description: { Text("Hint Text") }
            )
            StepperView(
                title: { Text("Value") },
                text: self.$negativeValue,
                step: 1,
                stepRange: 0 ... 100,
                description: { Text(self.isInputValueValid ? "Hint Text" : "Validation failed.") }
            ).onChange(of: self.negativeValue, perform: { value in
                if Int(value) ?? 1 > 80 {
                    self.isInputValueValid = false
                } else {
                    self.isInputValueValid = true
                }
            })
            .informationViewStyle(self.newStyle).typeErased
            StepperView(
                title: { Text("Value") },
                text: self.$disabledValue,
                step: 1,
                stepRange: 0 ... 100,
                description: { Text("Disabled Stepper") }
            )
            .disabled(true)
            StepperView(
                title: { Text("loooooooooooooooooooooongTitle") },
                text: self.$longTitleStepValue,
                step: 3,
                stepRange: 0 ... 100,
                description: { Text("Increment/decrement 3 each step") }
            )
            StepperView(
                title: { Text("Disable increment/decrement button when editing") },
                text: self.$noHintStepValue,
                step: 1,
                stepRange: 0 ... 100
            )
            .stepperViewStyle(.focus)
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
