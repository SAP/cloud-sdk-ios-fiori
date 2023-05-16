import FioriSwiftUICore
import Foundation
import SwiftUI

struct FontConversionView: View {
    var body: some View {
        List {
            Section(header: Text("System Font")) {
                Text("Gg italic").font(Font.largeTitle.italic())
                Text("Gg italic").font(Font(UIFont.preferredFont(from: Font.largeTitle.italic())))

                Text("Gg bold italic").font(Font.title.bold().italic())
                Text("Gg bold italic").font(Font(UIFont.preferredFont(from: Font.title.bold().italic())))

                Text("Gg black").font(Font.headline.weight(.black))
                Text("Gg black").font(Font(UIFont.preferredFont(from: Font.headline.weight(.black))))

                Text("Gg light italic").font(Font.body.weight(.light).italic())
                Text("Gg light italic").font(Font(UIFont.preferredFont(from: Font.body.weight(.light).italic())))

                Text("Gg system size thin rounded").font(Font.system(size: 18, weight: .thin, design: .rounded))
                Text("Gg system size thin rounded").font(Font(UIFont.preferredFont(from: Font.system(size: 18, weight: .thin, design: .rounded))))
            }

            Section(header: Text("Fiori Font")) {
                Text("Gg fiori semibold").font(Font.fiori(forTextStyle: .headline).weight(.semibold))
                Text("Gg fiori semibold").font(Font(UIFont.preferredFont(from: Font.fiori(forTextStyle: .headline).weight(.semibold))))

                Text("Gg fiori light italic").font(Font.fiori(forTextStyle: .largeTitle).weight(.light).italic())
                Text("Gg fiori light italic").font(Font(UIFont.preferredFont(from: Font.fiori(forTextStyle: .largeTitle).weight(.light).italic())))

                Text("Gg fiori black italic").font(Font.fiori(forTextStyle: .subheadline).weight(.black).italic())
                Text("Gg fiori black italic").font(Font(UIFont.preferredFont(from: Font.fiori(forTextStyle: .subheadline).weight(.black).italic())))

                Text("Gg fiori condensed").font(Font.fiori(forTextStyle: .caption2, isCondensed: true))
                Text("Gg fiori condensed").font(Font(UIFont.preferredFont(from: Font.fiori(forTextStyle: .caption2, isCondensed: true))))
                
                Text("Gg fiori size 18 light").font(Font.fiori(fixedSize: 18).weight(.light))
                Text("Gg fiori size 18 light").font(Font(UIFont.preferredFont(from: Font.fiori(fixedSize: 18).weight(.light))))
            }
            
            Section(header: Text("Custom Font")) {
                Text("Gg Helvetica font").font(Font.custom("Helvetica", size: 34, relativeTo: .largeTitle))
                Text("Gg Helvetica font").font(Font(UIFont.preferredFont(from: Font.custom("Helvetica", size: 34, relativeTo: .largeTitle))))

                Text("Gg Helvetica italic").font(Font.custom("Helvetica", size: 17, relativeTo: .body).italic())
                Text("Gg Helvetica italic").font(Font(UIFont.preferredFont(from: Font.custom("Helvetica", size: 17, relativeTo: .body).italic())))

                Text("Gg Helvetica bold").font(Font.custom("Helvetica", size: 17, relativeTo: .body).bold())
                Text("Gg Helvetica bold").font(Font(UIFont.preferredFont(from: Font.custom("Helvetica", size: 17, relativeTo: .body).bold())))
            }
        }
    }
}

struct DataTableExample: View {
    var body: some View {
        List {
            NavigationLink("Font to UIFont Conversoin", destination: FontConversionView())
            
            Section(header: Text("Width attribute & alignment")) {
                NavigationLink("One column infinity width trailing alignment",
                               destination: DataTableExampleView(model: oneColumnWithInfinityWidth))

                NavigationLink("3 columns, 2nd column fixed(30), with different alignment & Fiori Fonts",
                               destination: DataTableExampleView(model: threeRowThreeColumn))

                NavigationLink("3 columns, 2nd column fixed(80), with different alignment",
                               destination: DataTableExampleView(model: threeRowThreeColumnWithAlignment))
                
                NavigationLink("All kinds of Data Types",
                               destination: DataTableExampleView(model: threeRowThreeColumnWithDates))
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
                               destination: DataTableExampleView(model: linelimit2))
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
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 10, column: 5, containLeadingAccessory: false, containTrailingAccessory: false, isHeaderSticky: false, isFirstColumnSticky: false, isPinchZoomEnable: true, showListView: false)))
                
                NavigationLink("Sticky header",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 10, column: 5, containLeadingAccessory: false, containTrailingAccessory: true, isHeaderSticky: true, isFirstColumnSticky: false, isPinchZoomEnable: true, showListView: false)))
                
                NavigationLink("Sticky column",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 10, column: 5, containLeadingAccessory: true, containTrailingAccessory: false, isHeaderSticky: false, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false)))
                
                NavigationLink("Sticky header & column",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 10, column: 5, containLeadingAccessory: false, containTrailingAccessory: false, isHeaderSticky: true, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false)))
            }
            
            Section(header: Text("Variant rows/columns")) {
                NavigationLink("No Data",
                               destination: DataTableExampleView(model: TableModel(headerData: nil, rowData: [])))
                
                NavigationLink("One column, two column, three column",
                               destination: DataTableExampleView(model: oneColumnTwoColumnThreeColumn))
                
                NavigationLink("5 rows 3 columns",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 5, column: 3, isHeaderSticky: false, isFirstColumnSticky: false, isPinchZoomEnable: true, showListView: false)))
                
                NavigationLink("20 rows 12 columns",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 20, column: 12, containLeadingAccessory: false, containTrailingAccessory: false, containIndex: true, isHeaderSticky: true, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false), addRowsDuringScrolling: true))
                
                NavigationLink("300 rows 60 columns",
                               destination: DataTableExampleView(model: TestRowData.generateData(row: 300, column: 60, containIndex: true, isHeaderSticky: true, isFirstColumnSticky: true, isPinchZoomEnable: true, showListView: false)))
            }
        }
    }
}

let row0 = TableRowItem(leadingAccessories: [accBtn], trailingAccessory: accBtn, data: [DataTextItem("Need Attention", Font.largeTitle.bold().italic())])

let row1 = TableRowItem(data: [DataTextItem("Need Attention", Font.subheadline.weight(.medium), Color.preferredColor(.criticalLabel)), DataTextItem("Yesterday", Font.caption, Color.preferredColor(.tertiaryLabel))])
let row2 = TableRowItem(data: [DataTextItem("Stable", Font.subheadline), DataTextItem("Jul 5, 2021", Font.caption, Color.preferredColor(.tertiaryLabel))])
let row3 = TableRowItem(data: [DataTextItem("Need Attention", Font.subheadline), DataTextItem("Jul 4, 2021", Font.caption, Color.preferredColor(.tertiaryLabel))])
let threeRowTwoColumn = TableModel(headerData: nil, rowData: [row1, row2, row3], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [], isPinchZoomEnable: true, showListView: false)

let tableCard1 = TableModel(headerData: nil, rowData: [row1, row2, row3], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [ColumnAttribute(textAlignment: .leading, width: .flexible), ColumnAttribute(textAlignment: .trailing, width: .infinity)], isPinchZoomEnable: false, showListView: false)
let tableCard2 = TableModel(headerData: nil, rowData: [row1, row2, row3, row2, row3, row3], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [ColumnAttribute(textAlignment: .leading, width: .flexible), ColumnAttribute(textAlignment: .trailing, width: .infinity)], isPinchZoomEnable: false, showListView: false)

let accIcon = AccessoryItem.icon(Image(systemName: "arrow.triangle.2.circlepath"))

let accBtn = AccessoryItem.button(AccessoryButton(image: Image(systemName: "square.and.arrow.up"),
                                                  title: "Share",
                                                  action: {
                                                      print("Tapped the leading accessory button")
                                                  }))

let row1Linelimit = TableRowItem(data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 1 line limit", lineLimit: 1), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 1 line limit", lineLimit: 1)])
let row2Linelimit = TableRowItem(data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 2 lines limit", lineLimit: 2), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 2 line2 limit", lineLimit: 2)])
let row3Linelimit = TableRowItem(data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 3 lines limit", lineLimit: 3), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 3 lines limit", lineLimit: 3)])
let row4Linelimit = TableRowItem(data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - no line limit", Font.system(size: 48, weight: .bold, design: .rounded), Color.orange), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - no line limit", Font.system(size: 52, weight: .heavy, design: .monospaced))])
let linelimit = TableModel(headerData: nil, rowData: [row1Linelimit, row2Linelimit, row3Linelimit, row4Linelimit], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [], isPinchZoomEnable: true, showListView: false)

let row1Linelimit2 = TableRowItem(data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 1 line limit", Font.footnote, Color.green, lineLimit: 1), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 1 line limit", Font.caption, Color.red, lineLimit: 1)])
let row2Linelimit2 = TableRowItem(data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 2 lines limit", Font.body, Color.orange, lineLimit: 2), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 2 line2 limit", Font.callout, Color.green, lineLimit: 2)])
let row3Linelimit2 = TableRowItem(data: [DataTextItem("Need Attention Need Attention Need Attention Need Attention Need Attention - 3 lines limit", Font.title, Color.red, lineLimit: 3), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - 3 lines limit", Font.headline, Color.orange, lineLimit: 3)])
let row4Linelimit2 = TableRowItem(data: [DataTextItem("No line limit", Font.largeTitle, Color.orange), DataTextItem("Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday Yesterday - no line limit", Font.footnote, Color.blue)])
let linelimit2 = TableModel(headerData: nil, rowData: [row1Linelimit2, row2Linelimit2, row3Linelimit2, row4Linelimit2], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [], rowAlignment: .baseline, isPinchZoomEnable: true, showListView: false)

let row1WithAccs = TableRowItem(leadingAccessories: [accBtn], trailingAccessory: accIcon, data: [DataTextItem("Need Attention"), DataTextItem("Yesterday")])
let row2WithAccs = TableRowItem(leadingAccessories: [accIcon], trailingAccessory: nil, data: [DataTextItem("Stable"), DataTextItem("Jul 5, 2021")])
let row3WithAccs = TableRowItem(leadingAccessories: [accIcon, accBtn, accBtn], trailingAccessory: accBtn, data: [DataTextItem("Need Attention"), DataTextItem("Jul 4, 2021")])
let threeRowTwoColumnWithAcc = TableModel(headerData: nil, rowData: [row1WithAccs, row2WithAccs, row3WithAccs], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [], isPinchZoomEnable: true, showListView: false)

let row1WithAlignment = TableRowItem(data: [DataTextItem("Leading", Font.fiori(forTextStyle: .title1)), DataTextItem("C"), DataImageItem(Image("wheel"))])
let row2WithAlignment = TableRowItem(data: [DataTextItem("Leading", Font.title), DataImageItem(Image("wheel")), DataTextItem("Trailing Trailing")])
let row3WithAlignment = TableRowItem(data: [DataImageItem(Image("wheel")), DataTextItem("Center Center"), DataTextItem("Trailing Trailing Trailing Trailing Trailing Trailing Trailing Trailing Trailing Trailing end", Font.fioriCondensed(forTextStyle: .title1))])

let row1WithDate = TableRowItem(data: [DataTextItem("Hello", Font.headline, Color.orange), DataImageItem(Image("wheel")), DataDateItem(Date(timeIntervalSince1970: 1), Font.largeTitle, Color.preferredColor(.chart2)), DataTimeItem(Date(timeIntervalSince1970: 1), Font.headline, Color.purple), DataDurationItem(3000, Font.footnote, Color.preferredColor(.secondaryLabel)), DataListItem("San Jose")])
let row2WithDate = TableRowItem(data: [DataImageItem(Image("wheel")), DataTextItem("World"), DataDateItem(Date(timeIntervalSinceReferenceDate: 1), Font.title2), DataTimeItem(Date(timeIntervalSinceReferenceDate: 1000)), DataDurationItem(23000), DataListItem("New York", Font.headline)])
let row3WithDate = TableRowItem(data: [DataTextItem("Leading", Font.largeTitle, Color.purple), DataImageItem(Image("wheel")), DataDateItem(Date(), Font.headline), DataTimeItem(Date()), DataDurationItem(12002), DataListItem("Los Angeles", Font.title3, Color.pink)])

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

let threeRowThreeColumnWithDates = TableModel(headerData: nil,
                                              rowData: [row1WithDate, row2WithDate, row3WithDate],
                                              isHeaderSticky: false,
                                              isFirstColumnSticky: false,
                                              columnAttributes: [ColumnAttribute(textAlignment: .leading, width: .infinity),
                                                                 ColumnAttribute(textAlignment: .center, width: .fixed(80)),
                                                                 ColumnAttribute(textAlignment: .leading, width: .flexible),
                                                                 ColumnAttribute(textAlignment: .center, width: .flexible),
                                                                 ColumnAttribute(textAlignment: .leading, width: .flexible),
                                                                 ColumnAttribute(textAlignment: .trailing, width: .flexible)],
                                              isPinchZoomEnable: true, showListView: false)

let oneColumn = TableModel(headerData: nil, rowData: [row0], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [ColumnAttribute(textAlignment: .leading, width: .flexible)], isPinchZoomEnable: true, showListView: false)
let oneColumnWithInfinityWidth = TableModel(headerData: nil, rowData: [row0], isHeaderSticky: false, isFirstColumnSticky: false, columnAttributes: [ColumnAttribute(textAlignment: .trailing, width: .infinity)], isPinchZoomEnable: true, showListView: false)

let oneColumnTwoColumnThreeColumn = TableModel(headerData: nil, rowData: [row0, row1, row1WithAlignment], isHeaderSticky: false, isFirstColumnSticky: false, isPinchZoomEnable: true, showListView: false)

public enum TestRowData {
    static let types = ["Image", "Text", "Date", "Time", "Duration", "ListItem"]
    static let imageNames = ["sun.min", "cloud.sleet", "cloud.snow", "tornado", "snowflake", "cloud.sun.bolt", "moon"]
    static let fonts = [Font.callout, Font.body, Font.footnote]
    static let colors = [Color.purple, Color.green, Color.indigo, Color.orange, Color.preferredColor(.primaryLabel)]
    static let cities = ["Aberdeen", "Anchorage", "Arvada", "Arvada", "Bakersfield", "Birmingham", "Davenport", "Duluth", "Elkhart", "Hollywood", "Indianapolis", "Knoxville", "Laredo", "San Jose", "New York", "Los Angeles", "Las Vegas", "Tokyo", "Chicago", "Houston", "Phoenix", "Philadelphia", "San Antonio", "Dallas", "Rancho Cucamonga", "Vancouver"]
    
    static func generateRowData(numOfColumns: Int, rowIndex: Int, containLeadingAccessory: Bool = true, containTrailingAccessory: Bool = true, containIndex: Bool = false, newRowHint: Bool = false) -> TableRowItem {
        var data: [DataItem] = []
        for i in 0 ..< numOfColumns {
            let dataType = i % DataItemType.allCases.count
            let font = self.fonts[(i + rowIndex) % self.fonts.count]
            let color = self.colors[(i + rowIndex) % self.colors.count]
            
            switch dataType {
            case 0:
                let imageItem = DataImageItem(Image(systemName: imageNames[(rowIndex + i) % self.imageNames.count]), color)
                data.append(imageItem)
            case 1:
                var textString = ""
                if rowIndex < 20 {
                    textString = "Aliquam erat volutpat."
                } else if rowIndex < 40 {
                    textString = "Aliquam erat volutpat. One"
                } else if rowIndex < 60 {
                    textString = "Aliquam erat volutpat. One more."
                } else {
                    textString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis tristique pretium."
                }
                let finalText = containIndex ? "(\(rowIndex), \(i)): " + textString : textString
                let textItem = DataTextItem(newRowHint ? "New column" : finalText, font, color)
                data.append(textItem)
            case 2:
                let ti = rowIndex * 3600 * 24 + (i + 4) * 3600
                let dateItem = DataDateItem(Date(timeIntervalSinceReferenceDate: TimeInterval(ti)), font, color)
                data.append(dateItem)
            case 3:
                let ti = rowIndex * 3600 + i * 60
                let timeItem = DataTimeItem(Date(timeIntervalSinceReferenceDate: TimeInterval(ti)), font, color)
                data.append(timeItem)
            case 4:
                let durationItem = DataDurationItem(TimeInterval(3600 + rowIndex * 600 + i), font, color)
                data.append(durationItem)
            default:
                let listItem = DataListItem(cities[(rowIndex + i) % self.cities.count], font, color)
                data.append(listItem)
            }
        }
        
        let lAccessories: [AccessoryItem] = [.icon(Image(systemName: "arrow.triangle.2.circlepath"))]
        let tAccessory: AccessoryItem = .button(.init(image: Image(systemName: "cart.badge.plus"), title: "", action: {
            print("trailing accessory tapped: \(rowIndex) tapped")
        }))
        
        let output = TableRowItem(leadingAccessories: containLeadingAccessory ? lAccessories : [], trailingAccessory: containTrailingAccessory ? tAccessory : nil, data: data)
        
        return output
    }
    
    static func generateNewRow(column: Int) -> TableRowItem {
        var data: [DataItem] = []
        for _ in 0 ..< column {
            let textItem = DataTextItem("New item was added", lineLimit: 2)
            data.append(textItem)
        }
        return TableRowItem(data: data)
    }
    
    static func generateColumnAttributes(column: Int) -> [ColumnAttribute] {
        var output: [ColumnAttribute] = []
        for _ in 0 ..< column {
            let att = ColumnAttribute(textAlignment: .leading, width: .flexible)
            output.append(att)
        }
        return output
    }
    
    static func generateData(row: Int, column: Int, containLeadingAccessory: Bool = true, containTrailingAccessory: Bool = true, containIndex: Bool = false, isHeaderSticky: Bool = true, isFirstColumnSticky: Bool = true, isPinchZoomEnable: Bool = true, showListView: Bool = false) -> TableModel {
        var res: [TableRowItem] = []
        var titles: [DataTextItem] = []
        for k in 0 ..< column {
            titles.append(DataTextItem(self.types[k % self.types.count]))
        }
        for i in 0 ..< row {
            res.append(self.generateRowData(numOfColumns: column, rowIndex: i, containLeadingAccessory: containLeadingAccessory, containTrailingAccessory: containTrailingAccessory, containIndex: containIndex))
        }
        let header = TableRowItem(data: titles)
        let model = TableModel(headerData: header, rowData: res, isHeaderSticky: isHeaderSticky, isFirstColumnSticky: isFirstColumnSticky, isPinchZoomEnable: isPinchZoomEnable, showListView: showListView)
        model.columnAttributes = self.generateColumnAttributes(column: column)
        model.didSelectRowAt = { rowIndex in
            print("Tapped row \(rowIndex)")
        }
        model.selectedIndexes = [0]
        
        return model
    }
}

public struct DataTableExampleView: View {
    let model: TableModel
    let addRowsDuringScrolling: Bool
    @State var editMode: TableModel.EditMode = .none
    
    public init(model: TableModel, addRowsDuringScrolling: Bool = false) {
        self.model = model
        self.addRowsDuringScrolling = addRowsDuringScrolling
        
        /// set a closure to check whether a dataItem located at (rowIndex, columnIndex) is valid; If it is valid, returns (true, nil); if it is not valid, returns false and an error message which is shown to users.
        model.validateDataItem = { _, columnIndex, dataItem in
            if let item = dataItem as? DataTextItem {
                if columnIndex == 0, item.text.count > 40 {
                    return (false, "Text length should not be greater than 40.")
                } else if item.text.count > 120 {
                    return (false, "Text length should not be greater than 120.")
                }
            } else if let item = dataItem as? DataDateItem {
                let refDate = Date(timeIntervalSinceReferenceDate: 0)
                if item.date <= refDate {
                    let df = DateFormatter()
                    df.dateStyle = .medium
                    df.timeStyle = .none
                    
                    return (false, "The date must be later than \(df.string(from: refDate))")
                }
            } else if let item = dataItem as? DataTimeItem {
                let hour = Calendar.current.component(.hour, from: item.date)
                if hour < 2 {
                    let df = DateFormatter()
                    df.dateStyle = .none
                    df.timeStyle = .short
                                        
                    return (false, "The time must be later than 2am")
                }
            } else if let item = dataItem as? DataDurationItem {
                if item.duration <= 3600 {
                    return (false, "Duration must be greater than one hour")
                }
            }
            
            return (true, nil)
        }
        
        /// set a closure to provide a `DataListItem` type dataItem located at (rowIndex, columnIndex) for an array of Strings and a title for inline editing mode
        model.listItemDataAndTitle = { rowIndex, _ in
            if rowIndex < 1 {
                return (Array(TestRowData.cities.prefix(6)), "Select a city")
            } else {
                return (TestRowData.cities, "Select a city")
            }
        }
        
        /// set a closure to observe a value change for inline editing mode
        model.valueDidChange = { change in
            print("valueDidChange: \(change.description)")
        }
        
        /// add new rows when scrolling to the end of the DataTable
        if addRowsDuringScrolling {
            // here only indexOfRows is what we need
            model.didScroll = { _, indexOfRows, _ in
                if let lastRowIndex = indexOfRows.last, lastRowIndex + 6 > model.rowData.count {
                    // generate new rows
                    var newRows = [TableRowItem]()
                    let numOfColumns = model.rowData.first?.data.count ?? 1
                    let startRowIndex = model.rowData.count
                    for i in 0 ..< 20 {
                        let row = TestRowData.generateRowData(numOfColumns: numOfColumns, rowIndex: startRowIndex + i, containIndex: true)
                        newRows.append(row)
                    }
                    
                    // append new rows to the end of DataTable
                    model.rowData.append(contentsOf: newRows)
                }
            }
        }
    }
    
    public var body: some View {
        DataTable(model: self.model)
            .padding([.leading, .trailing])
            .navigationBarTitle("Data Table")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if self.editMode == .none {
                        Button(action: {
                            let numOfColumn: Int = self.model.rowData.first?.data.count ?? 0
                            self.model.rowData.insert(TestRowData.generateRowData(numOfColumns: numOfColumn, rowIndex: 0, newRowHint: true), at: 0)
                        }) {
                            Image(systemName: "plus")
                        }
                        
                        Button("Edit") {
                            self.editMode = .inline
                            self.model.editMode = .inline
                        }
                        Button("Select") {
                            self.editMode = .select
                            self.model.editMode = .select
                        }
                    } else {
                        if self.editMode == .select {
                            Button(action: {
                                self.model.selectedIndexes = []
                                let numOfColumn: Int = self.model.rowData.first?.data.count ?? 0
                                self.model.rowData.insert(TestRowData.generateRowData(numOfColumns: numOfColumn, rowIndex: 0, newRowHint: true), at: 0)
                            }) {
                                Image(systemName: "plus")
                            }
                            
                            Button("Delete") {
                                let indexSet = IndexSet(self.model.selectedIndexes)
                                print("remove indexset: \(indexSet)")
                                self.model.rowData.remove(atOffsets: indexSet)
                                self.model.selectedIndexes = []
                            }
                        }
                        if self.editMode == .inline {
                            Button("Cancel") {
                                _ = self.model.onSave(false)
                                
                                self.editMode = .none
                                self.model.editMode = .none
                            }
                        }
                        
                        Button("Done") {
                            if self.model.editMode == .inline {
                                let changes = self.model.onSave(true)
                                print("Model changes:")
                                for change in changes {
                                    print("\(change.description)")
                                }
                            }
                            
                            self.editMode = .none
                            self.model.editMode = .none
                        }
                    }
                }
            }
    }
}

struct DataTableExamplePreview: PreviewProvider {
    static var previews: some View {
        FontConversionView()
    }
}
