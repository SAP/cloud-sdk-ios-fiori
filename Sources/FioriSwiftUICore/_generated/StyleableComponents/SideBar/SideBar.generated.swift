// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// SideBar: SwiftUI View
///
/// The `SideBar` SwiftUI view presents a expandable list of items using the `SideBarListItem` SwiftUI view. It has support for both edit and view modes. In edit mode, the listed data can be rearranged, and each item can be toggled as hidden. The hidden items are not shown in view mode.
///
/// This View should be used in `NavigationSplitView` as side bar. How, in case you are NOT using the `NavigationSplitView` for the SideBar, you should observe the change of selected item by property 'selection' of SideBar and handle follow-up logic by yourself. Also, you should set 'isUsedInSplitView' of SideBar to true and return EmptyView in 'destination' callback.
///
/// ## Usage
///
///  ### Initialization:
///
///  Construct the data,, array of `SideBarItemModel`, for the expandable list that will be displayed in side bar.
///
///  ```swift
///  @State private var data: [SideBarItemModel] = [
///      SideBarItemModel(title: "Root Item 0.1", icon: Image(systemName: "square.dashed"), filledIcon: Image(systemName: "square.dashed.inset.filled"), subtitle:
///      "9,999+", accessoryIcon: Image(systemName: "clock"), children: nil),
///      SideBarItemModel(title: "Root Item 0.4", icon: Image(systemName: "cloud.snow"), children: nil),
///      SideBarItemModel(title: "Group 1", children: [
///          SideBarItemModel(title: "Child Item 1.1", icon: Image(systemName: "square.and.pencil"), subtitle: "66", accessoryIcon: Image(systemName: "circle"),
///        children: nil),
///         SideBarItemModel(title: "Child Item 1.2", icon: Image(systemName: "square.and.pencil"), accessoryIcon: Image(systemName: "circle"), children: nil)
///      ]),
///      SideBarItemModel(title: "Group 2", children: [
///          SideBarItemModel(title: "Child Item 2.1", icon: Image(systemName: "folder"), subtitle: "5", accessoryIcon: Image(systemName: "mail"), children: nil)
///     ])
///  ]
///  ```
///  Initialize a `SideBar` with title, edit button, selected item destination view, the binding edit mode indicator, search query string, data, selected item and row item content
///
/// ```swift
///  @State private var isEditing = false
///  @State private var queryString: String?
///  @State private var selection: SideBarItemModel?
///
///  SideBar(
///      isEditing: $isEditing,
///      queryString: $queryString,
///      data: $data,
///      selection: $selection,
///      title: "SideBar",
///      editButton: {
///         // Or use SWiftUI EditButton() here directly if you don't need to check the changed data or customize the label for edit button: EditButton()
///         Button(action: {
///          if !self.isEditing {
///              // Check the listItems
///              for(_, item) in listItems.enumerated() {
///
///              }
///         }
///     }, label: {Text(isEditing ? "Done" : "Edit")}) },
///      destination: { item in
///         DevDetailView(item)
///     },
///     item: { item in
///         SideBarListItem(icon: item.wrappedValue.icon, filledIcon: item.wrappedValue.filledIcon, title: AttributedString(item.wrappedValue.title), subtitle:
///          AttributedString(item.wrappedValue.subtitle ?? ""), accessoryIcon: item.wrappedValue.accessoryIcon, isOn: Binding<Bool>(get: {
///          !item.wrappedValue.isInvisible }, set: { newValue in item.wrappedValue.isInvisible = !newValue}), selection: $selection, data: item.wrappedValue)
///      }
///  )
///  ```
///  ### Handle Search:
///
/// The binding property `queryString` was used to trigger the searching on SideBar. The `.searchable` modifier on `NavigationSplieView` can be used to bind the @State variable `queryString` which will bind to SideBar. As the same time, an `UISearchBar` can initialized in `onAppear` modifier and dismissed in `onDisappear` modifier
///
/// ```swift
/// NavigationSplitView {
///       sideBar
/// }
/// .searchable(text: Binding<String>(get: { self.queryString ?? "" }, set: { newValue in self.queryString = newValue}), prompt: "Search")
/// .onAppear {
///        let searchImage = UIImage(systemName: "magnifyingglass")?
///            .withTintColor(UIColor(Color.preferredColor(.tertiaryLabel)), renderingMode: .alwaysOriginal)
///            .applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .semibold))
///        UISearchBar.appearance().setImage(searchImage, for: .search, state: .normal)
/// }
/// .onDisappear {
///        UISearchBar.appearance().setImage(nil, for: .search, state: .normal)
/// }
///
/// ```
///
public struct SideBar {
    /// Indicate whether the edit mode of the side bar is active.
    @Binding var isEditing: Bool
    /// The  query string for side bar
    @Binding var queryString: String?
    /// The data for the expandable list that will be displayed in side bar
    @Binding var data: [SideBarItemModel]
    /// The selected item of the side bar
    @Binding var selection: SideBarItemModel?
    /// The title of the side bar.
    let title: AttributedString?
    /// The footer for the Side bar
    let footer: any View
    /// The edit button for the Side bar
    let editButton: any View
    /// the destination for the selected item. It only can work when the SideBar was used in NavigationSplitView. For other case, you need observe the 'selection' property to perform the follow-up logic by yourself
    let destination: (SideBarItemModel) -> any View
    /// Construct the row content according to the give SideBarItemModel
    let item: (Binding<SideBarItemModel>) -> any View
    /// The callback event utilized to monitor data changes when the SideBar is in edit mode. This callback should be used if the editButton didn't provided for the SideBar. E,g, the case to wrapper this SwiftUI control in the UIkit.
    let onDataChange: (([SideBarItemModel]) -> Void)?
    /// Indicate whether the Side bar was used in NavigationSplitView. The default was true
    let isUsedInSplitView: Bool

    @Environment(\.sideBarStyle) var style

    var componentIdentifier: String = SideBar.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(isEditing: Binding<Bool>,
                queryString: Binding<String?>,
                data: Binding<[SideBarItemModel]>,
                selection: Binding<SideBarItemModel?>,
                title: AttributedString? = nil,
                @ViewBuilder footer: () -> any View = { EmptyView() },
                @ViewBuilder editButton: () -> any View = { EmptyView() },
                destination: @escaping (SideBarItemModel) -> any View,
                item: @escaping (Binding<SideBarItemModel>) -> any View,
                onDataChange: (([SideBarItemModel]) -> Void)? = nil,
                isUsedInSplitView: Bool = true,
                componentIdentifier: String? = SideBar.identifier)
    {
        self._isEditing = isEditing
        self._queryString = queryString
        self._data = data
        self._selection = selection
        self.title = title
        self.footer = footer()
        self.editButton = editButton()
        self.destination = destination
        self.item = item
        self.onDataChange = onDataChange
        self.isUsedInSplitView = isUsedInSplitView
        self.componentIdentifier = componentIdentifier ?? SideBar.identifier
    }
}

public extension SideBar {
    static let identifier = "fiori_sidebar_component"
}

public extension SideBar {
    init(_ configuration: SideBarConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SideBarConfiguration, shouldApplyDefaultStyle: Bool) {
        self._isEditing = configuration.$isEditing
        self._queryString = configuration.$queryString
        self._data = configuration.$data
        self._selection = configuration.$selection
        self.title = configuration.title
        self.footer = configuration.footer
        self.editButton = configuration.editButton
        self.destination = configuration.destination
        self.item = configuration.item
        self.onDataChange = configuration.onDataChange
        self.isUsedInSplitView = configuration.isUsedInSplitView
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SideBar: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, isEditing: self.$isEditing, queryString: self.$queryString, data: self.$data, selection: self.$selection, title: self.title, footer: .init(self.footer), editButton: .init(self.editButton), destination: self.destination, item: self.item, onDataChange: self.onDataChange, isUsedInSplitView: self.isUsedInSplitView)).typeErased
                .transformEnvironment(\.sideBarStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SideBar {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SideBar(.init(componentIdentifier: self.componentIdentifier, isEditing: self.$isEditing, queryString: self.$queryString, data: self.$data, selection: self.$selection, title: self.title, footer: .init(self.footer), editButton: .init(self.editButton), destination: self.destination, item: self.item, onDataChange: self.onDataChange, isUsedInSplitView: self.isUsedInSplitView))
            .shouldApplyDefaultStyle(false)
            .sideBarStyle(SideBarFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
