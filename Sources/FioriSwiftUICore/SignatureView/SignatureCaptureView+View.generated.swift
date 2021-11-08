/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
 import SwiftUI
 import Combine

 // FIXME: - Implement Fiori style definitions

 extension Fiori {
     enum SignatureCaptureView {
         typealias StartAction = EmptyModifier
         typealias StartActionCumulative = EmptyModifier
 		typealias RestartAction = EmptyModifier
         typealias RestartActionCumulative = EmptyModifier
 		typealias CancelAction = EmptyModifier
         typealias CancelActionCumulative = EmptyModifier
 		typealias ClearAction = EmptyModifier
         typealias ClearActionCumulative = EmptyModifier
 		typealias SaveAction = EmptyModifier
         typealias SaveActionCumulative = EmptyModifier

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
         static let startAction = StartAction()
 		static let restartAction = RestartAction()
 		static let cancelAction = CancelAction()
 		static let clearAction = ClearAction()
 		static let saveAction = SaveAction()
         static let startActionCumulative = StartActionCumulative()
 		static let restartActionCumulative = RestartActionCumulative()
 		static let cancelActionCumulative = CancelActionCumulative()
 		static let clearActionCumulative = ClearActionCumulative()
 		static let saveActionCumulative = SaveActionCumulative()
     }
 }

 // FIXME: - Implement SignatureCaptureView View body

 extension SignatureCaptureView: View {
     public var body: some View {
         <# View body #>
     }
 }

 // FIXME: - Implement SignatureCaptureView specific LibraryContentProvider

 @available(iOS 14.0, macOS 11.0, *)
 struct SignatureCaptureViewLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(SignatureCaptureView(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */
