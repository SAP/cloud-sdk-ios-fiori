import FioriSwiftUICore
import SwiftUI

struct SortFilterExample: View {
    @State private var items: [[SortFilterItem]] = [[
        .picker(item: .init(value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review", "Accepted", "Rejected"], name: "JIRA Status", allowsMultipleSelection: true, allowsEmptySelection: true, icon: "clock"), isShownOnMenu: true),
        .picker(item: .init(value: [0], valueOptions: ["High", "Medium", "Low"], name: "Priority", allowsMultipleSelection: true, allowsEmptySelection: true, icon: "filemenu.and.cursorarrow"), isShownOnMenu: true),
        .filterfeedback(item: .init(value: [0], valueOptions: ["Ascending", "Descending"], name: "Sort Order", allowsMultipleSelection: false, allowsEmptySelection: false, icon: "checkmark")),
        .slider(item: .init(value: 10, minimumValue: 0, maximumValue: 100, name: "User Stories", formatter: "%2d Stories", icon: "number"), isShownOnMenu: true),
        .slider(item: .init(value: nil, minimumValue: 0, maximumValue: 100, name: "Number of Tasks"), isShownOnMenu: true),
        .datetime(item: .init(value: Date(), name: "Start Date", formatter: "yyyy-MM-dd HH:mm",icon: "calendar"), isShownOnMenu: true),
        .datetime(item: .init(value: nil, name: "Completion Date"), isShownOnMenu: true),
        .switch(item: .init(name: "Favorite", value: true, icon: "heart.fill"), isShownOnMenu: true),
        .switch(item: .init(name: "Tagged", value: nil, icon: "tag"), isShownOnMenu: false)
    ]]
    
    @State private var isShowingFullCFG: Bool = false
    @State private var isCustomStyle: Bool = false
    @State private var sortFilterList: [String] = []
    @State private var sortFilterButtonLabel: String = "Sort & Filter"

    var body: some View {
        VStack {
            if isCustomStyle {
                SortFilterMenu(items: $items, onUpdate: performSortAndFilter)
                    .sortFilterMenuItemStyle(font: .subheadline, foregroundColorSelected: .red, strokeColorSelected: .red, cornerRadius: 25)
                    .optionChipStyle(font: .footnote, foregroundColorUnselected: .green, strokeColorSelected: .black)
                //                .trailingFullConfigurationMenuItem(icon: "command")
                //                .leadingFullConfigurationMenuItem(icon: "command")
                //                .leadingFullConfigurationMenuItem(name: "All")
            } else {
                SortFilterMenu(items: $items, onUpdate: performSortAndFilter)
            }
            
            List {
                ForEach(sortFilterList, id: \.self) { line in
                    Text(line)
                }
            }
            .listStyle(PlainListStyle())
            
            VStack {
                Toggle("Custom Style", isOn: $isCustomStyle)
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
                    SortFilterFullCFG(
                        title: "Configuration",
                        items: $items,
                        onUpdate: performSortAndFilter
                    )
                    .optionChipStyle(font: .footnote, foregroundColorUnselected: .green, strokeColorSelected: .black)
                } else {
                    SortFilterFullCFG(
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
            self.sortFilterList.append("Non-SortFilterCFG: element \(i + 1)")
        }
        return self.sortFilterList.count
    }
    
    func performSortAndFilter() {
        self.sortFilterList = self.items.joined().map { value(of: $0) }
        self.sortFilterButtonLabel = "Sort & Filter (\(self.numberOfItems()))"
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
