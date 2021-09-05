import SwiftUI

// FIXME: - Implement Fiori style definitions

// FIXME: - Implement CancelAction View body

extension CancelAction: View {
    public var body: some View {
        Button(action: self._didSelectCancelAction ?? {}) {
            Text(self._cancelActionText ?? "")
        }
    }
}

public struct _CancelActionDefaultModel: CancelActionModel {
    public var cancelActionText: String? {
        NSLocalizedString("Cancel", comment: "")
    }
    
    public init() {}
}

// FIXME: - Implement CancelAction specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct CancelActionLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(CancelAction(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
