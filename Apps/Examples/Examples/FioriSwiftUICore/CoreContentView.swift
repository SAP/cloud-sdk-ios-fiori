import FioriCharts
import FioriSwiftUI
import FioriSwiftUICore
import SwiftUI

struct CoreContentView: View {
    var body: some View {
        List {
            NavigationLink(
                destination: SegmentedControl_Chart()) {
                Text("Segmented Control")
            }
            
            NavigationLink(
                destination: ExperimentalContentView()) {
                Text("🚧 Experimental 🚧")
            }

            NavigationLink(
                destination: ListPickerItemDataNonIdentifiableExample()) {
                Text("ListPickerItem")
            }
            
            NavigationLink(
                destination: FioriButtonStyleExample(),
                label: {
                    Text("FioriButtonStyle")
                }
            )
            
            NavigationLink(
                destination: KPIExample()) {
                Text("KPI")
            }
            
            NavigationLink(
                destination: WelcomeScreenSample()) {
                Text("WelcomeScreen")
            }
            
        }.navigationBarTitle("FioriSwiftUICore")
    }
}

struct CoreContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.horizontalSizeClass, .compact)
    }
}
