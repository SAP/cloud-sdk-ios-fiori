import SwiftUI

public struct _WhatsNewListItemsContainer: View {
    var whatsNewListItems: [WhatsNewListItem]
    
    /// :nodoc:
    public init(_ whatsNewListItems: [WhatsNewListItem]) {
        self.whatsNewListItems = whatsNewListItems
    }

    // use `view(at index: Int)` to generate indexed views instead of this body.
    /// :nodoc:
    public var body: some View {
        EmptyView()
    }
}

extension _WhatsNewListItemsContainer: IndexedViewContainer {
    /// Count of indexed views.
    public var count: Int {
        self.whatsNewListItems.count
    }
    
    // use `view(at index: Int)` to generate indexed views instead of this body.
    /// :nodoc:
    public func view(at index: Int) -> some View {
        self.whatsNewListItems[index]
    }
}
