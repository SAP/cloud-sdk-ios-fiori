import Foundation
import SwiftUI

public extension MenuSelection {
    init(action: FioriButton? = nil,
         isExpanded: Binding<Bool>,
         items: [MenuSelectionItemProtocol] = [],
         actionHandler: @escaping (MenuSelectionItemProtocol) -> Void)
    {
        self.init(action: { action }, isExpanded: isExpanded) {
            items.map { item in
                MenuSelectionItem(model: item) {
                    actionHandler(item)
                }
            }
        }
    }
}
