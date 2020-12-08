import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum TimelineItem {
        typealias Title = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias Footnote = EmptyModifier
        typealias Attribute = EmptyModifier
        typealias SecondaryAttribute = EmptyModifier
        typealias Timestamp = EmptyModifier
        typealias SecondaryTimestamp = EmptyModifier
        typealias Status = EmptyModifier
        typealias Substatus = EmptyModifier

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
        static let attribute = Attribute()
        static let secondaryAttribute = SecondaryAttribute()
        static let timestamp = Timestamp()
        static let secondaryTimestamp = SecondaryTimestamp()
        static let status = Status()
        static let substatus = Substatus()
    }
}

// TODO: - Implement TimelineItem View body

extension TimelineItem: View {
    public var body: some View {
        preconditionFailure()
    }
}
