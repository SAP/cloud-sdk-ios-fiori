import FioriThemeManager
import Foundation
import SwiftUI

// swiftlint:disable file_length

// Base Layout style
public struct ListPickerDestinationBaseStyle: ListPickerDestinationStyle {
    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        configuration.listPickerContent
            .listPickerDestinationConfiguration(configuration)
    }
}

// Default fiori styles
extension ListPickerDestinationFioriStyle {
    struct ContentFioriStyle: ListPickerDestinationStyle {
        func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
            ListPickerDestination(configuration)
        }
    }
    
    struct CancelActionFioriStyle: CancelActionStyle {
        let listPickerDestinationConfiguration: ListPickerDestinationConfiguration
        
        func makeBody(_ configuration: CancelActionConfiguration) -> some View {
            CancelAction(configuration)
                .fioriButtonStyle(ListPickerDestinationButtonStyle(.navigation))
                .bold()
        }
    }
    
    struct ApplyActionFioriStyle: ApplyActionStyle {
        let listPickerDestinationConfiguration: ListPickerDestinationConfiguration
        
        func makeBody(_ configuration: ApplyActionConfiguration) -> some View {
            ApplyAction(configuration)
                .fioriButtonStyle(ListPickerDestinationButtonStyle(.navigation))
        }
    }
    
    struct SelectedEntriesSectionTitleFioriStyle: SelectedEntriesSectionTitleStyle {
        let listPickerDestinationConfiguration: ListPickerDestinationConfiguration
        
        func makeBody(_ configuration: SelectedEntriesSectionTitleConfiguration) -> some View {
            SelectedEntriesSectionTitle(configuration)
        }
    }
    
    struct SelectAllActionFioriStyle: SelectAllActionStyle {
        let listPickerDestinationConfiguration: ListPickerDestinationConfiguration
        
        func makeBody(_ configuration: SelectAllActionConfiguration) -> some View {
            SelectAllAction(configuration)
                .fioriButtonStyle(ListPickerDestinationButtonStyle())
        }
    }
    
    struct DeselectAllActionFioriStyle: DeselectAllActionStyle {
        let listPickerDestinationConfiguration: ListPickerDestinationConfiguration
        
        func makeBody(_ configuration: DeselectAllActionConfiguration) -> some View {
            DeselectAllAction(configuration)
                .fioriButtonStyle(ListPickerDestinationButtonStyle())
        }
    }
    
    struct AllEntriesSectionTitleFioriStyle: AllEntriesSectionTitleStyle {
        let listPickerDestinationConfiguration: ListPickerDestinationConfiguration
        
        func makeBody(_ configuration: AllEntriesSectionTitleConfiguration) -> some View {
            AllEntriesSectionTitle(configuration)
        }
    }
    
    struct ListPickerContentFioriStyle: ListPickerContentStyle {
        let listPickerDestinationConfiguration: ListPickerDestinationConfiguration
    
        func makeBody(_ configuration: ListPickerContentConfiguration) -> some View {
            ListPickerContent(configuration)
        }
    }
}

struct ListPickerDestinationButtonStyle: FioriButtonStyle {
    enum ButtonPosition {
        case navigation
        case header
    }
    
    let buttonPosition: ButtonPosition
    
    init(_ buttonPosition: ButtonPosition = .header) {
        self.buttonPosition = buttonPosition
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let font: Font
        let foregroundColor: Color
        
        switch configuration.state {
        case .normal:
            foregroundColor = .preferredColor(.tintColor)
        case .highlighted, .selected:
            foregroundColor = .preferredColor(.tintColor3)
        default:
            foregroundColor = .preferredColor(.separator)
        }
         
        switch self.buttonPosition {
        case .navigation:
            font = .fiori(forTextStyle: .body).weight(.bold)
        case .header:
            font = .fiori(forTextStyle: .subheadline)
        }
        let config = FioriButtonConfiguration(foregroundColor: foregroundColor,
                                              backgroundColor: .clear,
                                              font: font,
                                              padding: EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        return configuration.containerView(.unspecified)
            .fioriButtonConfiguration(config)
    }
}

public extension ListPickerDestination {
    /// Create a destination for `ListPickerItem`.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selections: A binding to a set which stores the selected items.
    ///   - isTrackingLiveChanges: A boolean value to indicate to track the changes live or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolean by the element and the filter key.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    init<Data: RandomAccessCollection, ID: Hashable>(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>? = nil,
        selection: Binding<ID?>,
        isTrackingLiveChanges: Bool = true,
        searchFilter: ((Data.Element, String) -> Bool)? = nil,
        @ViewBuilder rowContent: @escaping (Data.Element) -> some View
    ) {
        let s = Binding<Set<ID>>(get: {
            if let s = selection.wrappedValue {
                [s]
            } else {
                []
            }
        }, set: {
            selection.wrappedValue = $0.first
        })
        let content = ListPickerDestinationContent(
            data,
            id: id,
            children: children,
            selections: s,
            isSingleSelection: true,
            allowEmpty: true,
            isTrackingLiveChanges: isTrackingLiveChanges,
            searchFilter: searchFilter,
            rowContent: rowContent
        )
        self.init {
            FioriButton { _ in Text("Cancel".localizedFioriString()) }
        } listPickerContent: {
            content
        }
    }
    
    /// Create a destination for `ListPickerItem`.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to an ID which stores the selected items.
    ///   - isTrackingLiveChanges: A boolean value to indicate to track the changes live or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolean by the element and the filter key.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    init<Data: RandomAccessCollection, ID: Hashable>(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>? = nil,
        selection: Binding<ID>,
        isTrackingLiveChanges: Bool = true,
        searchFilter: ((Data.Element, String) -> Bool)? = nil,
        @ViewBuilder rowContent: @escaping (Data.Element) -> some View
    ) {
        let s = Binding(get: {
            Set([selection.wrappedValue])
        }, set: {
            if let s = $0.first {
                selection.wrappedValue = s
            } else {
                fatalError("Selection should not be empty.")
            }
        })
        
        let content = ListPickerDestinationContent(
            data,
            id: id,
            children: children,
            selections: s,
            isSingleSelection: true,
            allowEmpty: false,
            isTrackingLiveChanges: isTrackingLiveChanges,
            searchFilter: searchFilter,
            rowContent: rowContent
        )
        self.init {
            FioriButton { _ in Text("Cancel".localizedFioriString()) }
        } listPickerContent: {
            content
        }
    }
    
    /// Create a destination for `ListPickerItem`.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selections: A binding to a set which stores the selected items.
    ///   - isTrackingLiveChanges: A boolean value to indicate to track the changes live or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolean by the element and the filter key.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    init<Data: RandomAccessCollection, ID: Hashable>(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>? = nil,
        selections: Binding<Set<ID>?>,
        isTrackingLiveChanges: Bool = true,
        searchFilter: ((Data.Element, String) -> Bool)? = nil,
        @ViewBuilder rowContent: @escaping (Data.Element) -> some View
    ) {
        let s = Binding(get: {
            selections.wrappedValue ?? []
        }, set: {
            selections.wrappedValue = $0
        })
        let content = ListPickerDestinationContent(
            data,
            id: id,
            children: children,
            selections: s,
            isSingleSelection: false,
            allowEmpty: true,
            isTrackingLiveChanges: isTrackingLiveChanges,
            searchFilter: searchFilter,
            rowContent: rowContent
        )
        self.init {
            FioriButton { _ in Text("Cancel".localizedFioriString()) }
        } listPickerContent: {
            content
        }
    }
    
    /// Create a destination for `ListPickerItem`.
    /// - Parameters:
    ///   - data: The data for constructing the list picker.
    ///   - id: The key path to the data model's unique identifier.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selections: A binding to a set which stores the non-optional selected items.
    ///   - allowEmpty: A boolean value to indicate to allow empty selections.
    ///   - isTrackingLiveChanges: A boolean value to indicate to track the changes live or not.
    ///   - searchFilter: The closure to filter the `data` in searching process. Request a boolean by the element and the filter key.
    ///   - rowContent: The view builder which returns the content of each row in the list picker.
    init<Data: RandomAccessCollection, ID: Hashable>(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        children: KeyPath<Data.Element, Data?>? = nil,
        selections: Binding<Set<ID>>,
        allowEmpty: Bool = true,
        isTrackingLiveChanges: Bool = true,
        searchFilter: ((Data.Element, String) -> Bool)? = nil,
        @ViewBuilder rowContent: @escaping (Data.Element) -> some View
    ) {
        let content = ListPickerDestinationContent(
            data,
            id: id,
            children: children,
            selections: selections,
            isSingleSelection: false,
            allowEmpty: allowEmpty,
            isTrackingLiveChanges: isTrackingLiveChanges,
            searchFilter: searchFilter,
            rowContent: rowContent
        )
        self.init {
            FioriButton { _ in Text("Cancel".localizedFioriString()) }
        } listPickerContent: {
            content
        }
    }
}

public struct ListPickerDestinationContent<Data: RandomAccessCollection, ID: Hashable, RowContent: View>: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.listPickerDestinationConfiguration) var destinationConfiguration
    @Environment(\.disableEntriesSection) var disableEntriesSection

    @Binding private var selections: Set<ID>
    private var isSingleSelection: Bool
    private var allowEmpty: Bool
    private var isTopLevel: Bool

    let data: Data
    let id: KeyPath<Data.Element, ID>
    let children: KeyPath<Data.Element, Data?>?
    let rowContent: (Data.Element) -> RowContent
    let isTrackingLiveChanges: Bool
    let searchFilter: ((Data.Element, String) -> Bool)?

    // MARK: - Internal state

    @State var selectionsPool: Set<ID>
    @State var searchText = ""
    @State var confirmationSelections: Bool = false
    
    init(_ data: Data,
         id: KeyPath<Data.Element, ID>,
         children: KeyPath<Data.Element, Data?>?,
         selections: Binding<Set<ID>>,
         isSingleSelection: Bool,
         allowEmpty: Bool,
         isTrackingLiveChanges: Bool,
         searchFilter: ((Data.Element, String) -> Bool)?,
         isTopLevel: Bool = true,
         @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent)
    {
        self.data = data
        self.id = id
        self.children = children
        _selections = selections
        self.isSingleSelection = isSingleSelection
        self.allowEmpty = allowEmpty
        self.isTrackingLiveChanges = isTrackingLiveChanges
        self.searchFilter = searchFilter
        
        self.isTopLevel = isTopLevel
        self.rowContent = rowContent
                
        if !isTrackingLiveChanges {
            _selectionsPool = State(initialValue: selections.wrappedValue)
        } else {
            _selectionsPool = State(initialValue: [])
        }
    }

    public var body: some View {
        Group {
            if self.searchFilter != nil {
                self.listContent()
                    .searchable(text: self.$searchText, placement: .navigationBarDrawer)
            } else {
                self.listContent()
            }
        }
        .ifApply(!self.isTrackingLiveChanges && self.isTopLevel) {
            $0.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    self.destinationConfiguration?.cancelAction
                        .onSimultaneousTapGesture {
                            self.cancelActionTapped()
                        }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    self.destinationConfiguration?.applyAction
                        .onSimultaneousTapGesture {
                            self.confirm()
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .disabled(!self.allowEmpty && self.selectionsPool.isEmpty)
                }
            }
            .confirmationDialog("Are you sure you want to discard your selections?".localizedFioriString(),
                                isPresented: self.$confirmationSelections,
                                titleVisibility: .visible,
                                actions: {
                                    Button {
                                        self.presentationMode.wrappedValue.dismiss()
                                    } label: {
                                        Text("Discard Changes".localizedFioriString())
                                    }
                                    Button("Keep Editing".localizedFioriString(), role: .cancel) {}
                                })
            .navigationBarBackButtonHidden()
        }
    }
    
    func cancelActionTapped() {
        if !(self.selections == self.selectionsPool) {
            self.confirmationSelections.toggle()
        } else {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func selectedEntriesSectionHeaderIsEmpty() -> Bool {
        (self.destinationConfiguration?.selectedEntriesSectionTitle.isEmpty ?? true) &&
            (self.destinationConfiguration?.deselectAllAction.isEmpty ?? true)
    }
    
    private func allEntriesHeaderIsEmpty() -> Bool {
        let isActionEmpty = (destinationConfiguration?.selectAllAction.isEmpty ?? true) && (self.destinationConfiguration?.deselectAllAction.isEmpty ?? true)
        return (self.destinationConfiguration?.allEntriesSectionTitle.isEmpty ?? true) && isActionEmpty
    }
    
    @ViewBuilder func listContent() -> some View {
        List {
            if self.isTopLevel, !self.disableEntriesSection, !self.isSingleSelection, self.destinationConfiguration != nil {
                Section {
                    self.selectedSection()
                } header: {
                    if !self.selectedEntriesSectionHeaderIsEmpty(), self.selectionsCount() > 0 {
                        HStack {
                            self.destinationConfiguration?.selectedEntriesSectionTitle
                            Spacer()
                            self.destinationConfiguration?.deselectAllAction
                                .onSimultaneousTapGesture {
                                    self.deselectAll()
                                }
                        }
                    }
                }.textCase(.none)
            }
            
            Section {
                ForEach(self.filteredDataOnPage(), id: self.id) { element in
                    Group {
                        let id_value = element[keyPath: id]
                        if let children, let childrenData = element[keyPath: children] {
                            ListPickerItem {
                                self.rowContent(element)
                            } value: {
                                EmptyView()
                            } destination: {
                                ListPickerDestinationContent(childrenData,
                                                             id: self.id,
                                                             children: children,
                                                             selections: self.isTrackingLiveChanges ? self.$selections : self.$selectionsPool,
                                                             isSingleSelection: self.isSingleSelection,
                                                             allowEmpty: self.allowEmpty,
                                                             isTrackingLiveChanges: true,
                                                             searchFilter: self.searchFilter,
                                                             isTopLevel: false,
                                                             rowContent: self.rowContent)
                            }
                        } else {
                            HStack {
                                self.rowContent(element)
                                Spacer().frame(minWidth: 0)
                                if self.isItemSelected(id_value) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.preferredColor(.tintColor))
                                }
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                self.handleSelections(id_value)
                            }
                        }
                    }
                }
            } header: {
                if !self.allEntriesHeaderIsEmpty(), !self.isSingleSelection {
                    HStack {
                        self.destinationConfiguration?.allEntriesSectionTitle
                        Spacer()
                        let selectionsCount = self.isTrackingLiveChanges ? self.selections.count : self.selectionsPool.count
                        if self.flattenData(data: self.data).count == selectionsCount {
                            self.destinationConfiguration?.deselectAllAction
                                .onSimultaneousTapGesture {
                                    self.deselectAll()
                                }
                        } else {
                            self.destinationConfiguration?.selectAllAction
                                .onSimultaneousTapGesture {
                                    self.selectAll()
                                }
                        }
                    }
                }
            }.textCase(.none)
        }
    }
    
    @ViewBuilder func selectedSection() -> some View {
        let selectedData = selectedData()
        ForEach(selectedData, id: self.id) { element in
            let id_value = element[keyPath: id]
            HStack {
                self.rowContent(element)
                Spacer().frame(minWidth: 0)
                if self.isItemSelected(id_value) {
                    Image(systemName: "checkmark")
                        .foregroundColor(.preferredColor(.tintColor))
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.handleSelections(id_value)
            }
        }
    }
    
    func selectedData() -> [Data.Element] {
        let s = self.isTrackingLiveChanges ? self.selections : self.selectionsPool
        return self.flattenData(data: self.data).filter { s.contains($0[keyPath: self.id]) }
    }

    func flattenData(data: Data) -> [Data.Element] {
        data.flatMap { element in
            if let children, let childrenData = element[keyPath: children] {
                return self.flattenData(data: childrenData)
            } else {
                return [element]
            }
        }
    }
    
    func filteredDataOnPage() -> [Data.Element] {
        self.data.filter { element in
            if let searchFilter, !searchText.isEmpty {
                return searchFilter(element, self.searchText)
            } else {
                return true
            }
        }
    }
    
    func isItemSelected(_ idValue: ID) -> Bool {
        if self.isTrackingLiveChanges {
            return self.selections.contains(idValue)
        } else {
            return self.selectionsPool.contains(idValue)
        }
    }

    func handleSelections(_ idValue: ID) {
        if self.isTrackingLiveChanges {
            if self.selections.contains(idValue) {
                if !self.allowEmpty, self.selectionsPool.count == 1 {
                    // should not remove the last selection
                } else {
                    self.selections.remove(idValue)
                }
            } else {
                if self.isSingleSelection {
                    self.selections = Set([idValue])
                } else {
                    self.selections.insert(idValue)
                }
            }
        } else {
            if self.selectionsPool.contains(idValue) {
                if !self.allowEmpty, self.selectionsPool.count == 1 {
                    // should not remove the last selection
                } else {
                    self.selectionsPool.remove(idValue)
                }
            } else {
                if self.isSingleSelection {
                    self.selectionsPool = Set([idValue])
                } else {
                    self.selectionsPool.insert(idValue)
                }
            }
        }
    }

    func confirm() {
        self.selections = self.selectionsPool
    }
    
    func selectionsCount() -> Int {
        self.isTrackingLiveChanges ? self.selections.count : self.selectionsPool.count
    }
    
    func selectAll() {
        if self.isTrackingLiveChanges {
            self.selections = Set(self.flattenData(data: self.data).map { $0[keyPath: self.id] })
        } else {
            self.selectionsPool = Set(self.flattenData(data: self.data).map { $0[keyPath: self.id] })
        }
    }
    
    func deselectAll() {
        if self.isTrackingLiveChanges {
            self.selections.removeAll()
        } else {
            self.selectionsPool.removeAll()
        }
    }
}

public extension ListPickerDestinationContent {
    /// As content for `ListPickerDestination`
    init(_ data: Data,
         id: KeyPath<Data.Element, ID>,
         children: KeyPath<Data.Element, Data?>? = nil,
         selection: Binding<ID?>,
         isTrackingLiveChanges: Bool = true,
         searchFilter: ((Data.Element, String) -> Bool)? = nil,
         @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent)
    {
        let s = Binding<Set<ID>>(get: {
            if let s = selection.wrappedValue {
                [s]
            } else {
                []
            }
        }, set: {
            selection.wrappedValue = $0.first
        })
        self.init(data,
                  id: id,
                  children: children,
                  selections: s,
                  isSingleSelection: true,
                  allowEmpty: true,
                  isTrackingLiveChanges: isTrackingLiveChanges,
                  searchFilter: searchFilter,
                  rowContent: rowContent)
    }

    /// As content for `ListPickerDestination`
    init(_ data: Data,
         id: KeyPath<Data.Element, ID>,
         children: KeyPath<Data.Element, Data?>? = nil,
         selection: Binding<ID>,
         isTrackingLiveChanges: Bool = true,
         searchFilter: ((Data.Element, String) -> Bool)? = nil,
         @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent)
    {
        let s = Binding(get: {
            Set([selection.wrappedValue])
        }, set: {
            if let s = $0.first {
                selection.wrappedValue = s
            } else {
                fatalError("Selection should not be empty.")
            }
        })
        self.init(data,
                  id: id,
                  children: children,
                  selections: s,
                  isSingleSelection: true,
                  allowEmpty: false,
                  isTrackingLiveChanges: isTrackingLiveChanges,
                  searchFilter: searchFilter,
                  rowContent: rowContent)
    }

    /// As content for `ListPickerDestination`
    init(_ data: Data,
         id: KeyPath<Data.Element, ID>,
         children: KeyPath<Data.Element, Data?>? = nil,
         selections: Binding<Set<ID>?>,
         isTrackingLiveChanges: Bool = true,
         searchFilter: ((Data.Element, String) -> Bool)? = nil,
         @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent)
    {
        let s = Binding(get: {
            selections.wrappedValue ?? []
        }, set: {
            selections.wrappedValue = $0
        })
        self.init(data,
                  id: id,
                  children: children,
                  selections: s,
                  isSingleSelection: false,
                  allowEmpty: true,
                  isTrackingLiveChanges: isTrackingLiveChanges,
                  searchFilter: searchFilter,
                  rowContent: rowContent)
    }

    /// As content for `ListPickerDestination`
    init(_ data: Data,
         id: KeyPath<Data.Element, ID>,
         children: KeyPath<Data.Element, Data?>? = nil,
         selections: Binding<Set<ID>>,
         isTrackingLiveChanges: Bool = true,
         searchFilter: ((Data.Element, String) -> Bool)? = nil,
         @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent)
    {
        self.init(data,
                  id: id,
                  children: children,
                  selections: selections,
                  isSingleSelection: false,
                  allowEmpty: true,
                  isTrackingLiveChanges: isTrackingLiveChanges,
                  searchFilter: searchFilter,
                  rowContent: rowContent)
    }
}

struct ListPickerDestinationConfigurationEnvironment: EnvironmentKey {
    static let defaultValue: ListPickerDestinationConfiguration? = nil
}

extension EnvironmentValues {
    var listPickerDestinationConfiguration: ListPickerDestinationConfiguration? {
        get { self[ListPickerDestinationConfigurationEnvironment.self] }
        set { self[ListPickerDestinationConfigurationEnvironment.self] = newValue }
    }
}

extension View {
    func listPickerDestinationConfiguration(_ configuration: ListPickerDestinationConfiguration) -> some View {
        self.environment(\.listPickerDestinationConfiguration, configuration)
    }
}

struct DisableEntriesSectionEnvironment: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var disableEntriesSection: Bool {
        get { self[DisableEntriesSectionEnvironment.self] }
        set { self[DisableEntriesSectionEnvironment.self] = newValue }
    }
}

public extension View {
    /// Adds a condition that controls whether entries section can be displayed for `ListPickerDestination`.
    /// - Parameter disabled: A Boolean value that determines whether entries section can be displayed for `ListPickerDestination`.
    /// - Returns: A view that controls whether entries section can be displayed for `ListPickerDestination`.
    func disableEntriesSection(_ disabled: Bool = true) -> some View {
        self.environment(\.disableEntriesSection, disabled)
    }
}
