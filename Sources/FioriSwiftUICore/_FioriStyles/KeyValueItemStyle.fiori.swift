import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KeyValueItemBaseStyle: KeyValueItemStyle {
    @Environment(\.isLoading) var isLoading
    public func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
        SkeletonLoadingContainer {
            CompactVStack(alignment: .leading) {
                switch configuration.axis {
                case .horizontal:
                    HStack(spacing: 0) {
                        configuration.key
                        Spacer()
                        configuration.value
                    }
                    .frame(maxWidth: .infinity)
                case .vertical:
                    configuration.key
                    configuration.value
                }
            }.accessibilityElement(children: .combine)
                .buttonStyle(.borderless)
        }
    }
}

// Default fiori styles
extension KeyValueItemFioriStyle {
    struct ContentFioriStyle: KeyValueItemStyle {
        func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
            KeyValueItem(configuration)
        }
    }

    public struct KeyFioriStyle: KeyStyle {
        @Environment(\.isLoading) var isLoading
        let keyValueItemConfiguration: KeyValueItemConfiguration

        public func makeBody(_ configuration: KeyConfiguration) -> some View {
            Key(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(.preferredColor(self.isLoading ? .separator : .primaryLabel))
        }
    }

    struct ValueFioriStyle: ValueStyle {
        @Environment(\.isLoading) var isLoading
        let keyValueItemConfiguration: KeyValueItemConfiguration

        func makeBody(_ configuration: ValueConfiguration) -> some View {
            Value(configuration)
                .font(.fiori(forTextStyle: .body))
                .foregroundColor(.preferredColor(self.isLoading ? .separator : .primaryLabel))
        }
    }

    struct FormViewFioriStyle: FormViewStyle {
        let keyValueItemConfiguration: KeyValueItemConfiguration

        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}
