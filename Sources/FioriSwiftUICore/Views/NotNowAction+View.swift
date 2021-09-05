import SwiftUI

// FIXME: - Implement Fiori style definitions

// FIXME: - Implement NotNowAction View body

extension NotNowAction: View {
    public var body: some View {
        Button(action: self._didSelectNotNowAction ?? {}) {
            Text(self._notNowActionText ?? "")
        }
    }
}

public struct _NotNowActionDefaultModel: NotNowActionModel {
    public var notNowActionText: String? {
        NSLocalizedString("Not Now", comment: "")
    }
    
    public init() {}
}

// FIXME: - Implement NotNowAction specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct NotNowActionLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(NotNowAction(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
