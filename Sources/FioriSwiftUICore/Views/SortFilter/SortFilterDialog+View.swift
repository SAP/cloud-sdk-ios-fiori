/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
 import SwiftUI

 // FIXME: - Implement Fiori style definitions

 extension Fiori {
     enum SortFilterDialog {
         typealias Item = EmptyModifier
         typealias ItemCumulative = EmptyModifier
 		typealias CancelAction = EmptyModifier
         typealias CancelActionCumulative = EmptyModifier
 		typealias ResetAction = EmptyModifier
         typealias ResetActionCumulative = EmptyModifier
 		typealias ApplyAction = EmptyModifier
         typealias ApplyActionCumulative = EmptyModifier

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
         static let item = Item()
 		static let cancelAction = CancelAction()
 		static let resetAction = ResetAction()
 		static let applyAction = ApplyAction()
         static let itemCumulative = ItemCumulative()
 		static let cancelActionCumulative = CancelActionCumulative()
 		static let resetActionCumulative = ResetActionCumulative()
 		static let applyActionCumulative = ApplyActionCumulative()
     }
 }

 // FIXME: - Implement SortFilterDialog View body

 extension SortFilterDialog: View {
     public var body: some View {
         <# View body #>
     }
 }

 // FIXME: - Implement SortFilterDialog specific LibraryContentProvider

 @available(iOS 14.0, macOS 11.0, *)
 struct SortFilterDialogLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(SortFilterDialog(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */
