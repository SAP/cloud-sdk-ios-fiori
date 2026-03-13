import Combine
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ListPickerItemBaseStyle: ListPickerItemStyle {
    @Environment(\.destinationDisplayMode) var destinationDisplayMode
    @State var isDestinationPresented: Bool = false
    
    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        Group {
            switch self.destinationDisplayMode {
            case .push:
                NavigationLink(destination: configuration.destination) {
                    self.pickerItemView(configuration)
                }
            case .sheet:
                self.pickerItemView(configuration)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.isDestinationPresented = true
                    }
                    .sheet(isPresented: self.$isDestinationPresented) {
                        NavigationStack {
                            configuration.destination
                        }
                    }
            }
        }
    }
    
    @ViewBuilder func pickerItemView(_ configuration: ListPickerItemConfiguration) -> some View {
        switch configuration.axis {
        case .horizontal:
            self.horizontalLayout(configuration: configuration)
        case .vertical:
            self.verticalLayout(configuration: configuration)
        }
    }
    
    @ViewBuilder func horizontalLayout(configuration: ListPickerItemConfiguration) -> some View {
        HStack(spacing: 0) {
            configuration.title
            Spacer()
            configuration.value
        }
    }
    
    @ViewBuilder func verticalLayout(configuration: ListPickerItemConfiguration) -> some View {
        CompactVStack(alignment: .leading) {
            configuration.title
            configuration.value
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

    struct ValueFioriStyle: ValueStyle {
        let listPickerItemConfiguration: ListPickerItemConfiguration
        // only used for empty value view
        @State var selections: Set<String> = Set()
        @Environment(\.listPickerItemIgnoreValue) var listPickerItemIgnoreValue
        
        func makeBody(_ configuration: ValueConfiguration) -> some View {
            Group {
                if configuration.value.isEmpty, !self.listPickerItemIgnoreValue {
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
