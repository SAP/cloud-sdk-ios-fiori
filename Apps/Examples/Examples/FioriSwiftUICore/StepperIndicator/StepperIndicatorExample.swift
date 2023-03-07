import FioriSwiftUICore
import SwiftUI

struct StepperIndicatorExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Group {
                StepperIndicator()
                Text("Default empty")
                StepperIndicator(stepperCount: 1)
                Text("One stepper")
                StepperIndicator(stepperCount: 2)
                    .spacing(20)
                Text("Two steppers with 20 spacing")
                StepperIndicator(stepperCount: 3)
                    .currentStep(1)
                    .spacing(6)
                Text("Three steppers with second current step")
                StepperIndicator(stepperCount: 4)
                    .currentStep(1)
                    .indicatorColor(Color.preferredColor(.green6))
                    .highlightedIndicatorColor(Color.preferredColor(.red6))
                Text("Four steppers with specific color")
            }
            Spacer()
        }
        .padding()
        .navigationTitle(Text("Stepper Indicator"))
    }
}

struct StepperIndicatorExample_Previews: PreviewProvider {
    static var previews: some View {
        StepperIndicatorExample()
    }
}
