import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum ObjectHeader {
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

// TODO: - Implement ObjectHeader View body

extension ObjectHeader: View {
    public var body: some View {
        VStack {
            title
            subtitle
            footnote
            descriptionText
            status
            substatus
            detailImage
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
