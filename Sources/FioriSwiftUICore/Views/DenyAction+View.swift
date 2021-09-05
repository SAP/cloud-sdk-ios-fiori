import SwiftUI

// FIXME: - Implement Fiori style definitions

// FIXME: - Implement DenyAction View body

extension DenyAction: View {
    public var body: some View {
        Button(action: self._didSelectDenyAction ?? {}) {
            Text(self._denyActionText ?? "")
        }
    }
}

public struct _DenyActionDefaultModel: DenyActionModel {
    public var denyActionText: String? {
        NSLocalizedString("Deny", comment: "")
    }
    
    public init() {}
}

// FIXME: - Implement DenyAction specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct DenyActionLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(DenyAction(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
