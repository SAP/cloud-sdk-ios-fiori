import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: ChartsContentView()) {
                    Text("Charts")
                }
                NavigationLink(
                    destination: IntegrationCardsContentView()) {
                    Text("Integration Cards")
                }
                NavigationLink(
                    destination: CoreContentView()) {
                    Text("Core Elements")
                }
            }
            .navigationBarTitle("Examples")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
