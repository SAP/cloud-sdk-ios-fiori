import FioriThemeManager
import SwiftUI

public struct StepsContainer {
    var steps: [SingleStepModel]
    
    public init(steps: [SingleStepModel]) {
        self.steps = steps
    }
}

extension StepsContainer: IndexedViewContainer {
    public var count: Int {
        self.steps.count
    }
    
    @ViewBuilder
    public func view(at index: Int) -> some View {
        if index < self.count {
            let name = self.steps[index].name
            let node = self.steps[index].node
            SingleStep {
                Text(name ?? "")
            } node: {
                Text(node ?? "")
            }
        } else {
            EmptyView()
        }
    }
}
