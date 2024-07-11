import Foundation
import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum KeyValueItem {
        typealias KeyCumulative = EmptyModifier
        typealias ValueCumulative = EmptyModifier
        
        struct Key: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .subheadline).weight(.semibold))
                    .foregroundColor(.preferredColor(.primaryLabel))
            }
        }
        
        struct Value: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.trailing)
            }
        }

        static let key = Key()
        static let value = Value()
        static let keyCumulative = KeyCumulative()
        static let valueCumulative = ValueCumulative()
    }
}

// TODO: - Implement KeyValueItem View body

extension KeyValueItem: View {
    public var body: some View {
        VStack(alignment: .leading) {
            if _axis == .horizontal {
                HStack {
                    key
                    Spacer()
                    value
                }
                .frame(maxWidth: .infinity)
            } else {
                key
                    .padding(.bottom, 3)
                value
            }
        }
    }
}
