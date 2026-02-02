import Combine
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ListPickerItemBaseStyle: ListPickerItemStyle {
    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        Group {
            if configuration.controlState == .readOnly {
                switch configuration.axis {
                case .horizontal:
                    self.horizontalLayout(configuration: configuration)
                case .vertical:
                    self.verticalLayout(configuration: configuration)
                }
            } else {
                NavigationLink(destination: configuration.destination) {
                    switch configuration.axis {
                    case .horizontal:
                        self.horizontalLayout(configuration: configuration)
                    case .vertical:
                        self.verticalLayout(configuration: configuration)
                    }
                }
            }
        }
    }
    
    @ViewBuilder func horizontalLayout(configuration: ListPickerItemConfiguration) -> some View {
        if configuration.controlState == .readOnly {
            CompactVStack(alignment: .leading) {
                HStack(spacing: 0) {
                    configuration.title
                    Spacer()
                    configuration.value
                }
                configuration.description
            }
        } else {
            HStack(spacing: 0) {
                configuration.title
                Spacer()
                configuration.value
            }
        }
    }
    
    @ViewBuilder func verticalLayout(configuration: ListPickerItemConfiguration) -> some View {
        if configuration.controlState == .readOnly {
            CompactVStack(alignment: .leading) {
                configuration.title
                configuration.value
                configuration.description
            }
        } else {
            CompactVStack(alignment: .leading) {
                configuration.title
                configuration.value
            }
        }
    }
}

// Default fiori styles
extension ListPickerItemFioriStyle {
    struct ContentFioriStyle: ListPickerItemStyle {
        func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
            ListPickerItem(configuration)
                .disabled(configuration.controlState == .disabled)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let listPickerItemConfiguration: ListPickerItemConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                .foregroundStyle(Color.preferredColor(self.listPickerItemConfiguration.controlState == .disabled ? .quaternaryLabel : .primaryLabel))
        }
    }

    struct ValueFioriStyle: ValueStyle {
        let listPickerItemConfiguration: ListPickerItemConfiguration
        // only used for empty value view
        @State var selections: Set<String> = Set()
        
        func makeBody(_ configuration: ValueConfiguration) -> some View {
            Group {
                if configuration.value.isEmpty {
                    Value(ValueConfiguration(value: ConfigurationViewWrapper(Text(self.selections.joined(separator: ", ")))))
                        .onReceive(NotificationCenter.default.publisher(for: Notification.Name.selectionsUpdatedNotification)) { notification in
                            if let selections = notification.object as? Set<String> {
                                self.selections = selections
                            }
                        }
                } else {
                    Value(configuration)
                }
            }
            .font(.fiori(forTextStyle: .body, weight: .regular))
            .foregroundStyle(Color.preferredColor(self.listPickerItemConfiguration.controlState == .disabled ? .quaternaryLabel : .primaryLabel))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let listPickerItemConfiguration: ListPickerItemConfiguration

        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
        }
    }
    
    struct FormViewFioriStyle: FormViewStyle {
        let listPickerItemConfiguration: ListPickerItemConfiguration
        
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}
