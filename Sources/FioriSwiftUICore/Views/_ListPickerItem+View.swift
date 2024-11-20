import FioriThemeManager
import Foundation
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum _ListPickerItem {
        struct Key: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.fiori(forTextStyle: .subheadline, weight: .bold)).foregroundColor(.preferredColor(.primaryLabel))
            }
        }

        typealias KeyCumulative = EmptyModifier
        
        typealias Value = EmptyModifier
        typealias ValueCumulative = EmptyModifier
        
        static let key = Key()
        static let value = Value()
        static let keyCumulative = KeyCumulative()
        static let valueCumulative = ValueCumulative()
    }
}

// FIXME: - Implement ListPickerItem View body

extension _ListPickerItem: View {
    public var body: some View {
        if let isActive = destinationConfiguration?.isActive, isActive.wrappedValue {
            self.destinationView
        } else {
            NavigationLink(
                destination: self.destinationView,
                label: {
                    KeyValueItem(key: {
                        key
                    }, value: {
                        value
                    }, axis: _axis)
                }
            )
        }
    }
    
    @ViewBuilder
    var destinationView: some View {
        destinationConfiguration?
            .destinationView
            .modifier(listPickerListViewModifier)
            .listStyle(listpickerListStyle)
            .listPickerListStyle(listpickerListStyle)
            .listBackground(listBackground)
            .environment(\.listPickerListViewModifier, listPickerListViewModifier)
            .typeErased
    }
}

public extension _ListPickerItem {
    /// Returns a list picker item with given configuration.
    /// - Parameters:
    ///   - key: The key view of the list.
    ///   - value: The value view of the list.
    ///   - axis: Axis for key and value layout.
    ///   - configuration: The configuration for constructing the list picker.
    init(
        @ViewBuilder key: @escaping () -> Key,
        @ViewBuilder value: @escaping () -> Value,
        axis: Axis = .horizontal,
        configuration: _ListPickerItemConfiguration? = nil
    ) {
        self.init(key: key, value: value, axis: axis)
        self.destinationConfiguration = configuration
    }
}

/// The configuration for constructing the list picker.
public struct _ListPickerItemConfiguration {
    let destinationView: AnyView
    
    // A boolean that indicates whether show the children directly.
    var isActive: Binding<Bool>?
    
    /// Creates a searchable configuration object from a collection of data which supports single-level picker with the ability to select.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolean by the element and the filter key.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    ///   - rowBackground: `listRowBackground` for each row.
    @available(iOS 15.0, macOS 12.0, *)
    public init<Data, ID>(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>?,
        selection: Binding<Set<ID>>?,
        allowsMultipleSelection: Bool = true,
        searchFilter: ((Data.Element, String) -> Bool)?,
        @ViewBuilder rowContent: @escaping (Data.Element) -> some View,
        rowBackground: ((Data.Element) -> some View)? = nil
    )
        where Data: RandomAccessCollection, ID: Hashable
    {
        self.init(data, id: id, children: children, selection: selection, isTopLevel: true, allowsMultipleSelection: allowsMultipleSelection, searchFilter: searchFilter, rowContent: rowContent, rowBackground: rowBackground)
    }
    
    @available(iOS 15.0, macOS 12.0, *)
    public init<Data, ID>(_ data: Data,
                          id: KeyPath<Data.Element, ID>,
                          children: KeyPath<Data.Element, Data?>?,
                          selection: Binding<Set<ID>>?,
                          allowsMultipleSelection: Bool = true,
                          searchFilter: ((Data.Element, String) -> Bool)?,
                          @ViewBuilder rowContent: @escaping (Data.Element) -> some View)
        where Data: RandomAccessCollection, ID: Hashable
    {
        self.init(data, id: id, children: children, selection: selection, isTopLevel: true, allowsMultipleSelection: allowsMultipleSelection, searchFilter: searchFilter, rowContent: rowContent, rowBackground: { _ in Color.preferredColor(.primaryBackground) })
    }
    
    /// Creates a configuration object from a collection of data which supports both single-level and multi-level picker with the ability to select multiple items.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - isActive: A binding to a bool that decide if show children directly, Default value is nil.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    public init<Data, ID, RowContent>(_ data: Data,
                                      id: KeyPath<Data.Element, ID>,
                                      children: KeyPath<Data.Element, Data?>?,
                                      selection: Binding<Set<ID>>?,
                                      isActive: Binding<Bool>? = nil,
                                      @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent)
        where Data: RandomAccessCollection, RowContent: View, ID: Hashable
    {
        if let isActive, isActive.wrappedValue {
            self.destinationView = ForEach(data, id: id) { element in
                let row = rowContent(element)
                let id_value = element[keyPath: id]
                
                if let children, let childrenData = element[keyPath: children] {
                    _ListPickerItem<RowContent, EmptyView>(key: {
                        row
                    }, value: {
                        EmptyView()
                    }, configuration: _ListPickerItemConfiguration(childrenData, id: id, children: children, selection: selection, rowContent: rowContent))
                } else {
                    _ListPickerItem.Row(content: row, id: id_value, selection: selection)
                }
            }.typeErased
        } else {
            self.destinationView = List {
                ForEach(data, id: id) { element in
                    let row = rowContent(element)
                    let id_value = element[keyPath: id]
                    
                    if let children, let childrenData = element[keyPath: children] {
                        _ListPickerItem<RowContent, EmptyView>(key: {
                            row
                        }, value: {
                            EmptyView()
                        }, configuration: _ListPickerItemConfiguration(childrenData, id: id, children: children, selection: selection, rowContent: rowContent))
                    } else {
                        _ListPickerItem.Row(content: row, id: id_value, selection: selection)
                    }
                }
            }.typeErased
        }
        self.isActive = isActive
    }
    
    /// Creates a configuration object from a collection of data (conforms to `Identifiable`) which supports both single-level and multi-level picker with the ability to select multiple items.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - isActive: A binding to a bool that decide if show children directly, Default value is nil.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    public init<Data, ID>(_ data: Data,
                          children: KeyPath<Data.Element, Data?>?,
                          selection: Binding<Set<ID>>?,
                          isActive: Binding<Bool>? = nil,
                          @ViewBuilder rowContent: @escaping (Data.Element) -> some View)
        where Data: RandomAccessCollection, Data.Element: Identifiable, ID == Data.Element.ID
    {
        let id = \Data.Element.id
        self.init(data, id: id, children: children, selection: selection, isActive: isActive, rowContent: rowContent)
    }
}

public extension _ListPickerItemConfiguration {
    /// Creates a configuration object from a collection of `String` which supports both single-level and multi-level picker with the ability to select multiple items.
    /// - Parameters:
    ///   - data: An array of strings for constructing the list.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - isActive: A binding to a bool that decide if show children directly, Default value is nil.
    init(_ data: [String], selection: Binding<Set<String>>?, isActive: Binding<Bool>? = nil) {
        self.init(data, id: \.self, children: nil, selection: selection, isActive: isActive) { str in
            Text(str)
        }
    }
}

extension _ListPickerItemConfiguration {
    @available(iOS 15.0, macOS 12.0, *)
    init<Data, ID>(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>?,
        selection: Binding<Set<ID>>?,
        isTopLevel: Bool,
        allowsMultipleSelection: Bool,
        searchFilter: ((Data.Element, String) -> Bool)?,
        @ViewBuilder rowContent: @escaping (Data.Element) -> some View,
        rowBackground: ((Data.Element) -> some View)? = nil
    )
        where Data: RandomAccessCollection, ID: Hashable
    {
        self.destinationView = SearchableListView(data: data,
                                                  id: id,
                                                  children: children,
                                                  selection: selection,
                                                  isTopLevel: isTopLevel,
                                                  allowsMultipleSelection: allowsMultipleSelection,
                                                  searchFilter: searchFilter,
                                                  rowContent: rowContent,
                                                  rowBackground: rowBackground)
            .typeErased
    }
}

extension _ListPickerItem {
    struct Row<ID: Hashable>: View where Value == EmptyView {
        private let content: Key
        private let id: ID
        private let allowsMultipleSelection: Bool
        @Binding private var selection: Set<ID>
        
        init(content: Key, id: ID, selection: Binding<Set<ID>>?, allowsMultipleSelection: Bool = true) {
            self.content = content
            self.id = id
            self.allowsMultipleSelection = allowsMultipleSelection
            self._selection = selection ?? Binding.constant(Set<ID>())
        }
        
        var body: some View {
            let isSelected = self.selection.contains(self.id)
            
            HStack {
                self.content
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.preferredColor(.tintColor))
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                if isSelected {
                    self.selection.remove(self.id)
                } else {
                    if !self.allowsMultipleSelection {
                        self.selection.removeAll()
                    }
                    self.selection.insert(self.id)
                }
            }
        }
    }
}

struct ListpickerListStyleKey: EnvironmentKey {
    static let defaultValue: any ListStyle = .automatic
}

extension EnvironmentValues {
    /// listpickerListStyle environment value.
    var listpickerListStyle: any ListStyle {
        get { self[ListpickerListStyleKey.self] }
        set { self[ListpickerListStyleKey.self] = newValue }
    }
}

public extension View {
    /// List style for destination list in list picker.
    /// - Parameter style: some `ListStyle`.
    /// - Returns: New destination list style for list picker.
    func listPickerListStyle(_ style: some ListStyle) -> some View {
        self.environment(\.listpickerListStyle, style)
    }
}

struct ListPickerListViewModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

public extension EnvironmentValues {
    /// :nodoc:
    var listPickerListViewModifier: AnyViewModifier {
        get { self[ListPickerListViewModifierKey.self] }
        set { self[ListPickerListViewModifierKey.self] = newValue }
    }
}

public extension View {
    @ViewBuilder
    /// List picker trasfomation if you want any customization for destination view.
    /// - Parameter transform: Any transformation.
    /// - Returns: A new transformed `View`.
    func listPickerListViewModifier(_ transform: @escaping (AnyViewModifier.Content) -> some View) -> some View {
        self.environment(\.listPickerListViewModifier, AnyViewModifier(transform))
    }
}
