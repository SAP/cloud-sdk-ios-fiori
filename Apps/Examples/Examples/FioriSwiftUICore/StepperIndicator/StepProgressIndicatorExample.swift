import FioriSwiftUICore
import SwiftUI

struct StepProgressIndicatorExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Group {
                StepProgressIndicator()
                Text("Default empty")
                StepProgressIndicator(stepCount: 1)
                Text("One step")
                StepProgressIndicator(stepCount: 2)
                    .spacing(20)
                Text("Two steps with 20 spacing")
                StepProgressIndicator(stepCount: 3)
                    .currentStep(1)
                    .spacing(6)
                Text("Three steps with second current step")
                StepProgressIndicator(stepCount: 4)
                    .currentStep(1)
                    .indicatorColor(Color.preferredColor(.green6))
                    .highlightedIndicatorColor(Color.preferredColor(.red6))
                Text("Four steps with specific color")
            }
            Spacer()
        }
        .padding()
        .navigationTitle(Text("Step Progress Indicator"))
    }
}

struct StepProgressIndicatorExample_Previews: PreviewProvider {
    static var previews: some View {
        StepProgressIndicatorExample()
    }
}
