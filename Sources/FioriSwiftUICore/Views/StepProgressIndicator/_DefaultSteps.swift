import SwiftUI

public struct _DefaultSteps: IndexedViewContainer {
    var stepsData: [StepItem]
    @Binding var selection: UUID
    
    public var count: Int {
        self.stepsData.count
    }
    
    @ViewBuilder
    public func view(at index: Int) -> some View {
        let stepData = self.stepsData[index]
        if let children = stepData.children {
            Group {
                self.singleStep(at: index)
                ForEach(0 ..< children.count, id: \.self) { subIndex in
                    self.singleSubstep(at: subIndex, for: children, isTail: index == count - 1)
                }
            }
        } else {
            self.singleStep(at: index)
        }
    }
    
    @ViewBuilder
    func singleStep(at index: Int) -> some View {
        let data = self.stepsData[index]
        let showLine = index < self.count - 1 || !(data.children?.isEmpty ?? true)
        if let state = state(at: index, for: stepsData) {
            Button {
                if state != .disabled {
                    selection = stepsData[index].id
                }
            } label: {
                SingleStep {
                    Text(data.title ?? "")
                } node: {
                    ZStack {
                        node(by: state)
                        Text("\(index + 1)")
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
            .buttonStyle(StepButtonStyle(state: state, showLine: showLine))
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func singleSubstep(at index: Int, for children: [StepItem], isTail: Bool = false) -> some View {
        let data = children[index]
        if let state = state(at: index, for: children) {
            let showLine = (index < children.count - 1) || !isTail
            Button {
                if state != .disabled {
                    selection = children[index].id
                }
            } label: {
                SingleStep {
                    Text(data.title ?? "")
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
            .buttonStyle(StepButtonStyle(state: state, showLine: showLine))
        } else {
            EmptyView()
        }
    }
    
    func state(at index: Int, for data: [StepItem]) -> InternalStepState? {
        let data = data[index]
        let isSelected = data.id == self.selection
        return data.state.convert(isSelected)
    }
    
    @ViewBuilder
    func node(by state: InternalStepState) -> some View {
        switch state {
        case .active:
            Circle().strokeBorder(lineWidth: 2)
        case .completed:
            Circle().fill(Color.clear)
        case .disabled:
            let strokeStyle = StrokeStyle(lineWidth: 2, lineCap: .butt, lineJoin: .miter, miterLimit: 0, dash: [3], dashPhase: 0)
            Circle()
                .strokeBorder(style: strokeStyle)
        case .inactive, .error, .errorActive:
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
