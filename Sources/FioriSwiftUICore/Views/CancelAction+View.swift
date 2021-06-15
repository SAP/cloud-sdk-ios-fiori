/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

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

// FIXME: - Implement CancelAction specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct CancelActionLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(CancelAction(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
