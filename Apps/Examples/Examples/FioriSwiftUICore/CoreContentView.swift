import FioriCharts
import FioriSwiftUI
import FioriSwiftUICore
import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let title: String
    let section: String
    let destination: AnyView
    
    init(title: String, section: String, destination: some View) {
        self.title = title
        self.section = section
        self.destination = AnyView(destination)
    }
}

struct CoreContentView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    @StateObject private var scannerManager = BarcodeScannerManager.shared
    
    private var allMenuItems: [MenuItem] {
        [
            // Views
            MenuItem(title: "Attachments", section: "Views", destination: AttachmentExamples()),
            MenuItem(title: "AvatarStack", section: "Views", destination: AvatarStackExample()),
            MenuItem(title: "FioriButton", section: "Views", destination: FioriButtonContentView()),
            MenuItem(title: "Cards and Layouts", section: "Views", destination: MobileCardExample()),
            MenuItem(title: "ContactItem", section: "Views", destination: ContactItemExample(isNewObjectItem: true)),
            MenuItem(title: "_ContactItem: deprecated", section: "Views", destination: ContactItemExample()),
            MenuItem(title: "_EmptyStateViewExample", section: "Views", destination: _EmptyStateViewExample()),
            MenuItem(title: "FormView", section: "Views", destination: FormViewExamples()),
            MenuItem(title: "IllustratedMessage", section: "Views", destination: IllustratedMessageExample()),
            MenuItem(title: "InformationViewExample", section: "Views", destination: InformationViewExample()),
            MenuItem(title: "ObjectItem", section: "Views", destination: ObjectItemExample(_isNewObjectItem: true)),
            MenuItem(title: "_ObjectItem: deprecated", section: "Views", destination: ObjectItemExample()),
            MenuItem(title: "Other View Examples", section: "Views", destination: OtherViewExamples()),
            MenuItem(title: "Signature Inline View", section: "Views", destination: SignatureCaptureViewExample()),
            MenuItem(title: "(Deprecated)Customized Signature Inline View", section: "Views", destination: SignatureCaptureViewExample2()),
            MenuItem(title: "AI User Feedback", section: "Views", destination: AIUserFeedbackExample()),
            
            // Scanners
            MenuItem(title: "Document Scanner View", section: "Scanners", destination: DocumentScannerViewExample()),
            MenuItem(title: "Start New Connection", section: "Scanners", destination: StartNewConnectionExample(scannerManager: self.scannerManager)),
            MenuItem(title: "ProGlove Scanner", section: "Scanners", destination: ProGloveScannerExample(scannerManager: self.scannerManager)),
            MenuItem(title: "IPCMobile Scanner", section: "Scanners", destination: IPCMobileScannerExample(scannerManager: self.scannerManager)),
            MenuItem(title: "VisionKit Scanner", section: "Scanners", destination: VisionKitScannerExample(scannerManager: self.scannerManager)),
            
            // Timeline
            MenuItem(title: "Timeline", section: "Timeline", destination: TimelineExample()),
            
            // Headers
            MenuItem(title: "Profile Header", section: "Headers", destination: ProfileHeaderExample()),
            MenuItem(title: "_KPIHeader", section: "Headers", destination: _KPIHeaderExample()),
            MenuItem(title: "KPIHeader", section: "Headers", destination: KPIHeaderExample()),
            MenuItem(title: "ObjectHeader", section: "Headers", destination: ObjectHeaderExample()),
            MenuItem(title: "SectionHeader/Footer Example", section: "Headers", destination: SectionHeaderFooterExample()),
            
            // Controls
            MenuItem(title: "Customized TabView", section: "Controls", destination: TabViewExample()),
            MenuItem(title: "Customized Toolbar", section: "Controls", destination: ToolbarExample()),
            MenuItem(title: "Dimension Selector", section: "Controls", destination: DimensionSelectorExample()),
            MenuItem(title: "_Dimension Selector", section: "Controls", destination: DimensionSelector_Chart()),
            MenuItem(title: "Menu Selection", section: "Controls", destination: MenuSelectionExample()),
            MenuItem(title: "RatingControl", section: "Controls", destination: RatingControlExample()),
            MenuItem(title: "Side Bar Example", section: "Controls", destination: SideBarExample()),
            MenuItem(title: "SortFilterExample", section: "Controls", destination: SortFilterExample()),
            MenuItem(title: "Stepper", section: "Controls", destination: StepperViewExample()),
            MenuItem(title: "Switch", section: "Controls", destination: SwitchExample()),
            MenuItem(title: "Step Progress Indicator", section: "Controls", destination: StepProgressIndicatorExample()),
            MenuItem(title: "Slider", section: "Controls", destination: SliderExample()),
            
            // Pickers
            MenuItem(title: "_ListPickerItem", section: "Pickers", destination: _ListPickerItemExample()),
            MenuItem(title: "ListPickerItem", section: "Pickers", destination: ListPickerItemExample()),
            MenuItem(title: "_DurationPicker", section: "Pickers", destination: _DurationPickerExample()),
            MenuItem(title: "DurationPicker", section: "Pickers", destination: DurationPickerExample()),
            MenuItem(title: "SegmentedControlPicker", section: "Pickers", destination: SegmentedControlExample()),
            MenuItem(title: "DateTimePicker", section: "Pickers", destination: DateTimePickerExample()),
            MenuItem(title: "ValuePicker", section: "Pickers", destination: ValuePickerExample()),
            MenuItem(title: "OrderPicker", section: "Pickers", destination: OrderPickerExample()),
            
            // Onboarding
            MenuItem(title: "Onboarding", section: "Onboarding", destination: OnboardingExamples(_isNewObjectItem: true)),
            MenuItem(title: "_Onboarding: deprecated", section: "Onboarding", destination: OnboardingExamples()),
            
            // Banner Message
            MenuItem(title: "Banner Message", section: "Banner Message", destination: BannerMessageExample()),
            
            // Feedback Indicators
            MenuItem(title: "Toast Message", section: "Feedback Indicators", destination: ToastMessageExample()),
            MenuItem(title: "Linear Progress Indicator", section: "Feedback Indicators", destination: LinearProgressIndicatorExample()),
            MenuItem(title: "Loading Indicator", section: "Feedback Indicators", destination: LoadingIndicatorExample()),
            MenuItem(title: "Checkout Indicator", section: "Feedback Indicators", destination: CheckoutIndicatorExample()),
            MenuItem(title: "Checkout Indicator Modal", section: "Feedback Indicators", destination: CheckoutIndicatorModalExample()),
            MenuItem(title: "Progress Indicator", section: "Feedback Indicators", destination: ProgressIndicatorExample()),
            MenuItem(title: "Processing Indicator", section: "Feedback Indicators", destination: ProcessingIndicatorExample()),
            
            // Navigation Bar
            MenuItem(title: "Customized NavigationBar", section: "Navigation Bar", destination: NavigationBarExample()),
            
            // KPI
            MenuItem(title: "KPI", section: "KPI", destination: KPIExample()),
            MenuItem(title: "KPIItem", section: "KPI", destination: KPIItemExample()),
            MenuItem(title: "_KPIProgressItem", section: "KPI", destination: _KPIProgressExample()),
            MenuItem(title: "KPIProgressItem", section: "KPI", destination: KPIProgressExample()),
            
            // Search
            MenuItem(title: "Search Demos", section: "Search", destination: SearchDemos()),
            
            // Data Table
            MenuItem(title: "Data Table", section: "Data Table", destination: DataTableExample()),
            
            // Utilities
            MenuItem(title: "Shadow Effect", section: "Utilities", destination: ShadowEffectExample()),
            
            // Skeleton Loading
            MenuItem(title: "Basic Component Skeleton Loading", section: "Skeleton Loading", destination: BasicComponentSkeletonLoading()),
            MenuItem(title: "Object Header Skeleton Loading", section: "Skeleton Loading", destination: ObjectHeaderSkeletonLoading()),
            MenuItem(title: "Object Cell Skeleton Loading", section: "Skeleton Loading", destination: ObjectCellSkeletonLoading()),
            MenuItem(title: "Card Skeleton Loading", section: "Skeleton Loading", destination: CardSkeletonLoading()),
            MenuItem(title: "Profile Header Skeleton Loading", section: "Skeleton Loading", destination: ProfileHeaderSkeletonLoading()),
            
            // Experimental
            MenuItem(title: "🚧 Experimental 🚧", section: "ExperimentalContentView", destination: ExperimentalContentView())
        ]
    }
    
    private var filteredItems: [MenuItem] {
        if self.searchText.isEmpty {
            return self.allMenuItems
        } else {
            return self.allMenuItems.filter { item in
                item.title.lowercased().contains(self.searchText.lowercased()) ||
                    item.section.lowercased().contains(self.searchText.lowercased())
            }
        }
    }
    
    private var groupedItems: [String: [MenuItem]] {
        Dictionary(grouping: self.filteredItems) { $0.section }
    }
    
    var body: some View {
        VStack {
            // Search bar
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search Test Case...", text: self.$searchText)
                        .foregroundColor(.primary)
                    
                    if !self.searchText.isEmpty {
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .onTapGesture {
                    self.isSearching = true
                }
                
                if self.isSearching {
                    Button("Cancel") {
                        self.searchText = ""
                        self.isSearching = false
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                    .padding(.trailing)
                    .transition(.move(edge: .trailing))
                    .animation(.default, value: self.isSearching)
                }
            }
            
            // List content
            List {
                ForEach(self.groupedItems.keys.sorted(), id: \.self) { section in
                    if let items = groupedItems[section] {
                        Section(header: Text(section)) {
                            ForEach(items) { item in
                                NavigationLink(destination: item.destination) {
                                    Text(item.title)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("FioriSwiftUICore")
        }
    }
}

struct CoreContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.horizontalSizeClass, .compact)
    }
}
