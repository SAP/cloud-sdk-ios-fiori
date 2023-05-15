import Foundation

/// Step items data model for `StepProgressIndicator` with a default style.
public protocol StepItem {
    /// Unique step ID.
    var id: String { get }
    /// Step title.
    var title: String? { get }
    /// Step state.
    var state: StepIndicatorState { get set }
    /// Substeps for this one.
    var substeps: [StepItem] { get set }
}
