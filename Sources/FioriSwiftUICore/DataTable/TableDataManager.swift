import Foundation
import SwiftUI

class TableDataManager: ObservableObject {
//    @ObservedObject var model: TableModel
    @Published var selectedIndexes: [Int] = []
    @Published var rowData: [TableRowItem] = []

    init(selectedIndexes: [Int], rowData: [TableRowItem]) {
        self._selectedIndexes = Published(initialValue: selectedIndexes)
        self._rowData = Published(initialValue: rowData)
    }
}
