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
    /// Step node.
    var node: TextOrIcon? { get }
}

/// Node of Step Progress Indicator display type, default is `text`.
public enum StepProgressIndicatorNodeType {
    /// Only text.
    case text
    /// Only icon.
    case icon
}
