import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum ActivityItems {
        typealias ActionItems = EmptyModifier

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
        static let actionItems = ActionItems()
    }
}

// FIXME: - Implement ActivityItems View body

extension ActivityItems: View {
    public var body: some View {
        ActivityControlLayoutContainer(_actionItems ?? []) { activity in
            ActivityButtonView(image: activity.icon) {
                if let actionHandler = _didSelectClosure {
                    actionHandler(activity)
                }
            }
        }
    }
}
