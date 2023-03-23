import FioriThemeManager
import SwiftUI

extension Fiori {
    enum StepProgressIndicator {
        typealias CurrentStepName = EmptyModifier
        typealias CurrentStepNameCumulative = EmptyModifier
        typealias AllStepsAction = EmptyModifier
        typealias AllStepsActionCumulative = EmptyModifier
        typealias CancelAction = EmptyModifier
        typealias CancelActionCumulative = EmptyModifier
        
        static let currentStepName = CurrentStepName()
        static let allStepsAction = AllStepsAction()
        static let cancelAction = CancelAction()
        static let currentStepNameCumulative = CurrentStepNameCumulative()
        static let allStepsActionCumulative = AllStepsActionCumulative()
        static let cancelActionCumulative = CancelActionCumulative()
    }
}

extension StepProgressIndicator: View {
    var stepsSpacing: CGFloat {
        2
    }
    
    var stepsCount: Int {
        steps.count
    }
    
    public var body: some View {
        switch axis {
        case .horizontal:
            VStack {
                stepsHeader
                stepsContainer
            }
        case .vertical:
            stepsContainer
        }
    }
    
    @ViewBuilder var stepsContainer: some View {
        switch axis {
        case .horizontal:
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: stepsSpacing) {
                    ForEach(0 ..< stepsCount, id: \.self) { index in
                        steps.view(at: index)
                    }
                }
            }
        case .vertical:
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: stepsSpacing) {
                    ForEach(0 ..< stepsCount, id: \.self) { index in
                        steps.view(at: index)
                    }
                }
            }.padding(20)
        }
    }
    
    @ViewBuilder var stepsHeader: some View {
        if isAllStepsActionEmptyView && isCurrentStepNameEmptyView {
            EmptyView()
        } else {
            HStack(alignment: .top) {
                currentStepName
                Spacer()
                Button {
                    isPresented.toggle()
                } label: {
                    allStepsAction
                }
            }
            .sheet(isPresented: $isPresented) {
                verticalSteps()
            }
        }
    }
    
    func verticalSteps() -> some View {
        var newSelf = self
        newSelf.axis = .vertical
        return NavigationView {
            newSelf.stepAxis(.vertical)
                // TODO: localized string
                .navigationTitle("All Steps")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        cancelAction.onSimultaneousTapGesture {
                            isPresented.toggle()
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct LineForgroundColorKey: EnvironmentKey {
    static let defaultValue = Color.preferredColor(.secondaryBackground)
}

public extension EnvironmentValues {
    var lineForgroundColor: Color {
        get { self[LineForgroundColorKey.self] }
        set { self[LineForgroundColorKey.self] = newValue }
    }
}

public extension View {
    func lineForground(_ color: Color) -> some View {
        self.environment(\.lineForgroundColor, color)
    }
}
