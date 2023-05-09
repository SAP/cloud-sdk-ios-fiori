import SwiftUI

/// Not used by developers.
public struct _DefaultSteps: IndexedViewContainer {
    var stepItems: [StepItem]
    @Binding var selection: String
    var isSubstep: Bool = false
    
    init(stepItems: [StepItem],
         selection: Binding<String>,
         isSubstep: Bool = false)
    {
        self.stepItems = stepItems
        self._selection = selection
        self.isSubstep = isSubstep
    }
    
    /// :nodoc:
    public var count: Int {
        self.stepItems.count
    }
    
    /// :nodoc:
    @ViewBuilder
    public func view(at index: Int) -> some View {
        let data = self.stepItems[index]
        if self.isSubstep {
            Group {
                singleSubstep(at: index)
                if !data.substeps.isEmpty {
                    StepProgressIndicatorContainer(selection: $selection,
                                                   steps: _DefaultSteps(stepItems: data.substeps,
                                                                        selection: $selection,
                                                                        isSubstep: true))
                }
            }
        } else {
            Group {
                singleStep(at: index)
                if !data.substeps.isEmpty {
                    StepProgressIndicatorContainer(selection: $selection,
                                                   steps: _DefaultSteps(stepItems: data.substeps,
                                                                        selection: $selection,
                                                                        isSubstep: true))
                }
            }
        }
    }
    
    @ViewBuilder
    func singleStep(at index: Int) -> some View {
        let data = self.stepItems[index]
        let showLine = index < self.count - 1 || !data.substeps.isEmpty
        if let state = state(at: index) {
            let step = SingleStep(id: data.id, fromDataItems: true) {
                if let title = data.title {
                    Text(title)
                } else {
                    EmptyView()
                }
            } node: {
                ZStack {
                    node(by: state)
                    Text("\(index + 1)")
                        .font(Font.fiori(forTextStyle: .footnote))
                }
                .frame(width: nodeWidth, height: nodeHeight)
                .overlay {
                    if state == .error || state == .errorActive {
                        Image(systemName: "exclamationmark.circle.fill")
                            .position(x: nodeWidth, y: 2)
                    }
                }
            }
            Button {
                if state != .disabled {
                    selection = data.id
                }
            } label: {
                step
            }
            .disabled(state == .disabled)
            .buttonStyle(StepButtonStyle(id: data.id,
                                         node: step._node,
                                         title: step._title,
                                         line: step._line,
                                         state: data.state,
                                         isSelected: data.id == self.selection,
                                         isLastStep: !showLine))
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func singleSubstep(at index: Int, isTail: Bool = false) -> some View {
        let data = self.stepItems[index]
        if let state = state(at: index) {
            let showLine = index < self.count - 1 || !data.substeps.isEmpty || !isTail
            let step = SingleStep(id: data.id, fromDataItems: true) {
                if let title = data.title {
                    Text(title)
                } else {
                    EmptyView()
                }
            } node: {
                Group {
                    if state == .error {
                        Image(systemName: "exclamationmark.circle")
                    } else if state == .errorActive {
                        Image(systemName: "exclamationmark.circle.fill")
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
            
            Button {
                if state != .disabled {
                    selection = data.id
                }
            } label: {
                step
            }
            .disabled(state == .disabled)
            .buttonStyle(StepButtonStyle(id: data.id,
                                         node: step._node,
                                         title: step._title,
                                         line: step._line,
                                         state: data.state,
                                         isSelected: data.id == self.selection,
                                         isLastStep: !showLine))
        } else {
            EmptyView()
        }
    }
    
    func state(at index: Int) -> InternalStepState? {
        let data = self.stepItems[index]
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
