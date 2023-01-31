import SwiftUI

struct ExperimentalContentView: View {
    private var experiments: [Experiment] = [
        .init(view: ContactItemInitViewBuilderExample().asAnyView, label: "@ViewBuilder-based initializer (ContactItem)"),
        .init(view: ContactItemInitModelExample().asAnyView, label: "ViewModel-based initializer (ContactItem)"),
        .init(view: ContactItemStateAndDataBindingExample(model: EmailContactViewModel.mike).asAnyView, label: "Example: State and Data Binding (ContactItem)"),
        .init(view: ContactItemActionItemsExample().asAnyView, label: "🧪 View - Action Items"),
        .init(view: StylingModifierExample().asAnyView, label: "🔬 Styling (Modifier)")
    ]
    var body: some View {
        List(experiments, id: \.id) { e in
            NavigationLink(
                destination: e.view,
                label: {
                    Text("\(e.label)")
                }
            )
        }.navigationBarTitle("🚧 Experimental 🚧")
    }
}

struct ExperimentalContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentalContentView()
    }
}

private struct Experiment {
    var id = UUID()
    var view: AnyView
    var label: String
}

extension View {
    var asAnyView: AnyView {
        AnyView(self)
    }
}
