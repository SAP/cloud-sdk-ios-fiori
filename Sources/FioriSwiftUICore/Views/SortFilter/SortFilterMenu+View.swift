import SwiftUI

extension Fiori {
    enum SortFilterMenu {
        typealias Items = EmptyModifier
        typealias ItemsCumulative = EmptyModifier
        typealias CancelAction = EmptyModifier
        typealias CancelActionCumulative = EmptyModifier
        typealias ResetAction = EmptyModifier
        typealias ResetActionCumulative = EmptyModifier
        typealias ApplyAction = EmptyModifier
        typealias ApplyActionCumulative = EmptyModifier

        static let items = Items()
        static let cancelAction = CancelAction()
        static let resetAction = ResetAction()
        static let applyAction = ApplyAction()
        static let itemsCumulative = ItemsCumulative()
        static let cancelActionCumulative = CancelActionCumulative()
        static let resetActionCumulative = ResetActionCumulative()
        static let applyActionCumulative = ApplyActionCumulative()
    }
}

extension SortFilterMenu: View {
    public var body: some View {
        items
            .onModelUpdateAppCallback(_onUpdate!)
//            .cancelActionView(_cancelAction)
//            .resetActionView(_resetAction)
//            .applyActionView(_applyAction)
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
