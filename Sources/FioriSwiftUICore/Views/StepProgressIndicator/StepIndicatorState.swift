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
    
    var isSupported: Bool {
        switch self {
        case .normal, .completed, .error, .disabled:
            return true
        default:
            return false
        }
    }
}
