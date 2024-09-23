import FioriThemeManager
import Foundation
import SwiftUI

@available(iOS 15.0, macOS 12.0, *)

struct SearchableListContent<Data: RandomAccessCollection, ID: Hashable, RowContent: View, RowBackground: View>: View {
    @Environment(\.listBackground) var listBackground
    @Environment(\.listpickerListStyle) var listpickerListStyle

    @State var searchText = ""
    @State var selectionBuffer: Set<ID>
    
    let data: Data
    let id: KeyPath<Data.Element, ID>
    let children: KeyPath<Data.Element, Data?>?
    let selection: Binding<Set<ID>>?
    let searchFilter: ((Data.Element, String) -> Bool)?
    let allowsMultipleSelection: Bool
    let rowContent: (Data.Element) -> RowContent
    var rowBackground: ((Data.Element) -> RowBackground)?
    var selectionUpdated: ((Set<ID>) -> Void)?
    
    private let isTopLevel: Bool
    
    /// Create a searchable list view which supports both single-level and multi-level picker with the ability to select one or multiple items.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolean by the element and the filter key.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    init(data: Data,
         id: KeyPath<Data.Element, ID>,
         children: KeyPath<Data.Element, Data?>?,
         selection: Binding<Set<ID>>?,
         allowsMultipleSelection: Bool = true,
         searchFilter: ((Data.Element, String) -> Bool)?,
         @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent,
         rowBackground: ((Data.Element) -> RowBackground)? = nil)
    {
        self.init(data: data,
                  id: id,
                  children: children,
                  selection: selection,
                  isTopLevel: true,
                  allowsMultipleSelection: allowsMultipleSelection,
                  searchFilter: searchFilter,
                  rowContent: rowContent,
                  rowBackground: rowBackground)
    }
    
    init(data: Data,
         id: KeyPath<Data.Element, ID>,
         children: KeyPath<Data.Element, Data?>?,
         selection: Binding<Set<ID>>?,
         isTopLevel: Bool,
         allowsMultipleSelection: Bool,
         searchFilter: ((Data.Element, String) -> Bool)?,
         @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent,
         rowBackground: ((Data.Element) -> RowBackground)? = nil)
    {
        self.data = data
        self.id = id
        self.selection = selection
        self.children = children
        self.isTopLevel = isTopLevel
        self.searchFilter = searchFilter
        self.allowsMultipleSelection = allowsMultipleSelection
        self.rowContent = rowContent
        self.rowBackground = rowBackground
        _selectionBuffer = State(wrappedValue: selection?.wrappedValue ?? Set<ID>())
    }
    
    var body: some View {
        #if swift(>=5.6)
            if #available(iOS 16.0, *) {
                List {
                    listContent
                }
                .scrollContentBackground(.hidden)
                .background(listBackground)
                .onChange(of: selectionBuffer) { newValue in
                    selectionUpdated?(newValue)
                }
                .ifApply(searchFilter != nil, content: {
                    $0.searchable(text: $searchText, placement: .navigationBarDrawer)
                })
            } else {
                List {
                    self.listContent
                }
                .background(self.listBackground)
                .onChange(of: self.selectionBuffer) { newValue in
                    self.selectionUpdated?(newValue)
                }
                .ifApply(self.searchFilter != nil, content: {
                    $0.searchable(text: self.$searchText, placement: .navigationBarDrawer)
                })
            }
        #else
            List {
                self.listContent
            }
            .background(self.listBackground)
            .onChange(of: self.selectionBuffer) { newValue in
                self.selectionUpdated?(newValue)
            }
            .ifApply(self.searchFilter != nil, content: {
                $0.searchable(text: self.$searchText)
            })
        #endif
    }
    
    var listContent: some View {
        ForEach(self.data.filter { element in
            if let searchFilter, !searchText.isEmpty {
                return searchFilter(element, self.searchText)
            } else {
                return true
            }
        }, id: self.id) { element in
            Group {
                let row = self.rowContent(element)
                let id_value = element[keyPath: id]
                
                if let children, let childrenData = element[keyPath: children] {
                    _ListPickerItem<RowContent, EmptyView>(key: {
                        row
                    }, value: {
                        EmptyView()
                    }, configuration: _ListPickerItemConfiguration(childrenData,
                                                                   id: self.id,
                                                                   children: children,
                                                                   selection: !self.isTopLevel ? self.selection : self.$selectionBuffer,
                                                                   isTopLevel: false,
                                                                   allowsMultipleSelection: self.allowsMultipleSelection,
                                                                   searchFilter: self.searchFilter,
                                                                   rowContent: self.rowContent,
                                                                   rowBackground: self.rowBackground))
                        .environment(\.listBackground, self.listBackground)
                } else {
                    _ListPickerItem.Row(content: row,
                                        id: id_value,
                                        selection: !self.isTopLevel ? self.selection : self.$selectionBuffer,
                                        allowsMultipleSelection: self.allowsMultipleSelection)
                }
            }
            .listRowBackground(Group {
                if let rowBG = rowBackground?(element) {
                    rowBG
                } else {
                    Color.preferredColor(.primaryBackground)
                }
            })
        }
    }
}
