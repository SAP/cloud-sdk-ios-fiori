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

extension StepItem {
    func totalCount() -> Int {
        1 + substeps.reduce(0) { $0 + $1.totalCount() }
    }
}
