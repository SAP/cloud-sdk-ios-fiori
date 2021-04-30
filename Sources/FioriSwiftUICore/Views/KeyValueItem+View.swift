import Foundation
import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum KeyValueItem {
        typealias Key = EmptyModifier
        typealias KeyCumulative = EmptyModifier
        typealias Value = EmptyModifier
        typealias ValueCumulative = EmptyModifier

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
        static let keyCumulative = KeyCumulative()
        static let valueCumulative = ValueCumulative()
    }
}

// TODO: - Implement KeyValueItem View body

extension KeyValueItem: View {
    public var body: some View {
        HStack {
            key
            Spacer()
            value
                .multilineTextAlignment(.trailing)
        }
        .frame(maxWidth: .infinity)
    }
}
