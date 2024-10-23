import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ListPickerItemBaseStyle: ListPickerItemStyle {
    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        NavigationLink {
            configuration.destination
        } label: {
            switch configuration.axis {
            case .horizontal:
                HStack {
                    configuration.title
                    Spacer()
                    configuration.value
                }
            case .vertical:
                CompactVStack(alignment: .leading) {
                    configuration.title
                    configuration.value
                }
            }
        }
    }
}

// Default fiori styles
extension ListPickerItemFioriStyle {
    struct ContentFioriStyle: ListPickerItemStyle {
        func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
            ListPickerItem(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let listPickerItemConfiguration: ListPickerItemConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .subheadline, weight: .bold))
                .foregroundStyle(Color.preferredColor(.primaryLabel))
        }
    }

    struct ValueFioriStyle: ValueStyle {
        let listPickerItemConfiguration: ListPickerItemConfiguration

        func makeBody(_ configuration: ValueConfiguration) -> some View {
            Value(configuration)
                .font(.fiori(forTextStyle: .body, weight: .regular))
                .foregroundStyle(Color.preferredColor(.primaryLabel))
        }
    }
}
