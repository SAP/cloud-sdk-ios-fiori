import FioriThemeManager
import SwiftUI

/// Step items data model for `StepProgressIndicator` with a default style.
public struct StepItem: Identifiable {
    /// Step id.
    public var id = UUID().uuidString
    /// Step title.
    public var title: String?
    /// Step state.
    public var state: StepIndicatorState
    /// Sub-steps for this one.
    public var substeps: [StepItem]
    
    /// Convenience initialization for step tiem.
    /// - Parameters:
    ///   - id: Step id.
    ///   - title: Step title.
    ///   - state: Step state.
    ///   - children: Sub-steps for this one.
    public init(id: String = UUID().uuidString,
                title: String? = nil,
                state: StepIndicatorState = [],
                substeps: [StepItem] = [])
    {
        self.id = id
        self.title = title
        self.state = state
        self.substeps = substeps
    }
}

extension VerticalAlignment {
    private enum StepsTopAlignment: AlignmentID {
        static func defaultValue(in dimensions: ViewDimensions) -> CGFloat {
            dimensions[VerticalAlignment.top]
        }
    }

    static let stepsTopAlignment = VerticalAlignment(StepsTopAlignment.self)
}

struct StepButtonStyle: ButtonStyle {
    let id: String
    let node: AnyView
    let title: AnyView
    let line: AnyView
    @Environment(\.stepStyle) var stepStyle
    
    var state: StepIndicatorState?
    var isSelected: Bool
    var isLastStep: Bool
    
    let isTitleEmptyView: Bool
    var top: CGFloat
    var bottom: CGFloat
    var leading: CGFloat
    var trailing: CGFloat
    var horizontalSpacing: CGFloat
    var verticalSpacing: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let isPressed = configuration.isPressed
        let stepConfig = StepConfiguration(node: StepConfiguration.Node(body: self.node.typeErased),
                                           title: StepConfiguration.Title(body: self.title.typeErased),
                                           line: StepConfiguration.Line(body: self.line.typeErased),
                                           state: self.state,
                                           isPressed: isPressed,
                                           isSelected: self.isSelected,
                                           isLastStep: self.isLastStep)
        InnerSingleStep(id: self.id,
                        title: self.generateTitle(stepConfig),
                        node: self.generateNode(stepConfig),
                        line: self.generateLine(stepConfig),
                        isTitleEmptyView: self.isTitleEmptyView,
                        top: self.top,
                        bottom: self.bottom,
                        leading: self.leading,
                        trailing: self.trailing,
                        horizontalSpacing: self.horizontalSpacing,
                        verticalSpacing: self.verticalSpacing)
    }
    
    @ViewBuilder func generateNode(_ stepConfig: StepConfiguration) -> some View {
        if let s = stepStyle(id) {
            s.makeNode(configuration: stepConfig).typeErased
        } else {
            stepConfig.node
        }
    }
    
    @ViewBuilder func generateTitle(_ stepConfig: StepConfiguration) -> some View {
        if let s = stepStyle(id) {
            s.makeTitle(configuration: stepConfig).typeErased
        } else {
            stepConfig.title
        }
    }
    
    @ViewBuilder func generateLine(_ stepConfig: StepConfiguration) -> some View {
        if let s = stepStyle(id) {
            s.makeLine(configuration: stepConfig).typeErased
        } else {
            stepConfig.line
        }
    }
}

/// Steps style for `StepProgressIndicator` which is initialized by `[StepItem]`.
public protocol StepStyle {
    /// A view that represents the node of a step.
    associatedtype Node: View
    /// A view that represents the title of a step.
    associatedtype Title: View
    /// A view that represents the separator line of a step.
    associatedtype Line: View
    
    /// Node style for `StepProgressIndicator`.
    /// - Parameter configuration: configuration for node in `StepProgressIndicator`.
    /// - Returns: A new `StepProgressIndicator` with specific node.
    @ViewBuilder func makeNode(configuration: Self.Configuration) -> Self.Node

    /// Title style for `StepProgressIndicator`.
    /// - Parameter configuration: configuration for title in `StepProgressIndicator`.
    /// - Returns: A new `StepProgressIndicator` with specific title.
    @ViewBuilder func makeTitle(configuration: Self.Configuration) -> Self.Title
    
    /// Line style for `StepProgressIndicator`.
    /// - Parameter configuration: configuration for line in `StepProgressIndicator`.
    /// - Returns: A new `StepProgressIndicator` with specific line.
    @ViewBuilder func makeLine(configuration: Self.Configuration) -> Self.Line
    
    /// The properties of a step.
    typealias Configuration = StepConfiguration
}

public extension StepStyle where Self.Node: View, Self.Title: View, Self.Line: View {
    private var defaultStyle: DefaultStepStyle {
        DefaultStepStyle()
    }
    
    /// Use `default` style node for `StepProgressIndicator`
    @ViewBuilder func makeNode(configuration: Self.Configuration) -> some View {
        self.defaultStyle.makeNode(configuration: configuration)
    }
    
    /// Use `default` style title for `StepProgressIndicator`
    @ViewBuilder func makeTitle(configuration: Self.Configuration) -> some View {
        self.defaultStyle.makeTitle(configuration: configuration)
    }
    
    /// Use `default` style line for `StepProgressIndicator`
    @ViewBuilder func makeLine(configuration: Self.Configuration) -> some View {
        self.defaultStyle.makeLine(configuration: configuration)
    }
}

/// Steps configuration used for `StepStyle`.
public struct StepConfiguration {
    /// :nodoc
    public struct Node: View {
        public var body: AnyView
    }

    /// :nodoc:
    public struct Title: View {
        public var body: AnyView
    }

    /// :nodoc
    public struct Line: View {
        public var body: AnyView
    }

    /// Node for `StepProgressIndicator`
    public let node: StepConfiguration.Node
    /// Title for `StepProgressIndicator`
    public let title: StepConfiguration.Title
    /// Line for `StepProgressIndicator`
    public let line: StepConfiguration.Line
    
    /// State for step in `StepProgressIndicator`.
    public let state: StepIndicatorState?
    /// Indicate whether step is pressed in `StepProgressIndicator`.
    public var isPressed: Bool
    /// Indicate whether step is selected in `StepProgressIndicator`.
    public var isSelected: Bool
    /// Indicate whether step is the last one in `StepProgressIndicator`.
    public var isLastStep: Bool?
}

struct DefaultStepStyle: StepStyle {
    func makeNode(configuration: Self.Configuration) -> some View {
        let isPressed = configuration.isPressed
        let isSelected = configuration.isSelected
        let state = configuration.state
        configuration.node
            .background(self.nodeBackground(state, isSelected, isPressed).clipShape(Circle()))
            .foregroundColor(self.nodeForeground(state, isSelected, isPressed))
    }
    
    func makeTitle(configuration: Self.Configuration) -> some View {
        let isPressed = configuration.isPressed
        let isSelected = configuration.isSelected
        let state = configuration.state
        configuration.title
            .foregroundColor(self.nameColor(state, isSelected, isPressed))
            .font(self.nameFont(state, isSelected))
    }
    
    func makeLine(configuration: Self.Configuration) -> some View {
        let isPressed = configuration.isPressed
        let isSelected = configuration.isSelected
        let state = configuration.state
        let showLine = !(configuration.isLastStep ?? true)
        configuration.line
            .foregroundColor(self.lineColor(state, isSelected, isPressed, showLine))
    }
    
    func nodeBackground(_ state: StepIndicatorState?,
                        _ isSelected: Bool,
                        _ isPressed: Bool) -> Color
    {
        guard let state = state else { return Color.preferredColor(.primaryBackground) }
        switch (state, isSelected) {
        case (.completed, _):
            return Color.preferredColor(isPressed ? .tintColorTapState : .tintColor)
        case (.disabled, _):
            return Color.preferredColor(.quaternaryFill)
        case (.error, true):
            return Color.preferredColor(.negativeBackground)
        default:
            return Color.preferredColor(.primaryBackground)
        }
    }
    
    func nodeForeground(_ state: StepIndicatorState?,
                        _ isSelected: Bool,
                        _ isPressed: Bool) -> Color
    {
        guard let state = state else { return Color.preferredColor(.tertiaryLabel) }
        switch (state, isSelected) {
        case (.normal, true):
            return Color.preferredColor(isPressed ? .tintColorTapState : .tintColor)
        case (.completed, _):
            return Color.preferredColor(.primaryFill)
        case (.error, _):
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        default:
            return Color.preferredColor(.tertiaryLabel)
        }
    }
    
    func nameColor(_ state: StepIndicatorState?,
                   _ isSelected: Bool,
                   _ isPressed: Bool) -> Color
    {
        guard let state = state else { return Color.preferredColor(.primaryLabel) }
        switch (state, isSelected) {
        case (.disabled, _):
            return Color.preferredColor(.tertiaryLabel)
        case (.error, _):
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        default:
            return Color.preferredColor(.primaryLabel)
        }
    }
    
    func nameFont(_ state: StepIndicatorState?, _ isSelected: Bool) -> Font {
        guard let state = state else { return Font.fiori(forTextStyle: .body) }
        let useSemibold: Bool
        switch (state, isSelected) {
        case (.normal, true), (.error, true):
            useSemibold = true
        default:
            useSemibold = false
        }
        return Font.fiori(forTextStyle: .footnote)
            .weight(useSemibold ? .semibold : .regular)
    }
    
    func lineColor(_ state: StepIndicatorState?,
                   _ isSelected: Bool,
                   _ isPressed: Bool,
                   _ showLine: Bool) -> Color
    {
        guard let state = state else { return Color.preferredColor(.separator) }
        if showLine {
            return self.line(state, isSelected, isPressed)
        } else {
            return Color.clear
        }
    }
    
    func line(_ state: StepIndicatorState, _ isSelected: Bool, _ isPressed: Bool) -> Color {
        switch (state, isSelected) {
        case (.completed, _):
            return Color.preferredColor(isPressed ? .tintColorTapState : .tintColor)
        case (.disabled, _):
            return Color.preferredColor(.tertiaryLabel)
        case (.error, _):
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        default:
            return Color.preferredColor(.separator)
        }
    }
}
