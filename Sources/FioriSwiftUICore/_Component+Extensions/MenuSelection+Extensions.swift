import Foundation
import SwiftUI

public extension MenuSelection {
    init(action: FioriButton? = nil,
         isExpanded: Binding<Bool>,
         items: [MenuSelectionItemProtocol] = [],
         actionHandler: @escaping (MenuSelectionItemProtocol) -> Void)
    {
        self.init(action: { action }, isExpanded: isExpanded, items: { _MenuSelectionContainer(items, actionHandler: actionHandler) })
    }
}

struct _MenuSelectionContainer: View {
    let items: [MenuSelectionItemProtocol]
    let actionHandler: ((MenuSelectionItemProtocol) -> Void)?
    
    init(_ items: [MenuSelectionItemProtocol],
         actionHandler: ((MenuSelectionItemProtocol) -> Void)? = nil)
    {
        self.items = items
        self.actionHandler = actionHandler
    }
    
    var body: some View {
        ForEach(self.items.indices, id: \.self) {
            let item = self.items[$0]
            MenuSelectionItem(model: item) {
                self.actionHandler?(item)
            }
        }
    }
}
