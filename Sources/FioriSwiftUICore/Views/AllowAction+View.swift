import SwiftUI

// FIXME: - Implement Fiori style definitions

// FIXME: - Implement AllowAction View body

extension AllowAction: View {
    public var body: some View {
        Button(action: self._didSelectAllowAction ?? {}) {
            Text(self._allowActionText ?? "")
        }
    }
}

public struct _AllowActionDefaultModel: AllowActionModel {
    public var allowActionText: String? {
        NSLocalizedString("Allow", comment: "")
    }
    
    public init() {}
}

// FIXME: - Implement AllowAction specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct AllowActionLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(AllowAction(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
