/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

// FIXME: - Implement StartAction View body

extension StartAction: View {
    public var body: some View {
        Button(action: self._didSelectStartAction ?? {}) {
            Text(self._startActionText ?? "")
        }
    }
}

// FIXME: - Implement StartAction specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct StartActionLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(StartAction(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
