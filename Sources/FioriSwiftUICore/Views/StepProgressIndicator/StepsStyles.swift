import FioriThemeManager
import SwiftUI

public struct StepIndicatorState: OptionSet {
    public let rawValue: UInt
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }

    public static let completed = StepIndicatorState(rawValue: 1 << 0)
    public static let disabled = StepIndicatorState(rawValue: 1 << 1)
    public static let error = StepIndicatorState(rawValue: 1 << 2)
    
    func convert(_ isSelected: Bool) -> InternalStepState? {
        switch (isSelected, self) {
        case (true, []):
            return .active
        case (_, .completed):
            return .completed
        case (_, .disabled):
            return .disabled
        case (true, .error):
            return .errorActive
        case (false, []):
            return .inactive
        case (false, .error):
            return .error
        case (_, _):
            return nil
        }
    }
}

enum InternalStepState {
    case inactive, active, completed, disabled, error, errorActive
}

public struct StepItem: Identifiable {
    public var id = UUID()
    public var title: String?
    public var state: StepIndicatorState
    public var children: [StepItem]?
    
    public init(id: UUID = UUID(),
                title: String? = nil,
                state: StepIndicatorState = [],
                children: [StepItem]? = nil)
    {
        self.id = id
        self.title = title
        self.state = state
        self.children = children
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
    var state: InternalStepState
    var showLine: Bool
    
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
                    .font(Font.fiori(forTextStyle: .footnote)
                        .weight(useSemibold ? .semibold : .regular))
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
            return self.line(isPressed: isPressed)
        } else {
            return Color.clear
        }
    }
    
    func nameColor(isPressed: Bool) -> Color {
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
