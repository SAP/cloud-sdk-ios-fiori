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
    var stepsCount: Int {
        steps.count
    }
    
    var stepsSpacing: CGFloat {
        2
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

public extension StepProgressIndicator {
    init(selection: Binding<Int>,
         stepsData: [StepModel])
        where Steps == DefaultSteps, AllStepsActionView == EmptyView, CurrentStepName == EmptyView, CancelActionView == Action
    {
        self.selection = selection
        self.stepsData = stepsData
        
        self._currentStepName = EmptyView()
        self._allStepsAction = EmptyView()
        self._cancelAction = Action(model: _CancelActionDefault())
        
        self._steps = DefaultSteps(stepsData: stepsData,
                                   selection: selection)
    }
    
    init(selection: Binding<Int>,
         stepsData: [StepModel],
         @ViewBuilder currentStepName: @escaping () -> CurrentStepName,
         @ViewBuilder allStepsAction: @escaping () -> AllStepsActionView)
        where Steps == DefaultSteps, CancelActionView == Action
    {
        self.selection = selection
        self.stepsData = stepsData
        self._currentStepName = currentStepName()
        self._allStepsAction = allStepsAction()
        self._cancelAction = Action(model: _CancelActionDefault())

        self._steps = DefaultSteps(stepsData: stepsData,
                                   selection: selection)
    }
    
    init(selection: Binding<Int>,
         stepsData: [StepModel],
         @ViewBuilder allStepsAction: @escaping () -> AllStepsActionView)
        where Steps == DefaultSteps, CancelActionView == Action, CurrentStepName == EmptyView
    {
        self.selection = selection
        self.stepsData = stepsData
        self._currentStepName = EmptyView()
        self._allStepsAction = allStepsAction()
        self._cancelAction = Action(model: _CancelActionDefault())
        
        self._steps = DefaultSteps(stepsData: stepsData,
                                   selection: selection)
    }
    
    init(selection: Binding<Int>,
         stepsData: [StepModel],
         @ViewBuilder currentStepName: @escaping () -> CurrentStepName)
        where Steps == DefaultSteps, CancelActionView == Action, AllStepsActionView == EmptyView
    {
        self.selection = selection
        self.stepsData = stepsData
        self._currentStepName = currentStepName()
        self._allStepsAction = EmptyView()
        self._cancelAction = Action(model: _CancelActionDefault())
        
        self._steps = DefaultSteps(stepsData: stepsData,
                                   selection: selection)
    }
}

public struct DefaultSteps: IndexedViewContainer {
    var stepsData: [StepModel]
    @Binding var selection: Int
    
    public var count: Int {
        self.stepsData.count
    }
    
    public func view(at index: Int) -> some View {
        self.singleStep(at: index)
    }
    
    @ViewBuilder
    func singleStep(at index: Int) -> some View {
        let data = self.stepsData[index]
        let state = state(for: index)
        
        Button {
            if state != .disabled {
                selection = index
            }
        } label: {
            if let txt = data.node {
                SingleStep {
                    Text(data.name ?? "")
                } node: {
                    ZStack {
                        node(by: state)
                        Text(txt)
                            .font(Font.fiori(forTextStyle: .footnote))
                    }
                    .frame(width: nodeWidth, height: nodeHeight)
                    .overlay {
                        if state == .error || state == .errorActive {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .position(x: nodeWidth, y: 2)
                        }
                    }
                }
            } else {
                SingleStep {
                    Text(data.name ?? "")
                } node: {
                    Group {
                        if state == .error {
                            Image(systemName: "exclamationmark.triangle")
                        } else if state == .errorActive {
                            Image(systemName: "exclamationmark.triangle.fill")
                        } else if state == .active {
                            ZStack {
                                node(by: state)
                                Circle().padding(4)
                            }
                        } else {
                            node(by: state)
                        }
                    }.frame(width: 16, height: 16)
                }.stepPadding(top: 14, bottom: 4, leading: 14, trailing: 4, vertical: 14, horizontal: 14)
            }
        }
        .buttonStyle(StepButtonStyle(state: state, showLine: index < self.count - 1))
    }
    
    func state(for index: Int) -> InternalStepState {
        let data = self.stepsData[index]
        let isSelected = index == self.selection
        return data.state.convert(isSelected)
    }
    
    @ViewBuilder
    func node(by state: InternalStepState) -> some View {
        switch state {
        case .inactive:
            Circle().strokeBorder(lineWidth: 1)
        case .active:
            Circle().strokeBorder(lineWidth: 2)
        case .completed:
            Circle().fill(Color.clear)
        case .disabled:
            let strokeStyle = StrokeStyle(lineWidth: 2, lineCap: .butt, lineJoin: .miter, miterLimit: 0, dash: [3], dashPhase: 0)
            Circle()
                .strokeBorder(style: strokeStyle)
        case .error:
            Circle()
                .strokeBorder(lineWidth: 1)
        case .errorActive:
            Circle().strokeBorder(lineWidth: 1)
        }
    }
    
    var stepsSpacing: CGFloat {
        2
    }
    
    var nodeWidth: CGFloat {
        28
    }

    var nodeHeight: CGFloat {
        28
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
