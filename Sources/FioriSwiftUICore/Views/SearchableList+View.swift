import FioriThemeManager
import SwiftUI

extension Fiori {
    enum SearchableList {
        typealias CancelActionCumulative = EmptyModifier
        typealias DoneActionCumulative = EmptyModifier
        
        struct CancelAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 16))
                    .foregroundColor(.preferredColor(.tintColor))
            }
        }
        
        struct DoneAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 16))
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
extension SearchableList: View {
    public var body: some View {
        if let contentView = contentView {
            contentView
                .environment(\.listRowBackground, listRowBackground)
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
public extension SearchableList where CancelActionView == _ConditionalContent<Action, EmptyView>,
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
    init<Data: RandomAccessCollection, ID: Hashable, RowContent: View>(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>?,
        selection: Binding<Set<ID>>?,
        allowsMultipleSelection: Bool = true,
        searchFilter: ((Data.Element, String) -> Bool)?,
        @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent
    ) {
        self.init()
        var selectionBuffer: Set<ID>?
        var content = SearchableListContent(data: data,
                                            id: id,
                                            children: children,
                                            selection: selection,
                                            isTopLevel: true,
                                            allowsMultipleSelection: allowsMultipleSelection,
                                            searchFilter: searchFilter,
                                            rowContent: rowContent)
        content.selectionUpdated = { newSelections in
            selectionBuffer = newSelections
        }
        dataHandler = {
            selection?.wrappedValue = selectionBuffer ?? Set<ID>()
        }
        contentView = content.typeErased
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
    ///   - cancelAction: Customzation searchable list cancel action.
    ///   - doneAction: Customzation searchable list done action.
    init<Data: RandomAccessCollection, ID: Hashable, RowContent: View>(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>?,
        selection: Binding<Set<ID>>?,
        allowsMultipleSelection: Bool = true,
        searchFilter: ((Data.Element, String) -> Bool)?,
        @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent,
        cancelAction: Action? = Action(model: _CancelActionDefault()),
        doneAction: Action? = Action(model: _DoneActionDefault())
    ) {
        self.init(cancelAction: cancelAction, doneAction: doneAction)
        var selectionBuffer: Set<ID>?
        var content = SearchableListContent(data: data,
                                            id: id,
                                            children: children,
                                            selection: selection,
                                            isTopLevel: true,
                                            allowsMultipleSelection: allowsMultipleSelection,
                                            searchFilter: searchFilter,
                                            rowContent: rowContent)
        content.selectionUpdated = { newSelections in
            selectionBuffer = newSelections
        }
        dataHandler = {
            selection?.wrappedValue = selectionBuffer ?? Set<ID>()
        }
        contentView = content.typeErased
    }
    
    internal init<Data: RandomAccessCollection, ID: Hashable, RowContent: View>(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>?,
        selection: Binding<Set<ID>>?,
        isTopLevel: Bool,
        allowsMultipleSelection: Bool = true,
        searchFilter: ((Data.Element, String) -> Bool)?,
        @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent
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
                                            rowContent: rowContent).typeErased
    }
}

struct ListRowBackgroundKey: EnvironmentKey {
    static let defaultValue = Color.preferredColor(.primaryBackground)
}

public extension EnvironmentValues {
    var listRowBackground: Color {
        get { self[ListRowBackgroundKey.self] }
        set { self[ListRowBackgroundKey.self] = newValue }
    }
}

public extension View {
    /// List row background color
    /// - Parameter color: color for list row in searchable list
    /// - Returns: some View
    func listRowBackgroundColor(_ color: Color) -> some View {
        self.environment(\.listRowBackground, color)
    }
}
