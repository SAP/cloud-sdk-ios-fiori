import Foundation
import SwiftUI

class TableDataManager: ObservableObject {
    @Published var selectedIndexes: [Int] = []

    init(selectedIndexes: [Int]) {
        self._selectedIndexes = Published(initialValue: selectedIndexes)
    }
}
