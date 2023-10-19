import FioriSwiftUICore
import SwiftUI

struct SortFilterExample: View {
    @State private var items: [[SortFilterItem]] = [[
        .picker(item: .init(value: [0], valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review", "Accepted", "Rejected"], name: "JIRA Status", allowsMultipleSelection: true, allowsEmptySelection: true, icon: "clock"), isShownOnMenu: true),
        .picker(item: .init(value: [0], valueOptions: ["High", "Medium", "Low"], name: "Priority", allowsMultipleSelection: true, allowsEmptySelection: true, icon: "filemenu.and.cursorarrow"), isShownOnMenu: true),
        .filterfeedback(item: .init(value: [0], valueOptions: ["Ascending", "Descending"], name: "Sort Order", allowsMultipleSelection: false, allowsEmptySelection: false, icon: "checkmark")),
        .slider(item: .init(value: 10, minimumValue: 0, maximumValue: 100, name: "Number of User Stories", icon: "number"), isShownOnMenu: true),
        .slider(item: .init(value: nil, minimumValue: 0, maximumValue: 100, name: "Number of Tasks"), isShownOnMenu: true),
        .datetime(item: .init(value: Date(), name: "Start Date", icon: "calendar"), isShownOnMenu: true),
        .datetime(item: .init(value: nil, name: "Completion Date"), isShownOnMenu: true),
        .switch(item: .init(name: "Favorite", value: true, icon: "heart.fill"), isShownOnMenu: true),
        .switch(item: .init(name: "Tagged", value: nil, icon: "tag"), isShownOnMenu: false)
    ]]
    
    @State private var isShowingFullCFG: Bool = false
    @State private var sortFilterList: [String] = []
    @State private var sortFilterButtonLabel: String = "Sort & Filter"

    var body: some View {
        VStack {
            SortFilterMenu(items: $items, onUpdate: performSortAndFilter)
//                .trailingFullConfigurationMenuItem(icon: "command")
//                .leadingFullConfigurationMenuItem(icon: "command")
//                .leadingFullConfigurationMenuItem(name: "All")
//                .sortFilterMenuItemStyle(font: .subheadline, foregroundColorSelected: .red, strokeColorSelected: .red, cornerRadius: 25)
            
            List {
                ForEach(sortFilterList, id: \.self) { line in
                    Text(line)
                }
            }
            .listStyle(PlainListStyle())
            
            Button("Print") {
                for line in sortFilterList {
                    print(line)
                }
            }
        }
        .navigationTitle("Sort & Filter")
        .toolbar {
            Button(sortFilterButtonLabel) {
                isShowingFullCFG.toggle()
            }
        }
        .sheet(isPresented: $isShowingFullCFG) {
            SortFilterFullCFG(
                items: $items,
                onUpdate: performSortAndFilter
            )
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
