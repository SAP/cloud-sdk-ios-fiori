/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum AlertConfiguration {
        typealias AlertTitle = EmptyModifier
        typealias AlertTitleCumulative = EmptyModifier
        typealias AlertMessage = EmptyModifier
        typealias AlertMessageCumulative = EmptyModifier
        typealias ActionText = EmptyModifier
        typealias ActionTextCumulative = EmptyModifier
        typealias SecondaryActionText = EmptyModifier
        typealias SecondaryActionTextCumulative = EmptyModifier

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
        static let alertTitle = AlertTitle()
        static let alertMessage = AlertMessage()
        static let actionText = ActionText()
        static let secondaryActionText = SecondaryActionText()
        static let alertTitleCumulative = AlertTitleCumulative()
        static let alertMessageCumulative = AlertMessageCumulative()
        static let actionTextCumulative = ActionTextCumulative()
        static let secondaryActionTextCumulative = SecondaryActionTextCumulative()
    }
}

// FIXME: - Implement AlertConfiguration View body

// extension AlertConfiguration: View {
//    public var body: some View {
//        EmptyView()
//    }
// }
//
// public protocol AlertConfigurationProtocol {
//    associatedtype AlertMessage: View
//    associatedtype ActionText: View
//    associatedtype SecondaryActionText: View
//
//    var alertTitle: Text { get }
//    var alertMessageView: AlertMessage { get }
//    var actionView: ActionText { get }
//    var secondaryActionView: SecondaryActionText { get }
// }
//
// extension AlertConfiguration: AlertConfigurationProtocol {
//    public var alertTitle: Text {
//        return _alertTitle
//    }
//
//    public var alertMessageView: some View {
//        alertMessage
//    }
//
//    public var actionView: some View {
//        actionText
//    }
//
//    public var secondaryActionView: some View {
//        secondaryActionText
//    }
// }

//// FIXME: - Implement AlertConfiguration specific LibraryContentProvider
//
// @available(iOS 14.0, *)
// struct AlertConfigurationLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(AlertConfiguration(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
