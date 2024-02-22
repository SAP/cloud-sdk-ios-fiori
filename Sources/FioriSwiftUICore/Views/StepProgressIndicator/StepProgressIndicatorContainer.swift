import SwiftUI

struct StepProgressIndicatorContainer<Steps: IndexedViewContainer>: View {
    @Environment(\.stepAxis) var stepAxis
    @Environment(\.currentStepId) var currentStepId
    @Binding var selection: String
    var steps: Steps
    
    let stepsSpacing: CGFloat = 2
    
    var body: some View {
        switch self.stepAxis {
        case .horizontal:
            HStack(alignment: .top, spacing: self.stepsSpacing) {
                ForEach(0 ..< self.steps.count, id: \.self) { index in
                    self.steps.view(at: index)
                        .environment(\.stepAxis, self.stepAxis)
                        .environment(\.currentStepId, self.$selection)
                }
            }
        case .vertical:
            VStack(alignment: .stepsLeadingAlignment, spacing: self.stepsSpacing) {
                ForEach(0 ..< self.steps.count, id: \.self) { index in
                    self.steps.view(at: index)
                        .environment(\.stepAxis, self.stepAxis)
                        .environment(\.currentStepId, self.$selection)
                }
            }
        }
    }
}
