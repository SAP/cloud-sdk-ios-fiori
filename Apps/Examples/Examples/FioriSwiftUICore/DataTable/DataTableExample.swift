import FioriSwiftUICore
import Foundation
import SwiftUI

public enum TestRowData {
    static func generateRowData(count: Int, for row: Int) -> TableRowItem {
        var data: [DataItem] = []
        let durationPicker: [(String, [String])] = [
            ("Hours", Array(0 ... 23).map { "\($0)" }),
            ("Minutes", Array(0 ... 59).map { "\($0)" }),
            ("Seconds", Array(0 ... 59).map { "\($0)" })
        ]
        let riskPickers: [(String, [String])] = [
            ("Risk", ["High", "Medium", "Low"])
        ]
        let singleFormatter = { (_ selections: [Int]) -> DataTextItem in
            let item = DataTextItem("\(riskPickers[0].1[selections.first!]) risk of overflow")
            item.textColor = .orange
            return item
        }
        let datePicker: [(String, [String])] = { () -> [(String, [String])] in
            let numsOfDates = 8
            let calendar = Calendar.current
            let fmt = DateFormatter()
            fmt.dateFormat = "yyyy-MM-dd"
            var startDate = Date()
            var strs: [String] = []
            for _ in 0 ..< numsOfDates {
                strs.append(fmt.string(from: startDate))
                startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
            }
            return [("", strs)]
        }()
        for i in 0 ..< count {
            let textString = i % 2 == 0 ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis tristique pretium." : "Aliquam erat volutpat."
            let textItem = DataTextItem(textString)
            let imageItem = DataImageItem(Image("wheel"))
            let currentPicker: [(String, [String])] = row % 2 == 0 ? (row % 3 == 0 ? riskPickers : datePicker) : durationPicker
            let currentSelection: [Int] = row % 2 == 0 ? [0] : [2, 3, 4]
            let pickerItem = DataPickerItem(pickers: currentPicker, selections: currentSelection, displayingItem: (row % 2 == 0 && row % 3 == 0) ? singleFormatter : nil)
            if i == 0 {
                data.append(imageItem)
            } else if i == 1 {
                data.append(pickerItem)
            } else {
                data.append(textItem)
            }
        }
        let lAccessories: [AccessoryItem] = [.icon(Image(systemName: "arrow.triangle.2.circlepath"))]
        
        let tAccessory: AccessoryItem = .button(.init(image: Image(systemName: "cart.badge.plus"), title: "", action: {
            print("trailing accessory tapped: \(row) tapped")
        }))
        
        let output = TableRowItem(leadingAccessories: lAccessories, trailingAccessory: tAccessory, data: data)
        
        return output
    }
    
    static func generateNewRow(column: Int) -> TableRowItem {
        var data: [DataItem] = []
        for _ in 0 ..< column {
            let textItem = DataTextItem("New item was added", lineLimit: 2)
            data.append(textItem)
        }
        return TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: data)
    }
    
    static func generateColumnAttributes(column: Int) -> [ColumnAttribute] {
        var output: [ColumnAttribute] = []
        for i in 0 ..< column {
            let att = ColumnAttribute(textAlignment: .leading, width: .flexible)
            output.append(att)
        }
        return output
    }
    
    static func generateData(row: Int, column: Int) -> TableModel {
        var res: [TableRowItem] = []
        var titles: [DataTextItem] = []
        for k in 0 ..< column {
            let title = k == 0 ? "" : (k % 2 != 0 ? "Pellentesque risus elit" : "Vivamus et enim eu nisi gravida semper")
            titles.append(DataTextItem(title))
        }
        for i in 0 ..< row {
            res.append(self.generateRowData(count: column, for: i))
        }
        let header = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: titles)
        let model = TableModel(headerData: header, rowData: res, isHeaderSticky: true, isFirstColumnSticky: true, showListView: false)
        model.columnAttributes = self.generateColumnAttributes(column: 12)
        model.didSelectRowAt = { _ in
            print(model.selectedIndexes)
        }
        model.selectedIndexes = [2, 3]
        model.isPinchZoomEnable = false
        return model
    }
}

public struct DataTableExample: View {
    var model: TableModel = TestRowData.generateData(row: 30, column: 12)
    @State var isEditing: Bool = false
    @State private var showingSheet = false
    
    public init() {}
    
    public var body: some View {
        makeBody()
    }
    
    func makeBody() -> some View {
        var view = DataTable(model: self.model)
        return
            view
                .navigationBarTitle("Data Table", displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: {
                        showingSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $showingSheet) {
                        SheetView(model: self.model)
                    },
                    trailing:
                    Button(self.isEditing ? "Delete" : "Edit") {
                        DispatchQueue.main.async {
                            self.isEditing = !self.isEditing
                            view.isEditing = self.isEditing
                            if !self.isEditing {
                                let indexSet = IndexSet(self.model.selectedIndexes)
                                self.model.rowData.remove(atOffsets: indexSet)
                                self.model.selectedIndexes = []
                            }
                        }
                    })
    }
}

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var model: TableModel!
    
    init(model: TableModel) {
        self.model = model
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< 12) { i in
                    Text("New column: \(i)")
                }
            }
            .navigationBarTitle(Text("Add some new data"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.model.rowData.insert(generateNewRow(column: 12), at: 0)
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done").bold()
            })
        }
    }
    
    func generateNewRow(column: Int) -> TableRowItem {
        var data: [DataItem] = []
        for i in 0 ..< column {
            let textItem = DataTextItem("New column: \(i)", lineLimit: 2)
            data.append(textItem)
        }
        let tAccessory: AccessoryItem = .button(.init(image: Image(systemName: "square.and.arrow.up"), title: "", action: {}))
        return TableRowItem(leadingAccessories: [], trailingAccessory: tAccessory, data: data)
    }
}
