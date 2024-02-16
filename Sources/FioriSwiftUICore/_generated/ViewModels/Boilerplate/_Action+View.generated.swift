/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
 import SwiftUI

 // FIXME: - Implement Fiori style definitions

 // FIXME: - Implement Action View body

 extension Action: View {
     public var body: some View {
         <# View body #>
     }
 }

 // FIXME: - Implement Action specific LibraryContentProvider

 @available(iOS 14.0, macOS 11.0, *)
 struct ActionLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(Action(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */
