import FioriCharts
import FioriSwiftUI
import FioriSwiftUICore
import SwiftUI

struct CoreContentView: View {
    var body: some View {
        List {
            Section(header: Text("Views")) {
                NavigationLink(
                    destination: AvatarStackExample(),
                    label: {
                        Text("AvatarStack")
                    }
                )
                
                NavigationLink(
                    destination: FioriButtonContentView(),
                    label: {
                        Text("FioriButton")
                    }
                )
                
                NavigationLink(destination: MobileCardExample()) {
                    Text("Cards and Layouts")
                }
                
                NavigationLink(destination: ContactItemExample()) {
                    Text("ContactItem")
                }
                
                NavigationLink(
                    destination: EmptyStateViewExample())
                {
                    Text("EmptyStateViewExample")
                }
                
                NavigationLink(
                    destination: FormViewExamples(),
                    label: {
                        Text("FormView")
                    }
                )
                
                NavigationLink(
                    destination: IllustratedMessageExample())
                {
                    Text("IllustratedMessage")
                }
               
                NavigationLink(
                    destination: InformationViewExample(),
                    label: {
                        Text("InformationViewExample")
                    }
                )
                
                NavigationLink(
                    destination: ObjectItemExample(_isNewObjectItem: true),
                    label: {
                        Text("ObjectItem")
                    }
                )
                
                NavigationLink(
                    destination: ObjectItemExample(),
                    label: {
                        Text("_ObjectItem: deprecated")
                    }
                )
                
                NavigationLink(
                    destination: OtherViewExamples())
                {
                    Text("Other View Examples")
                }
                
                NavigationLink(
                    destination: SignatureCaptureViewExample())
                {
                    Text("Signature Inline View")
                }
                
                NavigationLink(
                    destination: SignatureCaptureViewExample2())
                {
                    Text("Customized Signature Inline View")
                }
            }
            
            Section(header: Text("Timeline")) {
                NavigationLink(
                    destination: TimelineExample(),
                    label: {
                        Text("Timeline")
                    }
                )
            }
            
            Section(header: Text("Headers")) {
                NavigationLink(
                    destination: ProfileHeaderExample())
                {
                    Text("Profile Header")
                }
                
                NavigationLink(
                    destination: KPIHeaderExample())
                {
                    Text("KPIHeader")
                }
                
                NavigationLink(
                    destination: ObjectHeaderExample(),
                    label: {
                        Text("ObjectHeader")
                    }
                )
            }
            
            Section(header: Text("Controls")) {
                NavigationLink(
                    destination: TabViewExample())
                {
                    Text("Customized TabView")
                }
                
                NavigationLink(
                    destination: ToolbarExample())
                {
                    Text("Customized Toolbar")
                }
                
                NavigationLink(
                    destination: DimensionSelector_Chart())
                {
                    Text("Dimension Selector")
                }
                
                NavigationLink(
                    destination: LinearProgressIndicatorExample(),
                    label: {
                        Text("Linear Progress Indicator")
                    }
                )
                
                NavigationLink(
                    destination: MenuSelectionExample())
                {
                    Text("Menu Selection")
                }
                
                NavigationLink(
                    destination: RatingControlExample(),
                    label: {
                        Text("RatingControl")
                    }
                )
                
                NavigationLink(
                    destination: SideBarExample(),
                    label: {
                        Text("Side Bar Example")
                    }
                )
                
                NavigationLink(destination: SortFilterExample()) {
                    Text("SortFilterExample")
                }
                
                NavigationLink(
                    destination: StepperViewExample(),
                    label: {
                        Text("Stepper")
                    }
                )
                
                NavigationLink(
                    destination: SwitchExample(),
                    label: {
                        Text("Switch")
                    }
                )
                
                NavigationLink(
                    destination: StepProgressIndicatorExample())
                {
                    Text("Step Progress Indicator")
                }
            }
            
            Section(header: Text("Pickers")) {
                NavigationLink(
                    destination: _ListPickerItemExample())
                {
                    Text("_ListPickerItem")
                }
                
                NavigationLink(
                    destination: ListPickerItemExample())
                {
                    Text("ListPickerItem")
                }
                
                NavigationLink(
                    destination: DurationPickerExample())
                {
                    Text("DurationPicker")
                }
                
                NavigationLink(
                    destination: SegmentedControlExample())
                {
                    Text("SegmentedControlPicker")
                }
                
                NavigationLink(
                    destination: DateTimePickerExample())
                {
                    Text("DateTimePicker")
                }
            }
            
            Section(header: Text("Onboarding")) {
                NavigationLink(
                    destination: OnboardingExamples())
                {
                    Text("Onboarding")
                }
            }
            
            Section(header: Text("Banner Message")) {
                NavigationLink(
                    destination: BannerMessageExample())
                {
                    Text("Banner Message")
                }
            }
            
            Section(header: Text("Feedback Indicators")) {
                NavigationLink(
                    destination: ToastMessageExample())
                {
                    Text("Toast Message")
                }
            }
            
            Section(header: Text("Navigation Bar")) {
                NavigationLink(
                    destination: NavigationBarExample())
                {
                    Text("Customized NavigationBar")
                }
            }
            
            Section(header: Text("KPI")) {
                NavigationLink(
                    destination: KPIExample())
                {
                    Text("KPI")
                }
                
                NavigationLink(
                    destination: KPIProgressExample())
                {
                    Text("KPIProgressItem")
                }
            }
            
            Section(header: Text("Search")) {
                NavigationLink(destination: SearchDemos()) {
                    Text("Search Demos")
                }
            }
            
            Section(header: Text("Data Table")) {
                NavigationLink(
                    destination: DataTableExample())
                {
                    Text("Data Table")
                }
            }
            
            Section(header: Text("Utilities")) {
                NavigationLink(
                    destination: ShadowEffectExample())
                {
                    Text("Shadow Effect")
                }
            }
            
            Section(header: Text("ExperimentalContentView")) {
                NavigationLink(
                    destination: ExperimentalContentView())
                {
                    Text("🚧 Experimental 🚧")
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
