import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum TimelineItem {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
        typealias Footnote = EmptyModifier
        typealias FootnoteCumulative = EmptyModifier
        typealias Attribute = EmptyModifier
        typealias AttributeCumulative = EmptyModifier
        typealias SecondaryAttribute = EmptyModifier
        typealias SecondaryAttributeCumulative = EmptyModifier
        typealias Timestamp = EmptyModifier
        typealias TimestampCumulative = EmptyModifier
        typealias SecondaryTimestamp = EmptyModifier
        typealias SecondaryTimestampCumulative = EmptyModifier
        typealias Status = EmptyModifier
        typealias StatusCumulative = EmptyModifier
        typealias Substatus = EmptyModifier
        typealias SubstatusCumulative = EmptyModifier

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
        static let titleCumulative = TitleCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let footnoteCumulative = FootnoteCumulative()
        static let attributeCumulative = AttributeCumulative()
        static let secondaryAttributeCumulative = SecondaryAttributeCumulative()
        static let timestampCumulative = TimestampCumulative()
        static let secondaryTimestampCumulative = SecondaryTimestampCumulative()
        static let statusCumulative = StatusCumulative()
        static let substatusCumulative = SubstatusCumulative()
    }
}

// TODO: - Implement TimelineItem View body

extension TimelineItem: View {
    public var body: some View {
        preconditionFailure()
    }
}
