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

/// Not for developers
public struct _StepNode: View {
    var state: StepIndicatorState
    /// :nodoc:
    public var body: some View {
        node().frame(width: 28, height: 28)
    }
    
    @ViewBuilder func node() -> some View {
        switch self.state {
        case .normal:
            Circle().strokeBorder(lineWidth: 2)
        case .completed:
            Circle().fill(Color.clear)
        case .disabled:
            let strokeStyle = StrokeStyle(lineWidth: 2, lineCap: .butt, lineJoin: .miter, miterLimit: 0, dash: [3], dashPhase: 0)
            Circle()
                .strokeBorder(style: strokeStyle)
        default:
            Circle().strokeBorder(lineWidth: 1)
        }
    }
}

public extension SingleStep where Title == _ConditionalContent<Text, EmptyView>,
    Node == _StepNode,
    Substeps == _StepItemsContainer
{
    /// Generic `SingleStep` by `StepItem`
    /// - Parameter item: A `StepItem`.
    init(item: StepItem) {
        self._id = item.id
        if let t = item.title {
            self._title = ViewBuilder.buildEither(first: Text(t))
        } else {
            self._title = ViewBuilder.buildEither(second: EmptyView())
        }
        self._node = _StepNode(state: item.state)
        self._substeps = _StepItemsContainer(item.substeps)
        self.state = item.state
    }
}

public extension SingleStep where Substeps == EmptyView {
    /// Convenience initialization for empty sub-steps.
    /// - Parameters:
    ///   - id: String value for step id.
    ///   - title: Title for single step.
    ///   - node: Node for single step.
    init(id: String = UUID().uuidString,
         @ViewBuilder title: () -> Title,
         @ViewBuilder node: () -> Node)
    {
        self._id = id
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
        Button {
            if currentStepId.wrappedValue != _id, state != .disabled {
                currentStepId.wrappedValue = _id
            }
        } label: {
            // setup label in button style
            EmptyView()
        }
        .buttonStyle(StepButtonStyle(id: _id,
                                     node: node.typeErased,
                                     title: title.typeErased,
                                     line: line.typeErased,
                                     state: state,
                                     isSelected: currentStepId.wrappedValue == _id,
                                     isLastStep: isLastStep,
                                     isTitleEmptyView: isTitleEmptyView,
                                     top: top,
                                     bottom: bottom,
                                     leading: leading,
                                     trailing: trailing,
                                     horizontalSpacing: horizontalSpacing,
                                     verticalSpacing: verticalSpacing))
    }
    
    func update(_ state: StepIndicatorState,
                _ isLastStep: Bool = false) -> Self
    {
        var newSelf = self
        newSelf.state = state
        newSelf.isLastStep = isLastStep
        return newSelf
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
    
    @Environment(\.stepStyle) var stepStyle
    @Environment(\.stepAxis) var stepAxis

    @State var nodeAndLineSize: CGSize = .zero
    
    var stepsSpacing: CGFloat {
        2
    }
    
    var body: some View {
        oneStep
    }
        
    @ViewBuilder
    var oneStep: some View {
        switch stepAxis {
        case .horizontal:
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: top)
                HStack(spacing: stepsSpacing) {
                    node
                    line.frame(width: lineWidth, height: lineHeight)
                }.sizeReader { size in
                    if nodeAndLineSize.different(with: size) {
                        nodeAndLineSize = size
                    }
                }
                if isTitleEmptyView {
                    Spacer().frame(height: bottom)
                } else {
                    Spacer().frame(height: verticalSpacing)
                    title
                        .frame(width: nodeAndLineSize.width, alignment: .leading)
                        .lineLimit(2)
                    Spacer().frame(height: bottom)
                }
            }
        case .vertical:
            HStack(alignment: .stepsTopAlignment, spacing: 0) {
                Spacer().frame(width: leading)
                VStack(spacing: stepsSpacing) {
                    node
                        .alignmentGuide(.stepsTopAlignment) { $0.height / 2.0 }
                    line.frame(maxWidth: lineWidth, minHeight: lineHeight)
                }
                Spacer().frame(width: horizontalSpacing)
                title.lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .alignmentGuide(.stepsTopAlignment) {
                        ($0.height - ($0[.lastTextBaseline] - $0[.firstTextBaseline])) / 2
                    }
                    .alignmentGuide(.stepsLeadingAlignment) { $0[.leading] }
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
