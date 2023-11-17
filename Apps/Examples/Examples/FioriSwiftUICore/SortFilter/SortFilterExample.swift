import FioriSwiftUICore
import SwiftUI

struct SortFilterExample: View {
    @State private var items: [[SortFilterItem]] = [
        [
            .switch(item: .init(name: "Favorite", value: true, icon: "heart.fill"), showsOnFilterFeedbackBar: true),
            .switch(item: .init(name: "Tagged", value: nil, icon: "tag"), showsOnFilterFeedbackBar: false),
            .picker(item: .init(name: "JIRA Status", value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review", "Accepted", "Rejected"], allowsMultipleSelection: true, allowsEmptySelection: true, icon: "clock"), showsOnFilterFeedbackBar: true)
        ],
        [
            .picker(item: .init(name: "Priority", value: [0], valueOptions: ["High", "Medium", "Low"], allowsMultipleSelection: true, allowsEmptySelection: true, icon: "filemenu.and.cursorarrow"), showsOnFilterFeedbackBar: true),
            .filterfeedback(item: .init(name: "Sort Order", value: [0], valueOptions: ["Ascending", "Descending"], allowsMultipleSelection: false, allowsEmptySelection: false, icon: "checkmark"))
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
            if isCustomStyle {
                FilterFeedbackBar(items: $items, onUpdate: performSortAndFilter)
                    .filterFeedbackBarStyle(font: .subheadline, foregroundColorSelected: .red, strokeColorSelected: .red, cornerRadius: 25)
                    .optionListPickerStyle(font: .footnote, foregroundColorUnselected: .green, strokeColorSelected: .black)
//                    .trailingFullConfigurationMenuItem(icon: "command")
//                    .leadingFullConfigurationMenuItem(icon: "command")
//                    .leadingFullConfigurationMenuItem(name: "All")
            } else {
                FilterFeedbackBar(items: $items, onUpdate: performSortAndFilter)
            }
            
            List {
                ForEach(sortFilterList, id: \.self) { line in
                    Text(line)
                }
            }
            .listStyle(PlainListStyle())
            
            HStack {
                Toggle("Custom Style", isOn: $isCustomStyle)
                    .fixedSize()
                    .toggleStyle(FioriToggleStyle())

                Button("Print") {
                    for line in sortFilterList {
                        print(line)
                    }
                }
            }
        }
        .navigationTitle("Sort & Filter")
        .toolbar {
            Button(sortFilterButtonLabel) {
                isShowingFullCFG.toggle()
            }
            .popover(isPresented: $isShowingFullCFG, arrowEdge: .leading) {
                if isCustomStyle {
                    SortFilterView(
                        title: "Configuration",
                        items: $items,
                        onUpdate: performSortAndFilter
                    )
                    .optionListPickerStyle(font: .footnote, foregroundColorUnselected: .green, strokeColorSelected: .black)
                } else {
                    SortFilterView(
                        title: "Configuration",
                        items: $items,
                        onUpdate: performSortAndFilter
                    )
                }
            }
        }
        .onAppear {
            performSortAndFilter()
        }
    }
    
    func numberOfItems() -> Int {
        // randomly padding result to mimic impact of filterring
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
