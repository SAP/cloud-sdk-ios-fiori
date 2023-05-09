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

struct IconTrailedTitleLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 2) {
            configuration.title
            configuration.icon
        }
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

extension HorizontalAlignment {
    private enum StepsHorizontalAlignment: AlignmentID {
        static func defaultValue(in dimensions: ViewDimensions) -> CGFloat {
            dimensions[VerticalAlignment.top]
        }
    }

    static let stepsHorizontalAlignment = HorizontalAlignment(StepsHorizontalAlignment.self)
}

struct StepButtonStyle: ButtonStyle {
    let id: String
    let node: any View
    let title: any View
    let line: any View
    @Environment(\.stepsStyle) var stepsStyle

    var state: StepIndicatorState?
    var isSelected: Bool
    var isLastStep: Bool
        
    func makeBody(configuration: Self.Configuration) -> some View {
        let isPressed = configuration.isPressed
        let stepConfig = StepsConfiguration(node: StepsConfiguration.Node(body: self.node.typeErased),
                                            title: StepsConfiguration.Title(body: self.title.typeErased),
                                            line: StepsConfiguration.Line(body: self.line.typeErased),
                                            state: self.state,
                                            isPressed: isPressed,
                                            isSelected: self.isSelected,
                                            isLastStep: self.isLastStep)
        configuration.label
            .nodeModifier { _ in
                self.generateNode(stepConfig)
            }
            .titleModifier { _ in
                self.generateTitle(stepConfig)
            }
            .stepLineModifier { _ in
                self.generateLine(stepConfig)
            }
    }
    
    @ViewBuilder func generateNode(_ stepsConfig: StepsConfiguration) -> some View {
        if let s = stepsStyle(id) {
            s.makeNode(configuration: stepsConfig).typeErased
        } else {
            stepsConfig.node
        }
    }
    
    @ViewBuilder func generateTitle(_ stepsConfig: StepsConfiguration) -> some View {
        if let s = stepsStyle(id) {
            s.makeTitle(configuration: stepsConfig).typeErased
        } else {
            stepsConfig.title
        }
    }
    
    @ViewBuilder func generateLine(_ stepsConfig: StepsConfiguration) -> some View {
        if let s = stepsStyle(id) {
            s.makeLine(configuration: stepsConfig).typeErased
        } else {
            stepsConfig.line
        }
    }
}

/// Steps style for `StepProgressIndicator` which is initialized by `[StepItem]`.
public protocol StepsStyle {
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
    typealias Configuration = StepsConfiguration
}

public extension StepsStyle where Self.Node: View, Self.Title: View, Self.Line: View {
    private var defaultStyle: DefaultStepsStyle {
        DefaultStepsStyle()
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
public struct StepsConfiguration {
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
    public let node: StepsConfiguration.Node
    /// Title for `StepProgressIndicator`
    public let title: StepsConfiguration.Title
    /// Line for `StepProgressIndicator`
    public let line: StepsConfiguration.Line
    
    /// State for step in `StepProgressIndicator`.
    public let state: StepIndicatorState?
    /// Indicate whether step is pressed in `StepProgressIndicator`.
    public var isPressed: Bool
    /// Indicate whether step is selected in `StepProgressIndicator`.
    public var isSelected: Bool
    /// Indicate whether step is the last one in `StepProgressIndicator`.
    public var isLastStep: Bool?
}

struct DefaultStepsStyle: StepsStyle {
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
        switch state.convert(isSelected) {
        case .inactive, .active, .error, .none:
            return Color.preferredColor(.primaryBackground)
        case .completed:
            return Color.preferredColor(isPressed ? .tintColorTapState : .tintColor)
        case .disabled:
            return Color.preferredColor(.quaternaryFill)
        case .errorActive:
            return Color.preferredColor(.negativeBackground)
        }
    }
    
    func nodeForeground(_ state: StepIndicatorState?,
                        _ isSelected: Bool,
                        _ isPressed: Bool) -> Color
    {
        guard let state = state else { return Color.preferredColor(.tertiaryLabel) }
        switch state.convert(isSelected) {
        case .inactive, .disabled, .none:
            return Color.preferredColor(.tertiaryLabel)
        case .active:
            return Color.preferredColor(isPressed ? .tintColorTapState : .tintColor)
        case .completed:
            return Color.preferredColor(.primaryFill)
        case .error, .errorActive:
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        }
    }
    
    func nameColor(_ state: StepIndicatorState?,
                   _ isSelected: Bool,
                   _ isPressed: Bool) -> Color
    {
        guard let state = state else { return Color.preferredColor(.primaryLabel) }
        switch state.convert(isSelected) {
        case .inactive, .active, .completed, .none:
            return Color.preferredColor(.primaryLabel)
        case .disabled:
            return Color.preferredColor(.tertiaryLabel)
        case .error, .errorActive:
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        }
    }
    
    func nameFont(_ state: StepIndicatorState?, _ isSelected: Bool) -> Font {
        guard let state = state else { return Font.fiori(forTextStyle: .body) }
        let useSemibold: Bool
        switch state.convert(isSelected) {
        case .active, .errorActive:
            useSemibold = true
        case .completed, .inactive, .disabled, .error, .none:
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
        switch state.convert(isSelected) {
        case .inactive, .active:
            return Color.preferredColor(.separator)
        case .completed:
            return Color.preferredColor(isPressed ? .tintColorTapState : .tintColor)
        case .disabled:
            return Color.preferredColor(.tertiaryLabel)
        case .error, .errorActive:
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        case .none:
            return Color.preferredColor(.separator)
        }
    }
}
