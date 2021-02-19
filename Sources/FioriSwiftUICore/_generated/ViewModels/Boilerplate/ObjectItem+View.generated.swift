/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
 import SwiftUI

 // FIXME: - Implement Fiori style definitions

 extension Fiori {
     enum ObjectItem {
         typealias Title = EmptyModifier
 		typealias Subtitle = EmptyModifier
 		typealias Footnote = EmptyModifier
 		typealias DescriptionText = EmptyModifier
 		typealias Status = EmptyModifier
 		typealias Substatus = EmptyModifier
 		typealias DetailImage = EmptyModifier

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
         static let title = Title()
 		static let subtitle = Subtitle()
 		static let footnote = Footnote()
 		static let descriptionText = DescriptionText()
 		static let status = Status()
 		static let substatus = Substatus()
 		static let detailImage = DetailImage()
     }
 }

 // FIXME: - Implement ObjectItem View body

 extension ObjectItem: View {
     public var body: some View {
         <# View body #>
     }
 }
 */
