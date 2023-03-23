import FioriThemeManager
import SwiftUI

public protocol StepModel: SingleStepComponent {
    var state: StepIndicatorState { get }
}

public struct StepProgressIndicatorView<Step: View, Action: View>: View {
    @Binding public var selection: IndexPath
    public var stepsData: [[StepModel]]
    var currentStepName: Step
    var allStepsAction: Action
    
    var stepsCount: Int {
        self.stepsData.count
    }
    
    public init(selection: Binding<IndexPath>,
                stepsData: [[StepModel]]) where Step == EmptyView, Action == EmptyView
    {
        self._selection = selection
        self.stepsData = stepsData
        self.currentStepName = EmptyView()
        self.allStepsAction = EmptyView()
    }
    
    public init(selection: Binding<IndexPath>,
                stepsData: [[StepModel]],
                @ViewBuilder currentStepName: @escaping () -> Step,
                @ViewBuilder allStepsAction: @escaping () -> Action)
    {
        self._selection = selection
        self.stepsData = stepsData
        self.currentStepName = currentStepName()
        self.allStepsAction = allStepsAction()
    }
    
    public var body: some View {
        StepProgressIndicator {
            currentStepName
        } allStepsAction: {
            allStepsAction
        } steps: {
            createSteps()
        }
    }
    
    @ViewBuilder
    func createSteps() -> some View {
        Group {
            ForEach(0 ..< stepsCount, id: \.self) { section in
                let steps = stepsData[section]
                ForEach(0 ..< steps.count, id: \.self) { row in
                    if row == 0 {
                        singleStep(at: IndexPath(item: row, section: section))
                    } else {
                        subStep(at: IndexPath(item: row, section: section))
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func singleStep(at index: IndexPath) -> some View {
        let data = self.stepsData[index.section][index.row]
        let state = state(for: index)
        
        Button {
            if state != .disabled {
                selection = index
            }
        } label: {
            SingleStep {
                Text(data.name ?? "")
            } overText: {
                ZStack {
                    node(by: state)
                    Text(data.overText ?? "")
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
        }
        .buttonStyle(StepButtonStyle(state: state, showLine: index.section < self.stepsCount - 1))
    }
    
    @ViewBuilder
    func subStep(at index: IndexPath) -> some View {
        let data = self.stepsData[index.section][index.row]
        let state = state(for: index)
        Button {
            if state != .disabled {
                selection = index
            }
        } label: {
            SingleStep {
                Text(data.name ?? "")
            } overText: {
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
        .buttonStyle(StepButtonStyle(state: state, showLine: index.section < self.stepsCount - 1))
    }
    
    func state(for index: IndexPath) -> StepIndicatorState {
        let data = self.stepsData[index.section][index.row]
        if index == self.selection && data.state == .inactive {
            return .active
        } else if data.state == .active && index != self.selection {
            return .inactive
        } else {
            return data.state
        }
    }
    
    @ViewBuilder
    func node(by state: StepIndicatorState) -> some View {
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
}

extension StepProgressIndicatorView {
    var nodeWidth: CGFloat {
        28
    }

    var nodeHeight: CGFloat {
        28
    }
}
