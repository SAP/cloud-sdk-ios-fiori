import FioriSwiftUICore
import Foundation
import SwiftUI

struct DataTableExample: View {
    var body: some View {
        List {
            Section(header: Text("Width attribute & alignment")) {
                NavigationLink("One column infinity width trailing alignment",
                               destination: DataTableExampleView(model: oneColumnWithInfinityWidth))

                NavigationLink("3 columns, 2nd column fixed(30), with different alignment",
                               destination: DataTableExampleView(model: threeRowThreeColumn))

                NavigationLink("3 columns, 2nd column fixed(80), with different alignment",
                               destination: DataTableExampleView(model: threeRowThreeColumnWithAlignment))
            }
            
            Section(header: Text("Accessories")) {
                NavigationLink("One column flexible width trailing alignment",
                               destination: DataTableExampleView(model: oneColumn))
                
                NavigationLink("Multiple kinds of accessories",
                               destination: DataTableExampleView(model: threeRowTwoColumnWithAcc))
            }
            
            Section(header: Text("Number of lines")) {
                NavigationLink("Number of lines from 1, 2, 3 and 0",
                               destination: DataTableExampleView(model: linelimit))
                
                NavigationLink("Different kinds of fonts with baseline alignment",
                               destination: DataTable(model: linelimit2)
                                   .rowAlignment(.baseline))
            }
            
            Section(header: Text("Table Card")) {
                NavigationLink("Example 1, list view mode",
                               destination: DataTable(model: tableCard1)
                                   .dataCellPadding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
                                   .showRowDivider(false)
                                   .showColumnDivider(false)
                                   .minRowHeight(20)
                                   .rowAlignment(.baseline)
                                   .showListView(true)
                                   .frame(width: 343, height: 124)
                                   .border(Color.gray, width: 1)
                                   .disabled(true))
                
                NavigationLink("Example 2",
                               destination: DataTable(model: tableCard2)
                                   .dataCellPadding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
                                   .showRowDivider(false)
                                   .showColumnDivider(false)
                                   .minRowHeight(20)
                                   .rowAlignment(.baseline)
                                   .allowsPartialRowDisplay(false)
                                   .frame(width: 343, height: 124)
                                   .border(Color.gray, width: 1)
                                   .disabled(true))
            }
            
            Section(header: Text("Background Color & Divides")) {
                NavigationLink("Green, hide both row & column dividers",
                               destination: DataTable(model: TestRowData.generateData(row: 10, column: 4, isHeaderSticky: true, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false))
                                   .showColumnDivider(false)
                                   .showColumnDivider(false)
                                   .headerCellPadding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
                                   .dataCellPadding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                                   .allowsPartialRowDisplay(false)
                                   .backgroundColor(Color.green))
                
                NavigationLink("Clear and Green under DataTable, hide row dividers",
                               destination: DataTable(model: TestRowData.generateData(row: 10, column: 4, isHeaderSticky: true, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false))
                                   .showRowDivider(false)
                                   .backgroundColor(Color.clear)
                                   .background(Color.green))
            }
            
            Section(header: Text("Sticky header/column")) {
                NavigationLink("Not sticky header & column, baseline alignment",
                               destination: DataTable(model: TestRowData.generateData(row: 10, column: 5, isHeaderSticky: false, isFirstColumnSticky: false, isPinchZoomEnable: true, showListView: false)).rowAlignment(.baseline))
                
                NavigationLink("Sticky header",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 10, column: 5, isHeaderSticky: true, isFirstColumnSticky: false, isPinchZoomEnable: true, showListView: false)))
                
                NavigationLink("Sticky column",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 10, column: 5, isHeaderSticky: false, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false)))
                
                NavigationLink("Sticky header & column",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 10, column: 5, isHeaderSticky: true, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false)))
            }
            
            Section(header: Text("Variant rows/columns")) {
                NavigationLink("No Data",
                               destination: DataTableExampleView(model: TableModel(headerData: nil, rowData: [])))
                
                NavigationLink("One column, two column, three column",
                               destination: DataTableExampleView(model: oneColumnTwoColumnThreeColumn))
                
                NavigationLink("5 rows 3 columns list view",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 5, column: 3, isHeaderSticky: false, isFirstColumnSticky: false, isPinchZoomEnable: true, showListView: true)))
                
                NavigationLink("30 rows 12 columns",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 30, column: 12, isHeaderSticky: true, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false)))
                
                NavigationLink("300 rows 60 columns",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 300, column: 60, isHeaderSticky: true, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false)))
                
                NavigationLink("1000 rows 100 columns",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 1000, column: 100, isHeaderSticky: true, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false)))
            }
        }
    }
}

let row0 = TableRowItem(leadingAccessories: [accBtn], trailingAccessory: accBtn, data: [DataTextItem("Need Attention")])
let row1 = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Need Attention", Font.subheadline.weight(.medium), Color.preferredColor(.criticalLabel)), DataTextItem("Yesterday", Font.caption, Color.preferredColor(.tertiaryLabel))])
let row2 = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Stable", Font.subheadline), DataTextItem("Jul 5, 2021", Font.caption, Color.preferredColor(.tertiaryLabel))])
let row3 = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Need Attention", Font.subheadline), DataTextItem("Jul 4, 2021", Font.caption, Color.preferredColor(.tertiaryLabel))])
let threeRowTwoColumn = TableModel(headerData: nil, rowData: [row1, row2, row3], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [], isPinchZoomEnable: true, showListView: false)

let tableCard1 = TableModel(headerData: nil, rowData: [row1, row2, row3], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [ColumnAttribute(textAlignment: .leading, width: .flexible), ColumnAttribute(textAlignment: .trailing, width: .infinity)], isPinchZoomEnable: false, showListView: false)
let tableCard2 = TableModel(headerData: nil, rowData: [row1, row2, row3, row2, row3, row3], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [ColumnAttribute(textAlignment: .leading, width: .flexible), ColumnAttribute(textAlignment: .trailing, width: .infinity)], isPinchZoomEnable: false, showListView: false)

let accIcon = AccessoryItem.icon(Image(systemName: "arrow.triangle.2.circlepath"))

let accBtn = AccessoryItem.button(AccessoryButton(image: Image(systemName: "square.and.arrow.up"),
                                                  title: "Share",
                                                  action: {
                                                      print("Tapped the leading accessory button")
                                                  }))

let row1Linelimit = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 1 line limit", lineLimit: 1), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 1 line limit", lineLimit: 1)])
let row2Linelimit = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 2 lines limit", lineLimit: 2), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 2 line2 limit", lineLimit: 2)])
let row3Linelimit = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 3 lines limit", lineLimit: 3), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 3 lines limit", lineLimit: 3)])
let row4Linelimit = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - no line limit", Font.system(size: 48, weight: .bold, design: .rounded), Color.orange), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - no line limit", Font.system(size: 52, weight: .heavy, design: .monospaced))])
let linelimit = TableModel(headerData: nil, rowData: [row1Linelimit, row2Linelimit, row3Linelimit, row4Linelimit], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [], isPinchZoomEnable: true, showListView: false)

let row1Linelimit2 = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 1 line limit", Font.footnote, Color.green, lineLimit: 1), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 1 line limit", Font.caption, Color.red, lineLimit: 1)])
let row2Linelimit2 = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 2 lines limit", Font.body, Color.orange, lineLimit: 2), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 2 line2 limit", Font.callout, Color.green, lineLimit: 2)])
let row3Linelimit2 = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 3 lines limit", Font.title, Color.red, lineLimit: 3), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 3 lines limit", Font.headline, Color.orange, lineLimit: 3)])
let row4Linelimit2 = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("No line limit", Font.largeTitle, Color.orange), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - no line limit", Font.footnote, Color.blue)])
let linelimit2 = TableModel(headerData: nil, rowData: [row1Linelimit2, row2Linelimit2, row3Linelimit2, row4Linelimit2], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [], isPinchZoomEnable: true, showListView: false)

let row1WithAccs = TableRowItem(leadingAccessories: [accBtn], trailingAccessory: accIcon, data: [DataTextItem("Need Attention"), DataTextItem("Yesterday")])
let row2WithAccs = TableRowItem(leadingAccessories: [accIcon], trailingAccessory: nil, data: [DataTextItem("Stable"), DataTextItem("Jul 5, 2021")])
let row3WithAccs = TableRowItem(leadingAccessories: [accIcon, accBtn, accBtn], trailingAccessory: accBtn, data: [DataTextItem("Need Attention"), DataTextItem("Jul 4, 2021")])
let threeRowTwoColumnWithAcc = TableModel(headerData: nil, rowData: [row1WithAccs, row2WithAccs, row3WithAccs], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [], isPinchZoomEnable: true, showListView: false)

let row1WithAlignment = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Leading"), DataTextItem("C"), DataImageItem(Image("wheel"))])
let row2WithAlignment = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataTextItem("Leading Leading"), DataImageItem(Image("wheel")), DataTextItem("Trailing Trailing")])
let row3WithAlignment = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: [DataImageItem(Image("wheel")), DataTextItem("Center Center"), DataTextItem("Trailing Trailing Trailing Trailing Trailing Trailing Trailing Trailing Trailing Trailing end")])

let threeRowThreeColumn = TableModel(headerData: nil,
                                     rowData: [row1WithAlignment, row2WithAlignment, row3WithAlignment],
                                     isHeaderSticky: false,
                                     isFirstColumnSticky: false,
                                     columnAttributes: [ColumnAttribute(textAlignment: .leading, width: .flexible),
                                                        ColumnAttribute(textAlignment: .center, width: .fixed(30)),
                                                        ColumnAttribute(textAlignment: .trailing, width: .infinity)],
                                     isPinchZoomEnable: true, showListView: false)

let threeRowThreeColumnWithAlignment = TableModel(headerData: nil,
                                                  rowData: [row1WithAlignment, row2WithAlignment, row3WithAlignment],
                                                  isHeaderSticky: false,
                                                  isFirstColumnSticky: false,
                                                  columnAttributes: [ColumnAttribute(textAlignment: .leading, width: .flexible),
                                                                     ColumnAttribute(textAlignment: .center, width: .fixed(80)),
                                                                     ColumnAttribute(textAlignment: .trailing, width: .infinity)],
                                                  isPinchZoomEnable: true, showListView: false)

let oneColumn = TableModel(headerData: nil, rowData: [row0], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [ColumnAttribute(textAlignment: .leading, width: .flexible)], isPinchZoomEnable: true, showListView: false)
let oneColumnWithInfinityWidth = TableModel(headerData: nil, rowData: [row0], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [ColumnAttribute(textAlignment: .trailing, width: .infinity)], isPinchZoomEnable: true, showListView: false)

let oneColumnTwoColumnThreeColumn = TableModel(headerData: nil, rowData: [row0, row1, row1WithAlignment], isHeaderSticky: false, isFirstColumnSticky: false, isPinchZoomEnable: true, showListView: false)

public enum TestRowData {
    static let fonts = [Font.callout, Font.body, Font.footnote]
    static let textColors = [Color.blue, Color.purple, Color.black]
    static func generateRowData(count: Int, for row: Int) -> TableRowItem {
        var data: [DataItem] = []
        for i in 0 ..< count {
            let textString = i % 2 == 0 ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis tristique pretium." : "Aliquam erat volutpat."
            
            let textItem = DataTextItem("(\(row), \(i)): " + textString, self.fonts[i % 3], self.textColors[i % 3])
            let imageItem = DataImageItem(Image("wheel"))
            data.append(i == 0 ? imageItem : textItem)
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
        for _ in 0 ..< column {
            let att = ColumnAttribute(textAlignment: .leading, width: .flexible)
            output.append(att)
        }
        return output
    }
    
    static func generateData(row: Int, column: Int, isHeaderSticky: Bool = true, isFirstColumnSticky: Bool = true, isPinchZoomEnable: Bool = true, showListView: Bool = false) -> TableModel {
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
        let model = TableModel(headerData: header, rowData: res, isHeaderSticky: isHeaderSticky, isFirstColumnSticky: isFirstColumnSticky, isPinchZoomEnable: isPinchZoomEnable, showListView: showListView)
        model.columnAttributes = self.generateColumnAttributes(column: column)
        model.didSelectRowAt = { _ in
            print(model.selectedIndexes)
        }
        model.selectedIndexes = [0]
        
        return model
    }
}

public struct DataTableExampleView: View {
    var model: TableModel
    @State var isEditing: Bool = false
    @State private var showingSheet = false
 
    public init(model: TableModel) {
        self.model = model
    }
    
    public var body: some View {
        makeBody()
    }
    
    func makeBody() -> some View {
        DataTable(model: self.model)
            .padding([.leading, .trailing])
            .navigationBarTitle("Data Table")
            .navigationBarItems(leading:
                Button(action: {
                    showingSheet.toggle()
                }) {
                    Image(systemName: "plus")
                }.sheet(isPresented: $showingSheet) {
                    SheetView(model: self.model)
                },
                trailing: Button(self.isEditing ? "Delete" : "Edit") {
                    self.isEditing = !self.isEditing
                    model.isEditing = self.isEditing
                    if !self.isEditing {
                        let indexSet = IndexSet(self.model.selectedIndexes)
                        print("remove indexset: \(indexSet)")
                        self.model.rowData.remove(atOffsets: indexSet)
                        self.model.selectedIndexes = []
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
        let numOfColumn: Int = model.rowData.first?.data.count ?? 0
        return NavigationView {
            List {
                ForEach(0 ..< numOfColumn, id: \.self) { i in
                    Text("New column: \(i)")
                }
            }
            .navigationBarTitle(Text("Add some new data"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.model.rowData.insert(generateNewRow(column: numOfColumn), at: 0)
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
