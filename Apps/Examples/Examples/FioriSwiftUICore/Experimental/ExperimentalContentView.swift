import SwiftUI

struct ExperimentalContentView: View {
    private var experiments: [Experiment] = [
        .init(view: ContactItemInitViewBuilderExample().asAnyView, label: "ContactItem - InitViewBuilder"),
        .init(view: ContactItemInitModelExample().asAnyView, label: "ContactItem - InitModel"),
        .init(view: ContactItemActionItemsExample().asAnyView, label: "ContactItem - Action Items"),
        .init(view: ContactItemStateAndDataBindingExample(model: EmailContactViewModel.marco).asAnyView, label: "ContactItem - State and Data Binding Handling"),
        .init(view: ThemingExample().asAnyView, label: "Theming (StyleCache)"),
        .init(view: StylingModifierExample().asAnyView, label: "Styling (Modifier)"),
        .init(view: StylingTextStyleExample().asAnyView, label: "Styling (TextStyle)"),
        .init(view: KPIHeaderFreestyleExample().asAnyView, label: "KPI Header / Layout")
    ]
    var body: some View {
        List(experiments, id: \.id) { e in
            NavigationLink(
                destination: e.view,
                label: {
                    Text("\(e.label)")
                }
            )
        }.navigationBarTitle("Experimental")
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
