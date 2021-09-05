import SwiftUI

// FIXME: - Implement Fiori style definitions

// FIXME: - Implement NextAction View body

extension NextAction: View {
    public var body: some View {
        Button(action: self._didSelectNextAction ?? {}) {
            Text(self._nextActionText ?? "")
        }
    }
}

public struct _NextActionDefaultModel: NextActionModel {
    public var nextActionText: String? {
        NSLocalizedString("Next", comment: "")
    }
    
    public init() {}
}

// FIXME: - Implement NextAction specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct NextActionLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(NextAction(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
