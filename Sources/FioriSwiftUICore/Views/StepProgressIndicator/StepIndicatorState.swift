import Foundation

/// An option set for step state that used for default `StepProgressIndicator`
public struct StepIndicatorState: OptionSet {
    /// :nodoc:
    public let rawValue: UInt
    /// :nodoc:
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    /// Completed state for a step.
    public static let completed = StepIndicatorState(rawValue: 1 << 0)
    /// disabled state for a step.
    public static let disabled = StepIndicatorState(rawValue: 1 << 1)
    /// error state for a step.
    public static let error = StepIndicatorState(rawValue: 1 << 2)
    /// error state for a step.
    public static let normal: StepIndicatorState = []
    
    func convert(_ isSelected: Bool) -> InternalStepState? {
        switch (isSelected, self) {
        case (true, .normal):
            return .active
        case (_, .completed):
            return .completed
        case (_, .disabled):
            return .disabled
        case (true, .error):
            return .errorActive
        case (false, .normal):
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
    
    func convert() -> StepIndicatorState {
        switch self {
        case .inactive, .active:
            return .normal
        case .completed:
            return .completed
        case .disabled:
            return .disabled
        case .error, .errorActive:
            return .error
        }
    }
}
