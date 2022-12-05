import Foundation
import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
struct SearchableListContent<Data: RandomAccessCollection, ID: Hashable, RowContent: View>: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.listRowBackground) var listRowBackground
    
    @State var searchText = ""
    @State var selectionBuffer: Set<ID>
    
    let data: Data
    let id: KeyPath<Data.Element, ID>
    let children: KeyPath<Data.Element, Data?>?
    let selection: Binding<Set<ID>>?
    let searchFilter: ((Data.Element, String) -> Bool)?
    let allowsMultipleSelection: Bool
    let rowContent: (Data.Element) -> RowContent
    var selectionUpdated: ((Set<ID>) -> Void)?
    
    private let isTopLevel: Bool

    /// Create a searchable list view which supports both single-level and multi-level picker with the ability to select one or multiple items.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolen by the element and the filter key.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    init(data: Data,
         id: KeyPath<Data.Element, ID>,
         children: KeyPath<Data.Element, Data?>?,
         selection: Binding<Set<ID>>?,
         allowsMultipleSelection: Bool = true,
         searchFilter: ((Data.Element, String) -> Bool)?,
         @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent)
    {
        self.init(data: data,
                  id: id,
                  children: children,
                  selection: selection,
                  isTopLevel: true,
                  allowsMultipleSelection: allowsMultipleSelection,
                  searchFilter: searchFilter,
                  rowContent: rowContent)
    }

    internal init(data: Data,
                  id: KeyPath<Data.Element, ID>,
                  children: KeyPath<Data.Element, Data?>?,
                  selection: Binding<Set<ID>>?,
                  isTopLevel: Bool,
                  allowsMultipleSelection: Bool,
                  searchFilter: ((Data.Element, String) -> Bool)?,
                  @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent)
    {
        self.data = data
        self.id = id
        self.selection = selection
        self.children = children
        self.isTopLevel = isTopLevel
        self.searchFilter = searchFilter
        self.allowsMultipleSelection = allowsMultipleSelection
        self.rowContent = rowContent
        _selectionBuffer = State(wrappedValue: selection?.wrappedValue ?? Set<ID>())
    }
    
    var body: some View {
        List {
            ForEach(data.filter { element in
                if let searchFilter = searchFilter {
                    return searchFilter(element, searchText)
                } else {
                    return true
                }
            }, id: id) { element in
                let row = rowContent(element)
                let id_value = element[keyPath: id]
                
                if let children = children, let childrenData = element[keyPath: children] {
                    ListPickerItem<RowContent, EmptyView>(key: {
                        row
                    }, value: {
                        EmptyView()
                    }, configuration: ListPickerItemConfiguration(childrenData,
                                                                  id: id,
                                                                  children: children,
                                                                  selection: !isTopLevel ? selection : $selectionBuffer,
                                                                  isTopLevel: false,
                                                                  allowsMultipleSelection: allowsMultipleSelection,
                                                                  searchFilter: searchFilter,
                                                                  rowContent: rowContent))
                } else {
                    ListPickerItem.Row(content: row,
                                       id: id_value,
                                       selection: !isTopLevel ? selection : $selectionBuffer,
                                       allowsMultipleSelection: allowsMultipleSelection)
                }
            }.listRowBackground(listRowBackground)
        }
        #if swift(>=5.3)
            .ifApply(searchFilter != nil, content: {
                $0.searchable(text: $searchText)
            })
        #endif
        .onChange(of: selectionBuffer) { newValue in
            selectionUpdated?(newValue)
        }
    }
}
