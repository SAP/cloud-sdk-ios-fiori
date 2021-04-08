import Foundation
import SwiftUI

public enum TestRowData {
    static func generateRowData(count: Int, for row: Int) -> TableRowItem {
        var data: [DataItem] = []
        for i in 0 ..< count {
            let textItem = DataTextItem("\(row), \(i)")
            let imageItem = DataImageItem(Image(systemName: "checkmark.circle.fill"))
            data.append(i == 0 ? imageItem : textItem)
        }
        let lAccessories: [AccessoryItem] = [.button(.init(image_selected: Image(systemName: "checkmark.circle.fill"), image_deSelected: Image(systemName: "checkmark.circle"), title: "", action: {
            print("row: \(row) tapped")
        }, selected: false)), .icon(Image(systemName: "arrow.triangle.2.circlepath"))]
        
        let tAccessory: AccessoryItem = .button(.init(image_selected: Image(systemName: "chevron.forward"), image_deSelected: Image(systemName: "chevron.forward"), title: "", action: {
            print("trailing accessory tapped: \(row) tapped")
        }, selected: false))
        
        let output = TableRowItem(leadingAccessories: lAccessories, trailingAccessory: tAccessory, data: data)
        
        return output
    }
    
    static func generateNewRow(column: Int) -> TableRowItem {
        var data: [DataItem] = []
        for i in 0 ..< column {
            let textItem = DataTextItem("new item new item new item")
            textItem.lineLimit = 2
            data.append(textItem)
        }
        return TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: data)
    }
    
    static func generateColumnAttributes(column: Int) -> [ColumnAttribute] {
        var output: [ColumnAttribute] = []
        for i in 0 ..< column {
            let alignment: TextAlignment = i % 2 == 0 ? .leading : .trailing
            let width: ColumnAttribute.Width = i % 2 == 0 ? .flexible : .fixed(80)
            let att = ColumnAttribute(textAlignment: alignment, width: width)
            output.append(att)
        }
        return output
    }
    
    static func generateData(row: Int, column: Int) -> TableModel {
        var res: [TableRowItem] = []
        var titles: [String] = []
        for k in 0 ..< column {
            titles.append(k == 0 ? "" : "Long Header Title: \(k)")
        }
        for i in 0 ..< row {
            res.append(self.generateRowData(count: column, for: i))
        }
        
        let model = TableModel(headerTitles: titles, rowData: res, isFirstRowSticky: true, isFirstColumnSticky: true, showListView: true)
        //        model.columnAttributes = self.generateColumnAttributes(column: 12)
        model.columnAttributes = self.generateColumnAttributes(column: 12)
        model.selectedIndex = [2, 3]
        
        return model
    }
}

public struct TestTableView: View {
    var model: TableModel = TestRowData.generateData(row: 30, column: 12)
    @State var isEditing: Bool = false
    
    public init() {}
    
    public var body: some View {
        makeBody()
    }
    
    func makeBody() -> some View {
        var view = TableDataView()
        return
            NavigationView {
                view
                    .environmentObject(self.model)
                    .navigationBarTitle("grid data table", displayMode: .inline)
                    .navigationBarItems(leading:
                        Button("Add a row") {
                            DispatchQueue.main.async {
                                self.model.rowData.insert(TestRowData.generateNewRow(column: 12), at: 1)
                            }
                        }
                    )
                    .navigationBarItems(leading:
                        Button("Add a row") {
                            DispatchQueue.main.async {
                                self.model.rowData.insert(TestRowData.generateNewRow(column: 12), at: 1)
                            }
                        }, trailing:
                        Button(self.isEditing ? "Done" : "Edit") {
                            self.isEditing = !self.isEditing
                            view.isEditing = self.isEditing
                        })
            }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}
