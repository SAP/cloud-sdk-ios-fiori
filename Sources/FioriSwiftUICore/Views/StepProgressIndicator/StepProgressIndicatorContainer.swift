import SwiftUI

struct StepProgressIndicatorContainer<Steps: IndexedViewContainer>: View {
    @Environment(\.stepAxis) var stepAxis
    @Environment(\.currentStepId) var currentStepId
    @Binding var selection: String
    var steps: Steps
    
    let stepsSpacing: CGFloat = 2
    
    var body: some View {
        switch stepAxis {
        case .horizontal:
            HStack(alignment: .top, spacing: stepsSpacing) {
                ForEach(0 ..< steps.count, id: \.self) { index in
                    steps.view(at: index)
                        .environment(\.stepAxis, stepAxis)
                        .environment(\.currentStepId, $selection)
                }
            }
        case .vertical:
            VStack(alignment: .leading, spacing: stepsSpacing) {
                ForEach(0 ..< steps.count, id: \.self) { index in
                    steps.view(at: index)
                        .environment(\.stepAxis, stepAxis)
                        .environment(\.currentStepId, $selection)
                }
            }
        }
    }
}

struct CurrentStepIdKey: EnvironmentKey {
    static let defaultValue: Binding<String> = .constant("")
}

extension EnvironmentValues {
    var currentStepId: Binding<String> {
        get { self[CurrentStepIdKey.self] }
        set { self[CurrentStepIdKey.self] = newValue }
    }
}
