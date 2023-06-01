import Foundation

/// An option set for step state that used for default `StepProgressIndicator`
public struct StepProgressIndicatorState: OptionSet {
    /// :nodoc:
    public let rawValue: UInt
    /// :nodoc:
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    /// Completed state for a step.
    public static let completed = StepProgressIndicatorState(rawValue: 1 << 0)
    /// disabled state for a step.
    public static let disabled = StepProgressIndicatorState(rawValue: 1 << 1)
    /// error state for a step.
    public static let error = StepProgressIndicatorState(rawValue: 1 << 2)
    /// error state for a step.
    public static let normal: StepProgressIndicatorState = []
    
    var isSupported: Bool {
        switch self {
        case .normal, .completed, .error, .disabled:
            return true
        default:
            return false
        }
    }
}
