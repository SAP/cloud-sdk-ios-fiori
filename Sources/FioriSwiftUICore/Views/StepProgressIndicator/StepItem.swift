import Foundation
import SwiftUI

/// Step items data model for `StepProgressIndicator` with a default style.
public protocol StepItem {
    /// Unique step ID.
    var id: String { get }
    /// Step title.
    var title: String? { get }
    /// Step state.
    var state: StepProgressIndicatorState { get set }
    /// Substeps for this one.
    var substeps: [StepItem] { get set }
    /// Node icon.
    var icon: Image? { get }
}

/// Node of Step Progress Indicator display type, default is `mixture`.
public enum StepProgressIndicatorNodeType {
    /// Text and icon.
    case mixture
    /// Only text.
    case text
    /// Only icon.
    case icon
}
