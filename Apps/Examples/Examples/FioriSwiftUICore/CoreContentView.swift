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
                destination: FioriButtonContentView(),
                label: {
                    Text("FioriButton")
                }
            )
            
            NavigationLink(
                destination: KPIExample()) {
                Text("KPI")
            }
            
            NavigationLink(
                destination: OnboardingExamples()) {
                Text("Onboarding")
            }
            
            NavigationLink(
                destination: ObjectItemExample(),
                label: {
                    Text("ObjectItem")
                }
            )
        }.navigationBarTitle("FioriSwiftUICore")
    }
}

struct CoreContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.horizontalSizeClass, .compact)
    }
}
