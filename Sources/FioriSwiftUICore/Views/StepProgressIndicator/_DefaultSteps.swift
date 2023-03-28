import SwiftUI

public struct _DefaultSteps: IndexedViewContainer {
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
                    Text(data.title ?? "")
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
