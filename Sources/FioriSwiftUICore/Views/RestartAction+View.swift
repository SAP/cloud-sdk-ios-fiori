/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

// FIXME: - Implement RestartAction View body

extension RestartAction: View {
    public var body: some View {
        Button(action: self._didSelectRestartAction ?? {}) {
            Text(self._restartActionText ?? "")
        }
    }
}

// FIXME: - Implement RestartAction specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct RestartActionLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(RestartAction(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
