import Combine
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
                HStack(spacing: 0) {
                    configuration.title
                    if configuration.isRequired {
                        configuration.mandatoryFieldIndicator
                    }
                    Spacer()
                    configuration.value
                }
            case .vertical:
                CompactVStack(alignment: .leading) {
                    HStack(spacing: 0) {
                        configuration.title
                        if configuration.isRequired {
                            configuration.mandatoryFieldIndicator
                        }
                    }
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
                .disabled(configuration.controlState == .disabled || configuration.controlState == .readOnly)
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
    
    struct MandatoryFieldIndicatorFioriStyle: MandatoryFieldIndicatorStyle {
        let listPickerItemConfiguration: ListPickerItemConfiguration
        func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
            MandatoryFieldIndicator(configuration)
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
    
    struct FormViewFioriStyle: FormViewStyle {
        let listPickerItemConfiguration: ListPickerItemConfiguration
        
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}
