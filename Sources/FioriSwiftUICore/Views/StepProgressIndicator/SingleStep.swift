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
        self.init(id: id, tappable: true, title: title, node: node)
    }
    
    init(id: String = UUID().uuidString,
         tappable: Bool = true,
         @ViewBuilder title: () -> Title,
         @ViewBuilder node: () -> Node)
    {
        self._id = id
        self.tappable = tappable
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
        self.init(id: id, tappable: true, title: { EmptyView() }, node: node)
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
                oneStep
                    .ifApply(tappable) {
                        $0.onTapGesture {
                            currentStepId.wrappedValue = _id
                        }
                    }
                ForEach(0 ..< substeps.count, id: \.self) { index in
                    substeps.view(at: index)
                }
            }
        case .vertical:
            VStack {
                oneStep
                    .ifApply(tappable) {
                        $0.onTapGesture {
                            currentStepId.wrappedValue = _id
                        }
                    }
                ForEach(0 ..< substeps.count, id: \.self) { index in
                    substeps.view(at: index)
                }
            }
        }
    }
    
    @ViewBuilder
    var oneStep: some View {
        switch stepAxis {
        case .horizontal:
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: top)
                HStack(spacing: stepsSpacing) {
                    node
                    Rectangle().fill(stepLineColor)
                        .frame(width: lineWidth, height: lineHeight)
                }.sizeReader { size in
                    if nodeAndLineSize.different(with: size) {
                        nodeAndLineSize = size
                    }
                }
                Spacer().frame(height: verticalSpacing)
                title
                    .frame(width: nodeAndLineSize.width, alignment: .leading)
                    .lineLimit(2)
                Spacer().frame(height: bottom)
            }
        case .vertical:
            HStack(alignment: .stepsTopAlignment, spacing: 0) {
                Spacer().frame(width: leading)
                VStack(spacing: stepsSpacing) {
                    node
                        .alignmentGuide(.stepsTopAlignment) { $0.height / 2.0 }
                    Rectangle().fill(stepLineColor)
                        .frame(maxWidth: lineWidth, minHeight: lineHeight)
                }
                Spacer().frame(width: horizontalSpacing)
                title.lineLimit(nil)
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
        switch stepAxis {
        case .horizontal:
            return 54
        case .vertical:
            return 2
        }
    }
    
    var lineHeight: CGFloat {
        switch stepAxis {
        case .horizontal:
            return 2
        case .vertical:
            return 36
        }
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

struct StepLineColor: EnvironmentKey {
    static let defaultValue = Color.clear
}

public extension EnvironmentValues {
    /// Single step line color environment value.
    var stepLineColor: Color {
        get { self[StepLineColor.self] }
        set { self[StepLineColor.self] = newValue }
    }
}

public extension View {
    /// Customize `SingleStep` line color.
    /// - Parameter color: Line color for `SingleStep`.
    /// - Returns: A new view with specific line color.
    func stepLineColor(_ color: Color) -> some View {
        environment(\.stepLineColor, color)
    }
}

struct StepAxisKey: EnvironmentKey {
    static let defaultValue = Axis.horizontal
}

extension EnvironmentValues {
    var stepAxis: Axis {
        get { self[StepAxisKey.self] }
        set { self[StepAxisKey.self] = newValue }
    }
}

extension View {
    func stepAxis(_ axis: Axis) -> some View {
        self.environment(\.stepAxis, axis)
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
