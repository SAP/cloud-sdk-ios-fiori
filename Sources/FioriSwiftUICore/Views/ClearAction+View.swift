/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

// FIXME: - Implement ClearAction View body

extension ClearAction: View {
    public var body: some View {
        Button(action: self._didSelectClearAction ?? {}) {
            Text(self._clearActionText ?? "")
        }
    }
}

// FIXME: - Implement ClearAction specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct ClearActionLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(ClearAction(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
