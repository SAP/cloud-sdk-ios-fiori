import Foundation
import SwiftUI

public enum TestRowData {
    public static let model = TableModel(
        headerTitles: ["0, 0", "1, 0", "2, 0", "3, 0", "4, 0"],
        titlesForColumn: ["0, 0", "1", "2", "3", "4"],
        data: [[DataTextItem("0, 1"), DataTextItem("0, 2"), DataTextItem("0, 3"), DataTextItem("0, 4"), DataTextItem("0, 1"), DataTextItem("0, 2"), DataTextItem("0, 3"), DataTextItem("0, 4"), DataTextItem("0, 1"), DataTextItem("0, 2"), DataTextItem("0, 3"), DataTextItem("0, 4")],
               [DataTextItem("1, 1"), DataTextItem("1, 2"), DataTextItem("1, 3"), DataTextItem("1, 4")],
               [DataTextItem("2, 1"), DataTextItem("2, 2"), DataTextItem("2, 3"), DataTextItem("2, 4")],
               [DataTextItem("3, 1"), DataTextItem("3, 2"), DataTextItem("3, 3"), DataTextItem("3, 4")]], scaleX: 1, scaleY: 1
    )
    
    static func generateData(row: Int, column: Int) -> TableModel {
        var res: [[DataItem]] = []
        var titles: [String] = []
        for k in 0 ..< column {
            titles.append("LongHeaderTitle: \(k)")
        }
        for i in 0 ..< row {
            res.append([])
            for j in 0 ..< column {
//                if j == 0 {
//                    let image = Image("placeholder")
//                    res[i].append(DataImageItem(image))
//                }
                let headerText: String = j == 2 ? "" : ""
//                let longText: String = j == 0 ? "this is a long text " : ""
                let longText: String = "this is a long long long text "
                res[i].append(DataTextItem("\(longText)\(headerText)\(i), \(j)"))
            }
        }
        return TableModel(headerTitles: titles, titlesForColumn: nil, centerPosition: nil, data: res, scaleX: 1, scaleY: 1, isFirstRowSticky: true, isFirstColumnSticky: true, showListView: false)
    }
}

struct TestTableView: View {
    @ObservedObject var model: TableModel = TestRowData.generateData(row: 30, column: 12)
    
    var body: some View {
        NavigationView {
            TableDataView()
                .environmentObject(model)
                .environment(\.tableContext, DefaultTableContext())
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                .frame(minWidth: 300, idealWidth: UIScreen.main.bounds.width, maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, minHeight: 300, idealHeight: UIScreen.main.bounds.height, maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TestRowData_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            TableDataView()
                .environmentObject(TestRowData.generateData(row: 3, column: 12))
                .environment(\.tableContext, DefaultTableContext())
                .frame(width: 500, height: 500, alignment: .topLeading)
                .padding()
        }
    }
}
