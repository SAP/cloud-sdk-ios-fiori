import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum TimelineGridItem {
        typealias Title = EmptyModifier
        typealias Timestamp = EmptyModifier
        typealias Status = EmptyModifier

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
        static let timestamp = Timestamp()
        static let status = Status()
    }
}

// TODO: - Implement TimelineItem View body

extension TimelineGridItem: View {
    public var body: some View {
        VStack(spacing: 8) {
            title
            HStack {
                timestamp
                Spacer()
                status
                    .multilineTextAlignment(.trailing)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
