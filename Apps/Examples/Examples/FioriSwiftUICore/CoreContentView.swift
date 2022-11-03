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
                    Text("Signature Inline View")
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
                    destination: ListPickerItemExample()) {
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
                    destination: KPIProgressExample()) {
                    Text("KPIProgressItem")
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
                
                NavigationLink(destination: ContactItemExample()) {
                    Text("ContactItem")
                }
            }
        }.navigationBarTitle("FioriSwiftUICore")
    }
}

struct CoreContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.horizontalSizeClass, .compact)
    }
}
