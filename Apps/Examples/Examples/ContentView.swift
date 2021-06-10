import FioriCharts
import SwiftUI

struct ContentView: View {
    private let oneMany = ["table", "list", "timeline"]
    private let manyMany = ["LowCode", "object", "analytical"]
    private let cards: [String] = ["LowCode", "timeline", "table", "list" , "object", "analytical"]

    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: ChartsContentView()) {
                    Text("Charts")
                }
                NavigationLink(
                    destination: IntegrationCardsContentView(cards: cards)) {
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
