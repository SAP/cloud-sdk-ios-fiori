import SwiftUI

extension Fiori {
    enum SortFilterMenu {
        typealias Items = EmptyModifier
        typealias ItemsCumulative = EmptyModifier

        static let items = Items()
        static let itemsCumulative = ItemsCumulative()
    }
}

extension SortFilterMenu: View {
    public var body: some View {
        items
            .onModelUpdateAppCallback(_onUpdate!)
    }
}

/*
 // FIXME: - Implement SortFilterMenu specific LibraryContentProvider
 @available(iOS 14.0, macOS 11.0, *)
 struct SortFilterMenuLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(SortFilterMenu(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */
