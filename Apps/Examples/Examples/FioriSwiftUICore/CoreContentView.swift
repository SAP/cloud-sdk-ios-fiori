import FioriCharts
import FioriSwiftUI
import FioriSwiftUICore
import SwiftUI

struct FioriExampleItem: Identifiable {
    let id = UUID()
    let name: String
    let destination: AnyView
}

struct FioriExampleSection: Identifiable {
    let id = UUID()
    let name: String
    let examples: [FioriExampleItem]
}

struct CoreContentView: View {
    var sections: [FioriExampleSection]
    
    init() {
        let controls = [FioriExampleItem(name: "ListPickerItem", destination: ListPickerItemExample().typeErased),
                        FioriExampleItem(name: "FioriButton", destination: FioriButtonContentView().typeErased),
                        FioriExampleItem(name: "DurationPicker", destination: DurationPickerExample().typeErased)]
        let views = [FioriExampleItem(name: "Data Table", destination: DataTableExample().typeErased),
                     FioriExampleItem(name: "Dimension Selector", destination: DimensionSelector_Chart().typeErased),
                     FioriExampleItem(name: "KPI", destination: KPIExample().typeErased),
                     FioriExampleItem(name: "KPIProgressItem", destination: KPIProgressExample().typeErased),
                     FioriExampleItem(name: "KPIHeader", destination: KPIHeaderExample().typeErased),
                     FioriExampleItem(name: "ObjectItem", destination: ObjectItemExample().typeErased),
                     FioriExampleItem(name: "ObjectHeader", destination: ObjectHeaderExample().typeErased),
                     FioriExampleItem(name: "ContactItem", destination: ContactItemExample().typeErased),
                     FioriExampleItem(name: "Step Progress Indicator", destination: StepProgressIndicatorExample().typeErased)]
        let patterns = [FioriExampleItem(name: "Onboarding", destination: OnboardingExamples().typeErased),
                        FioriExampleItem(name: "Signature Inline View", destination: SignatureCaptureViewExample().typeErased),
                        FioriExampleItem(name: "Customized Signature Inline View", destination: SignatureCaptureViewExample2().typeErased)]
        let floorplans = [FioriExampleItem(name: "Side Bar Example", destination: SideBarExample().typeErased),
                          FioriExampleItem(name: "EmptyStateViewExample", destination: EmptyStateViewExample().typeErased)]
        let experiment = [FioriExampleItem(name: "🚧 Experimental 🚧", destination: ExperimentalContentView().typeErased)]
        
        self.sections = [FioriExampleSection(name: "Controls", examples: controls),
                         FioriExampleSection(name: "Views", examples: views),
                         FioriExampleSection(name: "Patterns", examples: patterns),
                         FioriExampleSection(name: "Floorplans", examples: floorplans),
                         FioriExampleSection(name: "Experimental", examples: experiment)]
    }
    
    var body: some View {
        List {
            ForEach(sections) { s in
                Section(s.name) {
                    ForEach(s.examples) { e in
                        NavigationLink {
                            e.destination
                        } label: {
                            Text(e.name)
                        }
                    }
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
