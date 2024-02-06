import Foundation
import SwiftUI

protocol ListDataProtocol {
    init(cellTapped: Binding<Bool>)
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
    func titleForHeaderInSection(_ section: Int) -> String
    func cellForRow(_ indexPath: IndexPath) -> AnyView
    func containAccessoryView(_ indexPath: IndexPath) -> Bool
}

protocol ObjectItemListDataProtocol: ListDataProtocol {
    var isNewObjectItem: Bool { get set }
    init(cellTapped: Binding<Bool>, isNewObjectItem: Bool)
}

extension ObjectItemListDataProtocol {
    init(cellTapped: Binding<Bool>, isNewObjectItem: Bool) {
        self.init(cellTapped: cellTapped)
        self.isNewObjectItem = isNewObjectItem
    }
}
