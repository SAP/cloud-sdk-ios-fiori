import FioriCharts
import FioriSwiftUI
import FioriSwiftUICore
import SwiftUI

struct CoreContentView: View {
    var body: some View {
        List {
            ForEach(CoreItem.allCases) {
                $0.content
            }
        }.navigationBarTitle("FioriSwiftUICore")
    }
}

struct CoreContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.horizontalSizeClass, .compact)
    }
}

enum CoreItem: String, CaseIterable, Identifiable {
    case dataTable = "Data Table"
    case sideBar = "Side Bar Example"
    case dimensionSelector_Chart = "Dimension Selector"
    case signatureCapture = "Signature Inline View"
    case signatureCapture2 = "Customized Signature Inline View"
    case experimental = "🚧 Experimental 🚧"
    case listPickerItem = "ListPickerItem"
    case durationPicker = "DurationPicker"
    case fioriButton = "FioriButton"
    case kPI = "KPI"
    case kPIProgress = "KPIProgressItem"
    case kPIHeader = "KPIHeader"
    case onboarding = "Onboarding"
    case objectItem = "ObjectItem"
    case objectHeader = "ObjectHeader"
    case contactItem = "ContactItem"
    case emptyState = "EmptyStateViewExample"
    case stepperIndicator = "Stepper Indicator"
    
    var id: String { self.rawValue }
    
    @ViewBuilder var content: some View {
        switch self {
        case .dataTable:
            NavigationLink {
                DataTableExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .sideBar:
            NavigationLink {
                SideBarExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .dimensionSelector_Chart:
            NavigationLink {
                DimensionSelector_Chart()
            } label: {
                Text("\(self.rawValue)")
            }
        case .signatureCapture:
            NavigationLink {
                SignatureCaptureViewExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .signatureCapture2:
            NavigationLink {
                SignatureCaptureViewExample2()
            } label: {
                Text("\(self.rawValue)")
            }
        case .experimental:
            NavigationLink {
                ExperimentalContentView()
            } label: {
                Text("\(self.rawValue)")
            }
        case .listPickerItem:
            NavigationLink {
                ListPickerItemExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .durationPicker:
            NavigationLink {
                DurationPickerExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .fioriButton:
            NavigationLink {
                FioriButtonContentView()
            } label: {
                Text("\(self.rawValue)")
            }
        case .kPI:
            NavigationLink {
                KPIExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .kPIProgress:
            NavigationLink {
                KPIProgressExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .kPIHeader:
            NavigationLink {
                KPIHeaderExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .onboarding:
            NavigationLink {
                OnboardingExamples()
            } label: {
                Text("\(self.rawValue)")
            }
        case .objectItem:
            NavigationLink {
                ObjectItemExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .objectHeader:
            NavigationLink {
                ObjectHeaderExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .contactItem:
            NavigationLink {
                ContactItemExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .emptyState:
            NavigationLink {
                EmptyStateViewExample()
            } label: {
                Text("\(self.rawValue)")
            }
        case .stepperIndicator:
            NavigationLink {
                StepperIndicatorExample()
            } label: {
                Text("\(self.rawValue)")
            }
        }
    }
}
