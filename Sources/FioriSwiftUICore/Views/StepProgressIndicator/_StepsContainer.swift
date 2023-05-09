import FioriThemeManager
import SwiftUI

/// Not used by developers.
public struct _StepsContainer {
    var steps: [SingleStepModel]
    /// :nodoc:
    public init(steps: [SingleStepModel]) {
        self.steps = steps
    }

    /// :nodoc:
    public init(substeps: [SingleStepModel]) {
        self.steps = substeps
    }
}

extension _StepsContainer: IndexedViewContainer {
    /// :nodoc:
    public var count: Int {
        self.steps.count
    }
    
    /// :nodoc:
    @ViewBuilder public func view(at index: Int) -> some View {
        if index < self.count {
            let id: String = self.steps[index].id
            let title = self.steps[index].title
            let node = self.steps[index].node
            let substeps = self.steps[index].substeps
            SingleStep(id: id,
                       title: title,
                       node: node,
                       substeps: substeps)
        } else {
            EmptyView()
        }
    }
}
