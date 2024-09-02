import SwiftUI

/// Not used by developers.
public struct _DefaultSteps: IndexedViewContainer {
    var stepItems: [StepItem]
    @Binding var selection: String
    var isSubstep: Bool = false
    var allowLastLine: Bool = false
    
    init(stepItems: [StepItem],
         selection: Binding<String>,
         isSubstep: Bool = false,
         allowLastLine: Bool = false)
    {
        self.stepItems = stepItems
        self._selection = selection
        self.isSubstep = isSubstep
        self.allowLastLine = allowLastLine
    }
    
    /// :nodoc:
    public var count: Int {
        self.stepItems.count
    }
    
    /// :nodoc:
    @ViewBuilder
    public func view(at index: Int) -> some View {
        let data = self.stepItems[index]
        let isNotLastStep = index < self.count - 1
        let showLine: Bool = isNotLastStep || !data.substeps.isEmpty || self.allowLastLine
        
        Group {
            DefaultSingleStep(index: index,
                              stepItem: data,
                              selection: self.$selection,
                              isSubstep: self.isSubstep,
                              showLine: showLine)
                .id(data.id)
            if !data.substeps.isEmpty {
                StepProgressIndicatorContainer(selection: self.$selection,
                                               steps: _DefaultSteps(stepItems: data.substeps,
                                                                    selection: self.$selection,
                                                                    isSubstep: true,
                                                                    allowLastLine: isNotLastStep))
            }
        }
    }
}

struct DefaultSingleStep: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.stepAxis) var stepAxis
    @Environment(\.stepFrames) var stepFrames
    @Environment(\.stepProgressIndicatorNodeType) var type

    var stepItem: StepItem
    @Binding var selection: String
    var isSubstep: Bool = false
    var showLine: Bool = true
    var index: Int = 0
    
    init(index: Int,
         stepItem: StepItem,
         selection: Binding<String>,
         isSubstep: Bool = false,
         showLine: Bool = true)
    {
        self.index = index
        self.stepItem = stepItem
        self._selection = selection
        self.isSubstep = isSubstep
        self.showLine = showLine
    }
    
    var body: some View {
        Group {
            if self.isSubstep {
                self.singleSubstep()
            } else {
                self.singleStep()
            }
        }
        .frameReader(in: .named("SPICoordinateSpace")) { rect in
            self.stepFrames.wrappedValue[self.stepItem.id] = rect
        }
    }
    
    @ViewBuilder
    func singleStep() -> some View {
        if self.stepItem.state.isSupported {
            let isSelected = self.stepItem.id == self.selection
            SingleStep(id: self.stepItem.id) {
                if let title = stepItem.title {
                    Text(title)
                } else {
                    EmptyView()
                }
            } node: {
                ZStack {
                    self.node(by: self.stepItem.state, isSelected: isSelected)
                    switch self.type {
                    case .mixture:
                        if self.stepItem.icon.isEmpty {
                            Text("\(self.index + 1)")
                                .font(Font.fiori(forTextStyle: .footnote))
                        } else {
                            self.stepItem.icon
                        }
                    case .icon:
                        if self.stepItem.icon.isEmpty {
                            Image(systemName: "app.dashed")
                        } else {
                            self.stepItem.icon
                        }
                    case .text:
                        Text("\(self.index + 1)")
                            .font(Font.fiori(forTextStyle: .footnote))
                    }
                }
                .frame(width: self.sideLength, height: self.sideLength)
                .overlay {
                    if self.stepItem.state == .error {
                        Image(systemName: "exclamationmark.circle.fill")
                            .position(x: self.sideLength, y: 2)
                    }
                }
            }
            .update(self.stepItem.state, !self.showLine)
            .lineSize(self.lineSize)
            .stepPadding(top: self.defaultPadding,
                         bottom: self.defaultPadding,
                         leading: self.defaultPadding,
                         trailing: self.defaultPadding,
                         vertical: 8,
                         horizontal: 8)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func singleSubstep() -> some View {
        if self.stepItem.state.isSupported {
            let isSelected = self.stepItem.id == self.selection
            SingleStep(id: self.stepItem.id) {
                if let title = stepItem.title {
                    Text(title)
                } else {
                    EmptyView()
                }
            } node: {
                self.subnode(by: self.stepItem.state, isSelected: isSelected)
                    .frame(width: self.subnodeSideLength, height: self.subnodeSideLength)
            }
            .lineSize(self.lineSize)
            .update(self.stepItem.state, !self.showLine)
            .stepPadding(top: self.defaultPadding + (self.offset / 2),
                         bottom: (self.offset / 2) - self.defaultPadding,
                         leading: self.defaultPadding + (self.offset / 2),
                         trailing: (self.offset / 2) - self.defaultPadding,
                         vertical: 8 + (self.offset / 2),
                         horizontal: 8 + (self.offset / 2))
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func node(by state: StepProgressIndicatorState, isSelected: Bool) -> some View {
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
    func subnode(by state: StepProgressIndicatorState, isSelected: Bool) -> some View {
        switch (state, isSelected) {
        case (.error, false):
            Image(systemName: "exclamationmark.circle")
                .resizable()
        case (.error, true):
            Image(systemName: "exclamationmark.circle.fill")
                .resizable()
        case (.normal, true):
            ZStack {
                self.node(by: state, isSelected: isSelected)
                Circle().padding(4)
            }
        default:
            self.node(by: state, isSelected: isSelected)
        }
    }
    
    var defaultPadding: CGFloat {
        switch self.dynamicTypeSize {
        case .accessibility1:
            return 14
        case .accessibility2:
            return 16.5
        case .accessibility3:
            return 19
        case .accessibility4:
            return 21.5
        case .accessibility5:
            return 24
        default:
            return 8
        }
    }
    
    var offset: CGFloat {
        self.sideLength - self.subnodeSideLength
    }
    
    var sideLength: CGFloat {
        switch self.dynamicTypeSize {
        case .accessibility1:
            return 48
        case .accessibility2:
            return 57
        case .accessibility3:
            return 66
        case .accessibility4:
            return 75
        case .accessibility5:
            return 84
        default:
            return 28
        }
    }
    
    var subnodeSideLength: CGFloat {
        switch self.dynamicTypeSize {
        case .accessibility1:
            return 28
        case .accessibility2:
            return 33
        case .accessibility3:
            return 38
        case .accessibility4:
            return 43
        case .accessibility5:
            return 48
        default:
            return 16
        }
    }
    
    var lineSize: CGSize {
        switch (self.stepAxis, self.dynamicTypeSize) {
        case (.horizontal, .accessibility1):
            return CGSize(width: 114, height: 4)
        case (.horizontal, .accessibility2):
            return CGSize(width: 142, height: 4)
        case (.horizontal, .accessibility3):
            return CGSize(width: 170, height: 4)
        case (.horizontal, .accessibility4):
            return CGSize(width: 200, height: 4)
        case (.horizontal, .accessibility5):
            return CGSize(width: 227, height: 4)
        case (.horizontal, _):
            return CGSize(width: 54, height: 2)
        case (.vertical, .accessibility1):
            return CGSize(width: 4, height: 48)
        case (.vertical, .accessibility2):
            return CGSize(width: 4, height: 54)
        case (.vertical, .accessibility3):
            return CGSize(width: 4, height: 60)
        case (.vertical, .accessibility4):
            return CGSize(width: 4, height: 66)
        case (.vertical, .accessibility5):
            return CGSize(width: 4, height: 72)
        case (.vertical, _):
            return CGSize(width: 2, height: 36)
        }
    }
}
