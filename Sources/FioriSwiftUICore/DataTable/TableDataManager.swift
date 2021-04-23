import Foundation
import SwiftUI

class TableDataManager: ObservableObject {
//    @ObservedObject var model: TableModel
    @Published var selectedIndexes: [Int] = []

    init(selectedIndexes: [Int]) {
        self._selectedIndexes = Published(initialValue: selectedIndexes)
    }
}
