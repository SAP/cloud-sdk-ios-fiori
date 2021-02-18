// TODO: Copy commented code to new file: `FioriSwiftUICore/Views/KeyValueItem+View.swift`
// TODO: Implement default Fiori style definitions as `ViewModifier`
// TODO: Implement KeyValueItem `View` body

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
 import SwiftUI

 // FIXME: - Implement Fiori style definitions

 extension Fiori {
     enum KeyValueItem {
         typealias Key = EmptyModifier
 		typealias Value = EmptyModifier

         // TODO: - substitute type-specific ViewModifier for EmptyModifier
         /*
             // replace `typealias Subtitle = EmptyModifier` with:

             struct Subtitle: ViewModifier {
                 func body(content: Content) -> some View {
                     content
                         .font(.body)
                         .foregroundColor(.preferredColor(.primary3))
                 }
             }
         */
         static let key = Key()
 		static let value = Value()
     }
 }

 // FIXME: - Implement KeyValueItem View body

 extension KeyValueItem: View {
     public var body: some View {
         <# View body #>
     }
 }
 */
