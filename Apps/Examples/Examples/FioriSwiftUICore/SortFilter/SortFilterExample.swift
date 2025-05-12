import FioriSwiftUICore
import SwiftUI

struct SortFilterExample: View {
    @State private var items: [[SortFilterItem]] = [
        [
            .switch(item: .init(name: "Favorite", value: true, icon: "heart.fill"), showsOnFilterFeedbackBar: true),
            .switch(item: .init(name: "Tagged", value: nil, icon: "tag"), showsOnFilterFeedbackBar: false),
            .picker(item: .init(name: "List Multiple", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed"], allowsMultipleSelection: true, allowsEmptySelection: true, barItemDisplayMode: .name, isSearchBarHidden: true, icon: "clock", itemLayout: .fixed, displayMode: .list, resetButtonConfiguration: FilterFeedbackBarResetButtonConfiguration(with: .clearAll, title: "Clear")), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "List Single", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed"], allowsMultipleSelection: false, allowsEmptySelection: true, barItemDisplayMode: .name, isSearchBarHidden: true, icon: "clock", itemLayout: .fixed, displayMode: .list, resetButtonConfiguration: FilterFeedbackBarResetButtonConfiguration(with: .clearAll)), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "List No Search", value: [0], valueOptions: ["Received", "Started", "Hold"], allowsMultipleSelection: false, allowsEmptySelection: true, barItemDisplayMode: .name, isSearchBarHidden: true, icon: "clock", itemLayout: .fixed, displayMode: .list), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "List Status", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending", "Accepted Medium", "Pending Medium", "Completed Medium"], allowsMultipleSelection: true, allowsEmptySelection: true, barItemDisplayMode: .name, icon: "clock", itemLayout: .fixed, displayMode: .list), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "List Many Status", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending", "Accepted Medium", "Pending Medium", "Completed Medium", "Checked", "Unchecked", "Partially Checked", "Checked and Unchecked", "Checked and Partially Checked", "Unchecked and Partially Checked", "Partially Checked and Unchecked", "Checked and Unchecked and Partially Checked", "Unchecked and Partially Checked and Partially Checked", "Partially Checked and Unchecked and Partially Checked", "Checked Finally", "Unchecked Finally", "Partially Checked Finally", "Checked and Unchecked Finally", "Checked and Partially Checked Finally", "Unchecked and Partially Checked Finally", "Partially Checked and Unchecked Finally", "Checked Finally and Partially Checked Finally", "Unchecked Finally and Partially Checked Finally", "Partially Checked Finally and Partially Checked Finally", "Review", "Reviewed", "To be Reviewed", "Pending for Review", "Booked", "To be Booked", "Will Book", "Booking Canceled"], allowsMultipleSelection: true, allowsEmptySelection: true, barItemDisplayMode: .value, icon: "clock", itemLayout: .fixed, displayMode: .list), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "Flexible Filter", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending", "Accepted Medium", "Pending", "Completed Medium"], allowsMultipleSelection: true, allowsEmptySelection: true, barItemDisplayMode: .nameAndValue, icon: "clock", itemLayout: .flexible, displayMode: .filterFormCell), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "Fixed Few Filter", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending"], allowsMultipleSelection: false, allowsEmptySelection: true, barItemDisplayMode: .name, icon: "clock", itemLayout: .fixed, displayMode: .filterFormCell), showsOnFilterFeedbackBar: true),
            .picker(item: .init(name: "Fixed Many Filter", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending", "Accepted Medium", "Pending Medium", "Completed Medium", "Checked", "Unchecked", "Partially Checked", "Checked and Unchecked", "Checked and Partially Checked", "Unchecked and Partially Checked", "Partially Checked and Unchecked", "Checked and Unchecked and Partially Checked", "Unchecked and Partially Checked and Partially Checked", "Partially Checked and Unchecked and Partially Checked", "Checked Finally", "Unchecked Finally", "Partially Checked Finally", "Checked and Unchecked Finally", "Checked and Partially Checked Finally", "Unchecked and Partially Checked Finally", "Partially Checked and Unchecked Finally", "Checked Finally and Partially Checked Finally", "Unchecked Finally and Partially Checked Finally", "Partially Checked Finally and Partially Checked Finally", "Review", "Reviewed", "To be Reviewed", "Pending for Review", "Booked", "To be Booked", "Will Book", "Booking Canceled"], allowsMultipleSelection: false, allowsEmptySelection: true, barItemDisplayMode: .value, icon: "clock", itemLayout: .fixed, displayMode: .filterFormCell), showsOnFilterFeedbackBar: true)
        ],
        [
            .picker(item: .init(name: "Priority", value: [0], valueOptions: ["High", "Medium", "Low"], allowsMultipleSelection: false, allowsEmptySelection: true, barItemDisplayMode: .nameAndValue, icon: "filemenu.and.cursorarrow"), showsOnFilterFeedbackBar: true),
            .filterfeedback(item: .init(name: "Sort Order", value: [0], valueOptions: ["Ascending", "Descending"], allowsMultipleSelection: false, allowsEmptySelection: false, icon: "checkmark")),
            .stepper(item: .init(name: "Quantity", stepperTitle: "Label", value: 1, step: 1, stepRange: 0 ... 100, isDecimalSupported: false, description: "Hint Text"), showsOnFilterFeedbackBar: true)
        ],
        [
            .slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true),
            .slider(item: .init(name: "Range Slider Decimal", value: nil, range: 0 ... 10, step: 1.5, decimalPlaces: 1), showsOnFilterFeedbackBar: true),
            .slider(item: .init(name: "Range Slider", lowerValue: 100, upperValue: 150, range: 50 ... 200, step: 10, decimalPlaces: 0, formatter: "Price range (50 - 200)", hint: "Select price range.", onValueChange: SliderValueChangeHandler(onValueChange: { lowerValue, upperValue in
                if !(50 ... 200 ~= lowerValue) {
                    return (.error, "Lower value is out of range.")
                } else if !(50 ... 200 ~= upperValue) {
                    return (.error, "Upper value is out of range.")
                } else if lowerValue > upperValue {
                    return (.error, "Lower value is greater than upper value.")
                }
                return (.fiori, "")
            })), showsOnFilterFeedbackBar: true),
            .datetime(item: .init(name: "Start Date", value: Date(), formatter: "yyyy-MM-dd HH:mm", icon: "calendar"), showsOnFilterFeedbackBar: true)
        ],
        [
            .datetime(item: .init(name: "Completion Date", value: nil), showsOnFilterFeedbackBar: true)
        ],
        [
            .title(item: .init(name: "Title", text: "This is default text.", placeholder: "Please input", maxTextLength: 20, isCharCountEnabled: true, charCountBeyondLimitMsg: "Char count beyond limit"), showsOnFilterFeedbackBar: true),
            .note(item: .init(name: "Note", text: "This is default text.", placeholder: "Please input", maxTextLength: 200, isCharCountEnabled: true, charCountBeyondLimitMsg: "Char count beyond limit"), showsOnFilterFeedbackBar: false)
        ],
        [.durationPicker(item: .init(name: "Duration", value: 0, maximumMinutes: 505, minimumMinutes: 0, minuteInterval: 1), showsOnFilterFeedbackBar: true)]
    ]
    
    @State private var isShowingFullCFG: Bool = false
    @State private var isCustomStyle: Bool = false
    @State private var sortFilterList: [String] = []
    @State private var sortFilterButtonLabel: String = "Sort & Filter"

    var body: some View {
        VStack {
            if self.isCustomStyle {
                FilterFeedbackBar(items: self.$items, onUpdate: self.performSortAndFilter)
                    .filterFeedbackBarItemCornerRadius(0)
                    .filterFeedbackBarItemBackgroundSelectedStrokeColor(.red)
                    .filterFeedbackBarItemSelectedForegroundColor(.red)
                    .filterFeedbackBarButtonStyle { c in
                        FilterFeedbackBarButton(c)
                            .titleStyle(content: { titleC in
                                titleC.title.foregroundStyle(c.isSelected ? Color.yellow : Color.green)
                            })
                            .iconStyle(content: { iconC in
                                iconC.icon.foregroundStyle(c.isSelected ? Color.yellow : Color.green)
                            })
                            .background {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(c.isSelected ? Color.green : Color.yellow)
                                        .stroke(c.isSelected ? Color.red : Color.green, lineWidth: 2)
                                }
                            }
                    }
            } else {
                FilterFeedbackBar(items: self.$items, onUpdate: self.performSortAndFilter)
                    .fullConfigurationItem(itemContent: .name("All Configuration"), position: .leading)
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
