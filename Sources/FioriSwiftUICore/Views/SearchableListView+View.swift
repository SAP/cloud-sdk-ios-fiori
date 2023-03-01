import FioriThemeManager
import SwiftUI

extension Fiori {
    enum SearchableListView {
        typealias CancelActionCumulative = EmptyModifier
        typealias DoneActionCumulative = EmptyModifier
        
        struct CancelAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .callout))
                    .foregroundColor(.preferredColor(.tintColor))
            }
        }
        
        struct DoneAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .callout))
                    .foregroundColor(.preferredColor(.tintColor))
            }
        }
        
        static let cancelAction = CancelAction()
        static let doneAction = DoneAction()
        static let cancelActionCumulative = CancelActionCumulative()
        static let doneActionCumulative = DoneActionCumulative()
    }
}

@available(iOS 15.0, macOS 12.0, *)
extension SearchableListView: View {
    public var body: some View {
        if let contentView = contentView {
            contentView
                .listStyle(.plain)
                .environment(\.listBackground, listBackground)
                .ifApply(isTopLevel) {
                    $0.toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            cancelAction.onSimultaneousTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            doneAction.onSimultaneousTapGesture {
                                dataHandler?()
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                }
        } else {
            Text("No Data")
        }
    }
}

@available(iOS 15.0, macOS 12.0, *)
public extension SearchableListView where CancelActionView == _ConditionalContent<Action, EmptyView>,
    DoneActionView == _ConditionalContent<Action, EmptyView>
{
    /// Create a searchable list view which supports both single-level and multi-level picker with the ability to select one or multiple items.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolen by the element and the filter key.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    ///   - rowBackground: The background for the list row.
    init<Data: RandomAccessCollection, ID: Hashable, RowContent: View, RowBackground: View>(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>?,
        selection: Binding<Set<ID>>?,
        allowsMultipleSelection: Bool = false,
        searchFilter: ((Data.Element, String) -> Bool)?,
        @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent,
        rowBackground: ((Data.Element) -> RowBackground)? = nil
    ) {
        self.init(data: data, id: id, children: children, selection: selection,
                  searchFilter: searchFilter, rowContent: rowContent, rowBackground: rowBackground,
                  cancelAction: Action(model: _CancelActionDefault()),
                  doneAction: Action(model: _DoneActionDefault()))
    }
    
    /// Create a searchable list view which supports both single-level and multi-level picker with the ability to select one or multiple items.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolen by the element and the filter key.
    init(data: [String],
         selection: Binding<Set<String>>?,
         allowsMultipleSelection: Bool = false,
         searchFilter: ((String, String) -> Bool)? = nil)
    {
        self.init(data: data, id: \.self, children: nil, selection: selection,
                  searchFilter: searchFilter, rowContent: { Text($0) },
                  rowBackground: { _ in Color.preferredColor(.primaryBackground) })
    }
    
    /// Create a searchable list view which supports both single-level and multi-level picker with the ability to select one or multiple items.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolen by the element and the filter key.
    ///   - rowBackground: The background for the list row.
    init<RowBackground: View>(data: [String],
                              selection: Binding<Set<String>>?,
                              allowsMultipleSelection: Bool = false,
                              searchFilter: ((String, String) -> Bool)?,
                              rowBackground: ((String) -> RowBackground)? = nil)
    {
        self.init(data: data, id: \.self, children: nil, selection: selection,
                  searchFilter: searchFilter, rowContent: { Text($0) }, rowBackground: rowBackground,
                  cancelAction: Action(model: _CancelActionDefault()),
                  doneAction: Action(model: _DoneActionDefault()))
    }
    
    /// Create a searchable list view which supports both single-level and multi-level picker with the ability to select one or multiple items.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolen by the element and the filter key.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    init<Data: RandomAccessCollection, ID: Hashable, RowContent: View>(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>?,
        selection: Binding<Set<ID>>?,
        allowsMultipleSelection: Bool = false,
        searchFilter: ((Data.Element, String) -> Bool)?,
        @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent
    ) {
        self.init(data: data, id: id, children: children, selection: selection, searchFilter: searchFilter,
                  rowContent: rowContent, rowBackground: { _ in Color.preferredColor(.primaryBackground) },
                  cancelAction: Action(model: _CancelActionDefault()),
                  doneAction: Action(model: _DoneActionDefault()))
    }
    
    /// Create a searchable list view which supports both single-level and multi-level picker with the ability to select one or multiple items.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to a set which stores the selected items.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolen by the element and the filter key.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    ///   - rowBackground: The background for the list row.
    ///   - cancelAction: Customzation searchable list cancel action.
    ///   - doneAction: Customzation searchable list done action.
    init<Data: RandomAccessCollection, ID: Hashable, RowContent: View, RowBackground: View>(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>?,
        selection: Binding<Set<ID>>?,
        allowsMultipleSelection: Bool = false,
        searchFilter: ((Data.Element, String) -> Bool)?,
        @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent,
        rowBackground: ((Data.Element) -> RowBackground)? = nil,
        cancelAction: Action? = Action(model: _CancelActionDefault()),
        doneAction: Action? = Action(model: _DoneActionDefault())
    ) {
        self.init(cancelAction: cancelAction, doneAction: doneAction)
        var selectionBuffer = selection?.wrappedValue
        var content = SearchableListContent(data: data,
                                            id: id,
                                            children: children,
                                            selection: selection,
                                            isTopLevel: true,
                                            allowsMultipleSelection: allowsMultipleSelection,
                                            searchFilter: searchFilter,
                                            rowContent: rowContent,
                                            rowBackground: rowBackground)
        content.selectionUpdated = { newSelections in
            selectionBuffer = newSelections
        }
        dataHandler = {
            selection?.wrappedValue = selectionBuffer ?? Set<ID>()
        }
        contentView = content.typeErased
    }
    
    internal init<Data: RandomAccessCollection, ID: Hashable, RowContent: View, RowBackground: View>(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>?,
        selection: Binding<Set<ID>>?,
        isTopLevel: Bool,
        allowsMultipleSelection: Bool = false,
        searchFilter: ((Data.Element, String) -> Bool)?,
        @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent,
        rowBackground: ((Data.Element) -> RowBackground)? = nil
    ) {
        self.init()
        self.isTopLevel = isTopLevel
        contentView = SearchableListContent(data: data,
                                            id: id,
                                            children: children,
                                            selection: selection,
                                            isTopLevel: isTopLevel,
                                            allowsMultipleSelection: allowsMultipleSelection,
                                            searchFilter: searchFilter,
                                            rowContent: rowContent,
                                            rowBackground: rowBackground).typeErased
    }
}

struct ListBackgroundKey: EnvironmentKey {
    static let defaultValue = Color.preferredColor(.secondaryBackground)
}

public extension EnvironmentValues {
    /// listBackground environment value
    var listBackground: Color {
        get { self[ListBackgroundKey.self] }
        set { self[ListBackgroundKey.self] = newValue }
    }
}

public extension View {
    /// List row background color
    /// - Parameter color: background for `SearchableListView`
    /// - Returns: some View
    func listBackground(_ color: Color) -> some View {
        self.environment(\.listBackground, color)
    }
}
