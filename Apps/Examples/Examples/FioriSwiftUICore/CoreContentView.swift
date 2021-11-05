import FioriCharts
import FioriSwiftUI
import FioriSwiftUICore
import SwiftUI

struct CoreContentView: View {
    var body: some View {
        List {
            NavigationLink(
                destination: DataTableExample()) {
                Text("Data Table")
            }
            
            NavigationLink(
                destination: SideBarExample(),
                label: {
                    Text("Side Bar Example")
                }
            )
            
            NavigationLink(
                destination: DimensionSelector_Chart()) {
                Text("Dimension Selector")
            }
            
            Group {
                NavigationLink(
                    destination: SignatureCaptureViewExample()) {
                    Text("Signature View")
                }
                
                NavigationLink(
                    destination: SignatureCaptureViewExample2()) {
                    Text("Customized Signature Inline View")
                }
            }
            
            NavigationLink(
                destination: ExperimentalContentView()) {
                Text("🚧 Experimental 🚧")
            }

            Group {
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
                
                NavigationLink(
                    destination: ObjectHeaderExample(),
                    label: {
                        Text("ObjectHeader")
                    }
                )
            }
        }.navigationBarTitle("FioriSwiftUICore")
    }
}

struct CoreContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.horizontalSizeClass, .compact)
    }
}
