import SwiftUI

struct StepsStack: View {
    var steps: [StepItem]
    var selection: Binding<String>? = nil
    /// :nodoc:
    init(_ steps: [StepItem], selection: Binding<String>? = nil) {
        self.steps = steps
        self.selection = selection
    }
    
    var body: some View {
        ForEach(0 ..< self.count, id: \.self) { index in
            self.view(at: index)
        }
    }
}

extension StepsStack: IndexedViewContainer {
    /// :nodoc:
    public var count: Int {
        self.steps.count
    }
    
    /// :nodoc:
    @ViewBuilder public func view(at index: Int) -> some View {
        if index < self.count {
            _DefaultSteps(stepItems: self.steps, selection: self.selection ?? .constant("")).view(at: index)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func titleView(for title: String?) -> some View {
        if let title {
            Text(title)
        } else {
            EmptyView()
        }
    }
}
