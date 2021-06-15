/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

// FIXME: - Implement SaveAction View body

extension SaveAction: View {
    public var body: some View {
        Button(action: self._didSelectSaveAction ?? {}) {
            Text(self._saveActionText ?? "")
        }
    }
}

// FIXME: - Implement SaveAction specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct SaveActionLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(SaveAction(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
