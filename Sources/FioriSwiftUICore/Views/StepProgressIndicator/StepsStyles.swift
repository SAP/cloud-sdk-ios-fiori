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
    let node: any View
    let title: any View
    let line: any View
    @Environment(\.stepsStyle) var stepsStyle

    var state: StepIndicatorState
    var isSelected: Bool
    var isLastStep: Bool
        
    func makeBody(configuration: Self.Configuration) -> some View {
        let isPressed = configuration.isPressed
        
        let nodeConfig = StepNodeConfiguration(node: StepNodeConfiguration.Node(body: self.node.typeErased),
                                               state: self.state,
                                               isPressed: isPressed,
                                               isSelected: self.isSelected)
        let titleConfig = StepTitleConfiguration(title: StepTitleConfiguration.Title(body: self.title.typeErased),
                                                 state: self.state,
                                                 isPressed: isPressed,
                                                 isSelected: self.isSelected)
        let lineConfig = StepLineConfiguration(line: StepLineConfiguration.Line(body: self.line.typeErased),
                                               state: self.state,
                                               isPressed: isPressed,
                                               isSelected: self.isSelected,
                                               isLastStep: self.isLastStep)
        
        configuration.label
            .nodeModifier { _ in
                stepsStyle.makeNode(configuration: nodeConfig).typeErased
            }
            .titleModifier { _ in
                stepsStyle.makeTitle(configuration: titleConfig).typeErased
            }
            .stepLineModifier { _ in
                stepsStyle.makeLine(configuration: lineConfig).typeErased
            }
    }
}

struct StepsStyleKey: EnvironmentKey {
    static var defaultValue: any StepsStyle = DefaultStepsStyle()
}

extension EnvironmentValues {
    var stepsStyle: any StepsStyle {
        get { self[StepsStyleKey.self] }
        set { self[StepsStyleKey.self] = newValue }
    }
}

public extension View {
    /// Step style for `StepProgressIndicator`.
    /// - Parameter style: Style for `StepProgressIndicator`.
    /// - Returns: A new `StepProgressIndicator` with specific style.
    func stepsStyle(_ style: some StepsStyle) -> some View {
        environment(\.stepsStyle, style)
    }
}

/// Steps style for `StepProgressIndicator`.
public protocol StepsStyle {
    associatedtype Node: View
    associatedtype Title: View
    associatedtype Line: View
    
    /// Node style for `StepProgressIndicator`.
    /// - Parameter configuration: configuration for node in `StepProgressIndicator`.
    /// - Returns: A new `StepProgressIndicator` with specific node.
    @ViewBuilder func makeNode(configuration: StepNodeConfiguration) -> Self.Node

    /// Title style for `StepProgressIndicator`.
    /// - Parameter configuration: configuration for title in `StepProgressIndicator`.
    /// - Returns: A new `StepProgressIndicator` with specific title.
    @ViewBuilder func makeTitle(configuration: StepTitleConfiguration) -> Self.Title
    
    /// Line style for `StepProgressIndicator`.
    /// - Parameter configuration: configuration for line in `StepProgressIndicator`.
    /// - Returns: A new `StepProgressIndicator` with specific line.
    @ViewBuilder func makeLine(configuration: StepLineConfiguration) -> Self.Line
}

/// Step node configuration used for `StepStyle`.
public struct StepNodeConfiguration {
    /// :nodoc
    public struct Node: View {
        public var body: AnyView
    }

    /// :nodoc
    public let node: StepNodeConfiguration.Node
    
    /// State for step in `StepProgressIndicator`.
    public let state: StepIndicatorState
    /// Indicate whether step is pressed in `StepProgressIndicator`.
    public let isPressed: Bool
    /// Indicate whether step is selected in `StepProgressIndicator`.
    public let isSelected: Bool
}

/// Step title configuration used for `StepStyle`.
public struct StepTitleConfiguration {
    /// :nodoc:
    public struct Title: View {
        public var body: AnyView
    }
    
    /// :nodoc:
    public let title: StepTitleConfiguration.Title
    
    /// State for step in `StepProgressIndicator`.
    public let state: StepIndicatorState
    /// Indicate whether step is pressed in `StepProgressIndicator`.
    public let isPressed: Bool
    /// Indicate whether step is selected in `StepProgressIndicator`.
    public let isSelected: Bool
}

/// Step line configuration used for `StepStyle`.
public struct StepLineConfiguration {
    /// :nodoc
    public struct Line: View {
        public var body: AnyView
    }

    /// :nodoc
    public let line: StepLineConfiguration.Line
    
    /// State for step in `StepProgressIndicator`.
    public let state: StepIndicatorState
    /// Indicate whether step is pressed in `StepProgressIndicator`.
    public let isPressed: Bool
    /// Indicate whether step is selected in `StepProgressIndicator`.
    public let isSelected: Bool
    /// Indicate whether step is the last one in `StepProgressIndicator`.
    public let isLastStep: Bool
}

struct DefaultStepsStyle: StepsStyle {
    func makeNode(configuration: StepNodeConfiguration) -> some View {
        let isPressed = configuration.isPressed
        let isSelected = configuration.isSelected
        let state = configuration.state
        configuration.node
            .background(self.nodeBackground(state, isSelected, isPressed).clipShape(Circle()))
            .foregroundColor(self.nodeForeground(state, isSelected, isPressed))
    }
    
    func makeTitle(configuration: StepTitleConfiguration) -> some View {
        let isPressed = configuration.isPressed
        let isSelected = configuration.isSelected
        let state = configuration.state
        configuration.title
            .foregroundColor(self.nameColor(state, isSelected, isPressed))
            .font(self.nameFont(state, isSelected))
    }
    
    func makeLine(configuration: StepLineConfiguration) -> some View {
        let isPressed = configuration.isPressed
        let isSelected = configuration.isSelected
        let state = configuration.state
        let showLine = !configuration.isLastStep
        configuration.line
            .foregroundColor(self.lineColor(state, isSelected, isPressed, showLine))
    }
    
    func nodeBackground(_ state: StepIndicatorState,
                        _ isSelected: Bool,
                        _ isPressed: Bool) -> Color
    {
        switch state.convert(isSelected) {
        case .inactive:
            return Color.preferredColor(.primaryBackground)
        case .active:
            return Color.preferredColor(.primaryBackground)
        case .completed:
            return Color.preferredColor(isPressed ? .tintColorTapState : .tintColor)
        case .disabled:
            return Color.preferredColor(.quaternaryFill)
        case .error:
            return Color.preferredColor(.primaryBackground)
        case .errorActive:
            return Color.preferredColor(.negativeBackground)
        case .none:
            return Color.clear
        }
    }
    
    func nodeForeground(_ state: StepIndicatorState,
                        _ isSelected: Bool,
                        _ isPressed: Bool) -> Color
    {
        switch state.convert(isSelected) {
        case .inactive, .disabled:
            return Color.preferredColor(.tertiaryLabel)
        case .active:
            return Color.preferredColor(isPressed ? .tintColorTapState : .tintColor)
        case .completed:
            return Color.preferredColor(.primaryFill)
        case .error, .errorActive:
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        case .none:
            return Color.clear
        }
    }
    
    func nameColor(_ state: StepIndicatorState,
                   _ isSelected: Bool,
                   _ isPressed: Bool) -> Color
    {
        switch state.convert(isSelected) {
        case .inactive, .active, .completed:
            return Color.preferredColor(.primaryLabel)
        case .disabled:
            return Color.preferredColor(.tertiaryLabel)
        case .error, .errorActive:
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        case .none:
            return Color.clear
        }
    }
    
    func nameFont(_ state: StepIndicatorState, _ isSelected: Bool) -> Font {
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
    
    func lineColor(_ state: StepIndicatorState,
                   _ isSelected: Bool,
                   _ isPressed: Bool,
                   _ showLine: Bool) -> Color
    {
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
            return Color.clear
        }
    }
}
