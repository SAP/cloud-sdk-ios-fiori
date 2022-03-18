import FioriCharts
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
                    destination: CoreContentView()) {
                    Text("Core Elements")
                }
                NavigationLink(
                    destination: FioriThemeManagerContentView()) {
                    Text("Theme Manager")
                }
            }
            .navigationBarTitle("Examples")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
