import FioriCharts
import FioriSwiftUI
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
        }.navigationBarTitle("FioriSwiftUICore")
    }
}

struct CoreContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.horizontalSizeClass, .compact)
    }
}
