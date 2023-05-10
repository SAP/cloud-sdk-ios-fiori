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
        if data.state.isSupported {
            let isSelected = data.id == self.selection
            SingleStep(id: data.id) {
                if let title = data.title {
                    Text(title)
                } else {
                    EmptyView()
                }
            } node: {
                ZStack {
                    node(by: data.state, isSelected: isSelected)
                    Text("\(index + 1)")
                        .font(Font.fiori(forTextStyle: .footnote))
                }
                .frame(width: nodeWidth, height: nodeHeight)
                .overlay {
                    if data.state == .error {
                        Image(systemName: "exclamationmark.circle.fill")
                            .position(x: nodeWidth, y: 2)
                    }
                }
            }.update(data.state, !showLine)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func singleSubstep(at index: Int, isTail: Bool = false) -> some View {
        let data = self.stepItems[index]
        if data.state.isSupported {
            let showLine = index < self.count - 1 || !data.substeps.isEmpty || !isTail
            let isSelected = data.id == self.selection
            SingleStep(id: data.id) {
                if let title = data.title {
                    Text(title)
                } else {
                    EmptyView()
                }
            } node: {
                subnode(by: data.state, isSelected: isSelected)
                    .frame(width: 16, height: 16)
            }
            .update(data.state, !showLine)
            .stepPadding(top: 14, bottom: 4, leading: 14, trailing: 4, vertical: 14, horizontal: 14)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func node(by state: StepIndicatorState, isSelected: Bool) -> some View {
        switch (state, isSelected) {
        case (.normal, true):
            Circle().strokeBorder(lineWidth: 2)
        case (.completed, _):
            Circle().fill(Color.clear)
        case (.disabled, _):
            let strokeStyle = StrokeStyle(lineWidth: 2, lineCap: .butt, lineJoin: .miter, miterLimit: 0, dash: [3], dashPhase: 0)
            Circle()
                .strokeBorder(style: strokeStyle)
        default:
            Circle().strokeBorder(lineWidth: 1)
        }
    }
    
    @ViewBuilder
    func subnode(by state: StepIndicatorState, isSelected: Bool) -> some View {
        switch (state, isSelected) {
        case (.error, false):
            Image(systemName: "exclamationmark.circle")
        case (.error, true):
            Image(systemName: "exclamationmark.circle.fill")
        case (.normal, true):
            ZStack {
                node(by: state, isSelected: isSelected)
                Circle().padding(4)
            }
        default:
            self.node(by: state, isSelected: isSelected)
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
