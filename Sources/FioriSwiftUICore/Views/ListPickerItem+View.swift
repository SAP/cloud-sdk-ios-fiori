import Foundation
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum ListPickerItem {
        struct Key: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.headline).foregroundColor(.preferredColor(.primary1))
            }
        }
        
        typealias Value = EmptyModifier
        
        static let key = Key()
        static let value = Value()
    }
}

// FIXME: - Implement ListPickerItem View body

extension ListPickerItem: View {
    public var body: some View {
        NavigationLink(
            destination: destinationView,
            label: {
                KeyValueItem {
                    key
                } value: {
                    value
                }
            }
        )
    }
}

public extension ListPickerItem {
    /// Returns a list picker item with given configuration.
    /// - Parameters:
    ///   - key: The key view of the list.
    ///   - value: The value view of the list.
    ///   - configuration: The configuration for constructing the list picker.
    init(
        @ViewBuilder key: @escaping () -> Key,
        @ViewBuilder value: @escaping () -> Value,
        configuration: ListPickerItemConfiguration? = nil
    ) {
        self.init(key: key, value: value)
        
        if let configuration = configuration {
            destinationView = configuration.destinationView
        }
    }
}

/// The configuration for constructing the list picker.
public struct ListPickerItemConfiguration {
    let destinationView: AnyView
    
    /// Creates a configuration object from a collection of data which supports both signle-level and multi-level picker with the ability to select multiple items.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    public init<Data, ID, RowContent>(_ data: Data,
                                      id: KeyPath<Data.Element, ID>,
                                      children: KeyPath<Data.Element, Data?>?,
                                      selection: Binding<Set<ID>>?,
                                      @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent)
        where Data: RandomAccessCollection, RowContent: View, ID: Hashable
    {
        self.destinationView = List {
            ForEach(data, id: id) { element in
                let row = rowContent(element)
                let id_value = element[keyPath: id]
                
                if let children = children, let childrenData = element[keyPath: children] {
                    ListPickerItem<RowContent, EmptyView>(key: {
                        row
                    }, value: {
                        EmptyView()
                    }, configuration: ListPickerItemConfiguration(childrenData, id: id, children: children, selection: selection, rowContent: rowContent))
                } else {
                    ListPickerItem.Row(content: row, id: id_value, selection: selection)
                }
            }
        }.typeErased
    }
}

public extension ListPickerItemConfiguration {
    init(_ data: [String], selection: Binding<Set<String>>?) {
        self.init(data, id: \.self, children: nil, selection: selection) { str in
            Text(str)
        }
    }
}

extension ListPickerItem {
    struct Row<ID: Hashable>: View where Value == EmptyView {
        let content: Key
        let id: ID
        var selection: Binding<Set<ID>>?
        @State private var isSelected: Bool
        
        init(content: Key, id: ID, selection: Binding<Set<ID>>?) {
            self.content = content
            self.id = id
            self.selection = selection
            
            let isSelected = selection?.wrappedValue.contains(id) ?? false
            self._isSelected = State(initialValue: isSelected)
        }
        
        var body: some View {
            HStack {
                content
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.preferredColor(.tintColor))
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                if isSelected {
                    selection?.wrappedValue.remove(id)
                } else {
                    selection?.wrappedValue.insert(id)
                }
                isSelected.toggle()
            }
        }
    }
}
