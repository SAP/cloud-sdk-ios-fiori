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
    var stepId: String
    var state: InternalStepState
    var isSelected: Bool
    var showLine: Bool
    
    @Environment(\.stepStyle) var stepStyle
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let isPressed = configuration.isPressed
        configuration.label
            .nodeModifier {
                $0.background(nodeBackground(isPressed: isPressed)
                    .clipShape(Circle()))
                    .foregroundColor(nodeForeground(isPressed: isPressed))
            }
            .titleModifier {
                $0.foregroundColor(nameColor(isPressed: isPressed))
                    .font(nameFont(isPressed: isPressed))
            }
            .stepLineColor(self.lineColor(isPressed))
    }
    
    var useSemibold: Bool {
        switch self.state {
        case .active, .errorActive:
            return true
        case .completed, .inactive, .disabled, .error:
            return false
        }
    }
    
    func lineColor(_ isPressed: Bool) -> Color {
        if self.showLine {
            if let lineColor = stepStyle.lineColor?(stepId, state.convert(), isPressed) {
                return lineColor
            } else {
                return self.line(isPressed: isPressed)
            }
        } else {
            return Color.clear
        }
    }
    
    func nameFont(isPressed: Bool) -> Font {
        if let titleFont = stepStyle.titleFont?(stepId, state.convert(), isPressed) {
            return titleFont
        } else {
            return Font.fiori(forTextStyle: .footnote)
                .weight(self.useSemibold ? .semibold : .regular)
        }
    }
    
    func nameColor(isPressed: Bool) -> Color {
        if let titleForeground = stepStyle.titleForeground?(stepId, state.convert(), isPressed) {
            return titleForeground
        }
        switch self.state {
        case .inactive, .active, .completed:
            return Color.preferredColor(.primaryLabel)
        case .disabled:
            return Color.preferredColor(.tertiaryLabel)
        case .error, .errorActive:
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        }
    }
    
    func nodeBackground(isPressed: Bool) -> Color {
        if let nodeBackground = stepStyle.nodeBackground?(stepId, state.convert(), isPressed) {
            return nodeBackground
        }
        switch self.state {
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
        }
    }
    
    func nodeForeground(isPressed: Bool) -> Color {
        if let nodeForeground = stepStyle.nodeForeground?(stepId, state.convert(), isPressed) {
            return nodeForeground
        }
        switch self.state {
        case .inactive, .disabled:
            return Color.preferredColor(.tertiaryLabel)
        case .active:
            return Color.preferredColor(isPressed ? .tintColorTapState : .tintColor)
        case .completed:
            return Color.preferredColor(.primaryFill)
        case .error, .errorActive:
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        }
    }
    
    func line(isPressed: Bool) -> Color {
        switch self.state {
        case .inactive, .active:
            return Color.preferredColor(.separator)
        case .completed:
            return Color.preferredColor(isPressed ? .tintColorTapState : .tintColor)
        case .disabled:
            return Color.preferredColor(.tertiaryLabel)
        case .error, .errorActive:
            return Color.preferredColor(isPressed ? .negativeLabelTapState : .negativeLabel)
        }
    }
}

/// Step style configuration for `StepProgressIndicator`
public class StepStyleModel: ObservableObject {
    /// Node background color for different state
    public var nodeBackground: ((_ id: String, _ state: StepIndicatorState, _ isPressed: Bool) -> Color?)?
    /// Node foreground color for different state
    public var nodeForeground: ((_ id: String, _ state: StepIndicatorState, _ isPressed: Bool) -> Color?)?
    /// Title foreground color for different state
    public var titleForeground: ((_ id: String, _ state: StepIndicatorState, _ isPressed: Bool) -> Color?)?
    /// Title font for different state
    public var titleFont: ((_ id: String, _ state: StepIndicatorState, _ isPressed: Bool) -> Font?)?
    
    /// Line color for different state
    public var lineColor: ((_ id: String, _ state: StepIndicatorState, _ isPressed: Bool) -> Color?)?
    
    /// : nodoc:
    public init() {}
}
