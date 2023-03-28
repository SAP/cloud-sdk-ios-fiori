import FioriThemeManager
import SwiftUI

public struct _StepsContainer {
    var steps: [SingleStepModel]
    
    public init(steps: [SingleStepModel]) {
        self.steps = steps
    }
}

extension _StepsContainer: IndexedViewContainer {
    public var count: Int {
        self.steps.count
    }
    
    @ViewBuilder
    public func view(at index: Int) -> some View {
        if index < self.count {
            let title = self.steps[index].title
            let node = self.steps[index].node
            SingleStep {
                Text(title ?? "")
            } node: {
                TextOrIconView(node: node)
            }
        } else {
            EmptyView()
        }
    }
}
