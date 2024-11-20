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

protocol ObjectItemListDataEnhancementProtocol: ObjectItemListDataProtocol {
    var isShowAccessoryMenu: Binding<Bool> { get set }
    init(cellTapped: Binding<Bool>, isNewObjectItem: Bool, isShowAccessoryMenu: Binding<Bool>)
}

extension ObjectItemListDataEnhancementProtocol {
    init(cellTapped: Binding<Bool>, isNewObjectItem: Bool, isShowAccessoryMenu: Binding<Bool> = .constant(false)) {
        self.init(cellTapped: cellTapped)
        self.isNewObjectItem = isNewObjectItem
        self.isShowAccessoryMenu = isShowAccessoryMenu
    }
}
