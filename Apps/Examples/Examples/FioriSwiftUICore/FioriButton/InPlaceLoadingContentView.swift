import SwiftUI

struct InPlaceLoadingContentView: View {
    var body: some View {
        List {
            NavigationLink("Loading Button Single Status", destination: LazyView(LoadingButtonSingleStatusExample()))
            NavigationLink("Multi Loading Button Status Change", destination: LazyView(MultiLoadingButtonStatusChangeExample()))
            NavigationLink("Card - Full Width  Single Button", destination: LazyView(CardFullWidthSingleButtonExample()))
            NavigationLink("Card - With Two Buttons", destination: LazyView(CardFixedWidthButtonsExample()))
            NavigationLink("Card - Two Buttons Change To One", destination: LazyView(CardTwoButtonsChangeToOneExample()))
            NavigationLink("Card View - With Two Buttons", destination: LazyView(CardViewWithTwoButtonsExample()))
            NavigationLink("Flexible Button", destination: LazyView(InPlaceLoadingFlexibleButtonExample()))
        }
        .navigationTitle("In-Place Loading Button")
    }
}

#Preview {
    InPlaceLoadingContentView()
}
