import FioriThemeManager
import SwiftUI

/// Not used by developers.
public struct _StepsContainer {
    var steps: [_SingleStepModel]
    /// :nodoc:
    public init(steps: [_SingleStepModel]) {
        self.steps = steps
    }

    /// :nodoc:
    public init(substeps: [_SingleStepModel]) {
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
            _SingleStep(id: id,
                        title: title,
                        node: node,
                        substeps: substeps)
        } else {
            EmptyView()
        }
    }
}

/// Not for developers.
public struct _StepItemsContainer {
    var steps: [StepItem]
    /// :nodoc:
    public init(_ steps: [StepItem]) {
        self.steps = steps
    }
}

extension _StepItemsContainer: IndexedViewContainer {
    /// :nodoc:
    public var count: Int {
        self.steps.count
    }
    
    /// :nodoc:
    @ViewBuilder public func view(at index: Int) -> some View {
        if index < self.count {
            _SingleStep(item: self.steps[index])
        } else {
            EmptyView()
        }
    }
}

extension _StepItemsContainer: View {
    /// :nodoc:
    public var body: some View {
        ForEach(0 ..< self.count, id: \.self) { index in
            self.view(at: index)
        }
    }
}
