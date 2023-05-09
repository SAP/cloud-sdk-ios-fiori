import SwiftUI
extension Fiori {
    enum SingleStep {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias Node = EmptyModifier
        typealias NodeCumulative = EmptyModifier
        static let title = Title()
        static let node = Node()
        static let titleCumulative = TitleCumulative()
        static let nodeCumulative = NodeCumulative()
    }
}

extension SingleStep where Substeps == EmptyView {
    /// Convenience initialization for empty sub-steps.
    /// - Parameters:
    ///   - id: String value for step id.
    ///   - title: Title for single step.
    ///   - node: Node for single step.
    public init(id: String = UUID().uuidString,
                @ViewBuilder title: () -> Title,
                @ViewBuilder node: () -> Node)
    {
        self.init(id: id, fromDataItems: false, title: title, node: node)
    }
    
    init(id: String = UUID().uuidString,
         fromDataItems: Bool = false,
         @ViewBuilder title: () -> Title,
         @ViewBuilder node: () -> Node)
    {
        self._id = id
        self.fromDataItems = fromDataItems
        self._title = title()
        self._node = node()
        self._substeps = EmptyView()
    }
}

public extension SingleStep where Title == EmptyView, Substeps == EmptyView {
    /// Convenience initialization for empty title and sub-steps.
    /// - Parameters:
    ///   - id: String value for step id.
    ///   - node: Node for single step.
    init(id: String = UUID().uuidString,
         @ViewBuilder node: () -> Node)
    {
        self.init(id: id, title: { EmptyView() }, node: node)
    }
}

extension SingleStep: View {
    var stepsSpacing: CGFloat {
        2
    }
    
    /// :nodoc:
    public var body: some View {
        switch stepAxis {
        case .horizontal:
            HStack {
                stepContainer
                ForEach(0 ..< substeps.count, id: \.self) { index in
                    substeps.view(at: index)
                }
            }
        case .vertical:
            VStack {
                stepContainer
                ForEach(0 ..< substeps.count, id: \.self) { index in
                    substeps.view(at: index)
                }
            }
        }
    }
    
    @ViewBuilder var stepContainer: some View {
        let step = InnerSingleStep(id: _id,
                                   title: title,
                                   node: node,
                                   line: line,
                                   isTitleEmptyView: isTitleEmptyView,
                                   top: top,
                                   bottom: bottom,
                                   leading: leading,
                                   trailing: trailing,
                                   horizontalSpacing: horizontalSpacing,
                                   verticalSpacing: verticalSpacing)
        if fromDataItems {
            step
        } else {
            Button {
                if currentStepId.wrappedValue != _id {
                    currentStepId.wrappedValue = _id
                }
            } label: {
                step
            }
            .buttonStyle(StepButtonStyle(id: _id,
                                         node: node,
                                         title: title,
                                         line: line,
                                         state: nil,
                                         isSelected: currentStepId.wrappedValue == _id,
                                         isLastStep: false))
        }
    }
    
    /// Separator line for `SingleStep`.
    @ViewBuilder public var line: some View {
        _line.modifier(stepLineModifier)
    }
    
    @ViewBuilder var _line: some View {
        Rectangle()
    }
    
    func stepPadding(top: CGFloat,
                     bottom: CGFloat,
                     leading: CGFloat,
                     trailing: CGFloat,
                     vertical: CGFloat,
                     horizontal: CGFloat) -> Self
    {
        var newSelf = self
        newSelf.top = top
        newSelf.bottom = bottom
        newSelf.leading = leading
        newSelf.trailing = trailing
        newSelf.horizontalSpacing = horizontal
        newSelf.verticalSpacing = vertical
        return newSelf
    }
    
    /// Customize step id.
    /// - Parameter id: String value for step id.
    /// - Returns: A new `SingleStep` with specific step id.
    public func customStepId(_ id: String) -> Self {
        var newSelf = self
        newSelf._id = id
        return newSelf
    }
}

extension CGSize {
    func different(with size: CGSize) -> Bool {
        if abs(self.width - size.width) > 0.01 || abs(self.height - size.height) > 0.01 {
            return true
        } else {
            return false
        }
    }
}

extension EmptyView: IndexedViewContainer {
    /// :nodoc:
    public var count: Int {
        0
    }
    
    /// :nodoc:
    public func view(at index: Int) -> some View {
        EmptyView()
    }
}

struct InnerSingleStep<Title: View, Node: View, Line: View>: View {
    let id: String
    let title: Title
    let node: Node
    let line: Line
    let isTitleEmptyView: Bool
    
    var top: CGFloat
    var bottom: CGFloat
    var leading: CGFloat
    var trailing: CGFloat
    var horizontalSpacing: CGFloat
    var verticalSpacing: CGFloat
    
    @Environment(\.stepsStyle) var stepsStyle
    @Environment(\.titleModifier) private var titleModifier
    @Environment(\.nodeModifier) private var nodeModifier
    @Environment(\.stepAxis) var stepAxis
    @Environment(\.stepLineModifier) var stepLineModifier

    @State var nodeAndLineSize: CGSize = .zero
    
    var stepsSpacing: CGFloat {
        2
    }
    
    var body: some View {
        oneStep
    }
    
    @ViewBuilder var styledNode: some View {
        node.modifier(nodeModifier)
    }
    
    @ViewBuilder var styledTitle: some View {
        title.modifier(titleModifier)
    }
    
    @ViewBuilder var styledLine: some View {
        line.modifier(stepLineModifier)
    }
    
    @ViewBuilder
    var oneStep: some View {
        switch stepAxis {
        case .horizontal:
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: top)
                HStack(spacing: stepsSpacing) {
                    styledNode
                    styledLine.frame(width: lineWidth, height: lineHeight)
                }.sizeReader { size in
                    if nodeAndLineSize.different(with: size) {
                        nodeAndLineSize = size
                    }
                }
                if isTitleEmptyView {
                    Spacer().frame(height: bottom)
                } else {
                    Spacer().frame(height: verticalSpacing)
                    styledTitle
                        .frame(width: nodeAndLineSize.width, alignment: .leading)
                        .lineLimit(2)
                    Spacer().frame(height: bottom)
                }
            }
        case .vertical:
            HStack(alignment: .stepsTopAlignment, spacing: 0) {
                Spacer().frame(width: leading)
                VStack(spacing: stepsSpacing) {
                    styledNode
                        .alignmentGuide(.stepsTopAlignment) { $0.height / 2.0 }
                    styledLine.frame(maxWidth: lineWidth, minHeight: lineHeight)
                }
                Spacer().frame(width: horizontalSpacing)
                styledTitle.lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .alignmentGuide(.stepsTopAlignment) {
                        ($0.height - ($0[.lastTextBaseline] - $0[.firstTextBaseline])) / 2
                    }
                Spacer().frame(width: trailing)
                Spacer()
            }
        }
    }
    
    var lineWidth: CGFloat {
        switch self.stepAxis {
        case .horizontal:
            return 54
        case .vertical:
            return 2
        }
    }
    
    var lineHeight: CGFloat {
        switch self.stepAxis {
        case .horizontal:
            return 2
        case .vertical:
            return 36
        }
    }
}
