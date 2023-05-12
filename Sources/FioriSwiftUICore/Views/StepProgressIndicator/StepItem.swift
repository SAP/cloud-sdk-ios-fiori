import Foundation

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
