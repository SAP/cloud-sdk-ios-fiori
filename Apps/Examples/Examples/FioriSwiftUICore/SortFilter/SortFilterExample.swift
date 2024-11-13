import FioriSwiftUICore
import SwiftUI

struct SortFilterExample: View {
    @State private var items: [[SortFilterItem]] = [
        [
            .switch(item: .init(name: "Favorite", value: true, icon: "heart.fill"), showsOnFilterFeedbackBar: true),
            .switch(item: .init(name: "Tagged", value: nil, icon: "tag"), showsOnFilterFeedbackBar: false),
            .picker(item: .init(name: "List No Search", value: [0], valueOptions: ["Received", "Started", "Hold"], allowsMultipleSelection: true, allowsEmptySelection: true, barItemDisplayMode: .name, isSearchBarHidden: true, icon: "clock", itemLayout: .fixed, displayMode: .list), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "List Status", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending", "Accepted Medium", "Pending Medium", "Completed Medium"], allowsMultipleSelection: true, allowsEmptySelection: true, barItemDisplayMode: .name, icon: "clock", itemLayout: .fixed, displayMode: .list), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "List Many Status", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending", "Accepted Medium", "Pending Medium", "Completed Medium", "Checked", "Unchecked", "Partially Checked", "Checked and Unchecked", "Checked and Partially Checked", "Unchecked and Partially Checked", "Partially Checked and Unchecked", "Checked and Unchecked and Partially Checked", "Unchecked and Partially Checked and Partially Checked", "Partially Checked and Unchecked and Partially Checked", "Checked Finally", "Unchecked Finally", "Partially Checked Finally", "Checked and Unchecked Finally", "Checked and Partially Checked Finally", "Unchecked and Partially Checked Finally", "Partially Checked and Unchecked Finally", "Checked Finally and Partially Checked Finally", "Unchecked Finally and Partially Checked Finally", "Partially Checked Finally and Partially Checked Finally", "Review", "Reviewed", "To be Reviewed", "Pending for Review", "Booked", "To be Booked", "Will Book", "Booking Canceled"], allowsMultipleSelection: true, allowsEmptySelection: true, barItemDisplayMode: .value, icon: "clock", itemLayout: .fixed, displayMode: .list), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "Flexible Filter", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending", "Accepted Medium", "Pending", "Completed Medium"], allowsMultipleSelection: true, allowsEmptySelection: true, barItemDisplayMode: .nameAndValue, icon: "clock", itemLayout: .flexible, displayMode: .filterFormCell), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "Fixed Few Filter", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending"], allowsMultipleSelection: false, allowsEmptySelection: true, barItemDisplayMode: .name, icon: "clock", itemLayout: .fixed, displayMode: .filterFormCell), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "Fixed Many Filter", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending", "Accepted Medium", "Pending Medium", "Completed Medium", "Checked", "Unchecked", "Partially Checked", "Checked and Unchecked", "Checked and Partially Checked", "Unchecked and Partially Checked", "Partially Checked and Unchecked", "Checked and Unchecked and Partially Checked", "Unchecked and Partially Checked and Partially Checked", "Partially Checked and Unchecked and Partially Checked", "Checked Finally", "Unchecked Finally", "Partially Checked Finally", "Checked and Unchecked Finally", "Checked and Partially Checked Finally", "Unchecked and Partially Checked Finally", "Partially Checked and Unchecked Finally", "Checked Finally and Partially Checked Finally", "Unchecked Finally and Partially Checked Finally", "Partially Checked Finally and Partially Checked Finally", "Review", "Reviewed", "To be Reviewed", "Pending for Review", "Booked", "To be Booked", "Will Book", "Booking Canceled"], allowsMultipleSelection: false, allowsEmptySelection: true, barItemDisplayMode: .value, icon: "clock", itemLayout: .fixed, displayMode: .filterFormCell), showsOnFilterFeedbackBar: true)
        ],
        [
            .picker(item: .init(name: "Priority", value: [0], valueOptions: ["High", "Medium", "Low"], allowsMultipleSelection: true, allowsEmptySelection: true, barItemDisplayMode: .nameAndValue, icon: "filemenu.and.cursorarrow"), showsOnFilterFeedbackBar: true),
            .filterfeedback(item: .init(name: "Sort Order", value: [0], valueOptions: ["Ascending", "Descending"], allowsMultipleSelection: false, allowsEmptySelection: false, icon: "checkmark")),
            .stepper(item: .init(name: "Quantity", stepperTitle: "Label", value: 1, step: 1, stepRange: 0 ... 100, isDecimalSupported: false, description: "Hint Text"), showsOnFilterFeedbackBar: true)

        ],
        [
            .slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "%2d Stories", icon: "number"), showsOnFilterFeedbackBar: true),
            .slider(item: .init(name: "Number of Tasks", value: nil, minimumValue: 0, maximumValue: 100), showsOnFilterFeedbackBar: true),
            .datetime(item: .init(name: "Start Date", value: Date(), formatter: "yyyy-MM-dd HH:mm", icon: "calendar"), showsOnFilterFeedbackBar: true)
        ],
        [
            .datetime(item: .init(name: "Completion Date", value: nil), showsOnFilterFeedbackBar: true)
        ]
    ]
    
    @State private var isShowingFullCFG: Bool = false
    @State private var isCustomStyle: Bool = false
    @State private var sortFilterList: [String] = []
    @State private var sortFilterButtonLabel: String = "Sort & Filter"

    var body: some View {
        VStack {
            if self.isCustomStyle {
                FilterFeedbackBar(items: self.$items, onUpdate: self.performSortAndFilter)
                    .filterFeedbackBarStyle(font: .subheadline, foregroundColorSelected: .red, strokeColorSelected: .red, cornerRadius: 25, maxWidth: 200)
                    .optionListPickerStyle(font: .footnote, foregroundColorUnselected: .green, strokeColorSelected: .black)
//                    .trailingFullConfigurationMenuItem(icon: "command")
//                    .leadingFullConfigurationMenuItem(icon: "command")
//                    .leadingFullConfigurationMenuItem(name: "All")
            } else {
                FilterFeedbackBar(items: self.$items, onUpdate: self.performSortAndFilter)
            }
            
            List {
                ForEach(self.sortFilterList, id: \.self) { line in
                    Text(line)
                }
            }
            .listStyle(PlainListStyle())
            
            HStack {
                Toggle("Custom Style", isOn: self.$isCustomStyle)
                    .fixedSize()
                    .toggleStyle(FioriToggleStyle())

                Button("Print") {
                    for line in self.sortFilterList {
                        print(line)
                    }
                }
            }
        }
        .navigationTitle("Sort & Filter")
        .toolbar {
            Button(self.sortFilterButtonLabel) {
                self.isShowingFullCFG.toggle()
            }
            .popover(isPresented: self.$isShowingFullCFG, arrowEdge: .leading) {
                if self.isCustomStyle {
                    SortFilterView(
                        title: "Configuration",
                        items: self.$items,
                        onUpdate: self.performSortAndFilter
                    )
                    .optionListPickerStyle(font: .footnote, foregroundColorUnselected: .green, strokeColorSelected: .black)
                } else {
                    SortFilterView(
                        title: "Configuration",
                        items: self.$items,
                        onUpdate: self.performSortAndFilter
                    )
                }
            }
        }
        .onAppear {
            self.performSortAndFilter()
        }
    }
    
    func numberOfItems() -> Int {
        // randomly padding result to mimic impact of filtering
        for i in 0 ... Int.random(in: 0 ... 5) {
            self.sortFilterList.append("padding element \(i + 1)")
        }
        return self.sortFilterList.count
    }
    
    func performSortAndFilter() {
        self.sortFilterList = self.items.joined().map { value(of: $0) }
        self.sortFilterButtonLabel = "CFG (\(self.numberOfItems()))"
    }
}

#if DEBUG
    @available(iOS 16.0, *)
    struct SortFilterExample_Previews: PreviewProvider {
        static var previews: some View {
            SortFilterExample()
        }
    }
#endif
