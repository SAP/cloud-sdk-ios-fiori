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
                destination: SignatureView_Example()) {
                Text("Signature View")
            }
            NavigationLink(
                destination: SignatureCaptureView_Example()) {
                Text("Signature Inline View")
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
            
            NavigationLink(
                destination: ActivationScreenSample()) {
                Text("ActivationScreen")
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
