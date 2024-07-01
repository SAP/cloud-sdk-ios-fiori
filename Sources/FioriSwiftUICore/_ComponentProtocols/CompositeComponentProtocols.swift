import Foundation
import SwiftUI

/// A view that displays information of an object.
// sourcery: CompositeComponent
protocol _ObjectItemComponent: _TitleComponent, _SubtitleComponent, _FootnoteComponent, _DescriptionComponent, _StatusComponent, _SubstatusComponent, _DetailImageComponent, _IconsComponent, _AvatarsComponent, _FootnoteIconsComponent, _TagsComponent, _ActionComponent {}

// sourcery: CompositeComponent, InternalComponent
protocol _DemoViewComponent: _TitleComponent, _SubtitleComponent, _StatusComponent, _ActionComponent, _SwitchComponent {}

// sourcery: CompositeComponent
protocol _LabelItemComponent: _IconComponent, _TitleComponent {
    /// The icon's `HorizontalAlignment`. The default is `leading`.
    var alignment: HorizontalAlignment? { get set }
}

// sourcery: CompositeComponent
protocol _CardMediaComponent: _MediaImageComponent, _DescriptionComponent {}

// sourcery: CompositeComponent
protocol _CardMainHeaderComponent: _TitleComponent, _SubtitleComponent, _IconsComponent, _DetailImageComponent, _HeaderActionComponent, _CounterComponent {}

// sourcery: CompositeComponent
protocol _CardExtHeaderComponent: _Row1Component, _Row2Component, _Row3Component, _KpiComponent, _KpiCaptionComponent {}

// sourcery: CompositeComponent
protocol _CardFooterComponent: _ActionComponent, _SecondaryActionComponent, _TertiaryActionComponent, _OverflowActionComponent {}

// sourcery: CompositeComponent
protocol _CardHeaderComponent: _CardMediaComponent, _CardMainHeaderComponent, _CardExtHeaderComponent {}

// sourcery: CompositeComponent
protocol _CardComponent: _CardHeaderComponent, _CardBodyComponent, _CardFooterComponent {}

// sourcery: CompositeComponent
protocol _IllustratedMessageComponent: _DetailImageComponent, _TitleComponent, _DescriptionComponent, _ActionComponent {
    var detailImageSize: IllustratedMessage.DetailImageSize? { get }
}

// sourcery: CompositeComponent
protocol _InformationViewComponent: _IconComponent, _DescriptionComponent {}

// sourcery: CompositeComponent, InternalComponent
protocol _TextInputInfoViewComponent: _InformationViewComponent, _CounterComponent {}

// sourcery: CompositeComponent
protocol _LinearProgressIndicatorViewComponent: _LinearProgressIndicatorComponent, _IconComponent, _DescriptionComponent {}

// sourcery: CompositeComponent
protocol _FormViewComponent {
    // sourcery: defaultValue = .normal
    /// The `ControlState` of the form view. The default is `normal`
    var controlState: ControlState { get }
    /// The error message of the form view.
    var errorMessage: AttributedString? { get }
}

// sourcery: CompositeComponent
protocol _PlaceholderTextEditorComponent: _TextViewComponent, _PlaceholderComponent {}

// sourcery: CompositeComponent
protocol _NoteFormViewComponent: _PlaceholderTextEditorComponent, _FormViewComponent {
    /// The minimum height of the TextEditor. It needs to be greater than 44. Otherwise, it is ignored.
    var minTextEditorHeight: CGFloat? { get }
    /// The maximum height of the TextEditor.
    var maxTextEditorHeight: CGFloat? { get }
    /// The maximum length of the text.
    var maxTextLength: Int? { get }
    /// The maximum length of the text. Default is no limit.
    var hintText: AttributedString? { get }
    // sourcery: defaultValue = false
    /// This property indicates if the read-only hint is to be hidden or not. Default is `false`.
    var hidesReadOnlyHint: Bool { get }
    // sourcery: defaultValue = false
    /// If `isCharCountEnabled` is true and `maxTextLenght` is not `nil`, the character count number and the `maxValueTextLength` will be shown. The character count number will be updated during editing. The default is `false`.
    var isCharCountEnabled: Bool { get }
    // sourcery: defaultValue = false
    /// If `allowsBeyondLimit` is `true`, it will allow the user to input continuously even after `maxValueTextLength` is reached. It will be in an error state with an error message and a semantic negative color. The default is false.
    var allowsBeyondLimit: Bool { get }
    /// The custom error message when the character count limitation is reached. If this property is `nil`, the default localized message will be used.
    var charCountReachLimitMessage: String? { get }
    /// The custom error message when the character count exceeds the limitation. If this property is `nil`, the default localized message will be used.
    var charCountBeyondLimitMsg: String? { get }
}

// sourcery: CompositeComponent
protocol _KeyValueFormViewComponent: _TitleComponent, _NoteFormViewComponent, _MandatoryField {}

// sourcery: CompositeComponent
protocol _PlaceholderTextFieldComponent: _TextInputFieldComponent, _PlaceholderComponent {}

// sourcery: CompositeComponent
protocol _TitleFormViewComponent: _PlaceholderTextFieldComponent, _FormViewComponent {
    /// The maximum length of the text. Default is no limit.
    var maxTextLength: Int? { get }
    /// The hint text.
    var hintText: AttributedString? { get }
    // sourcery: defaultValue = false
    /// This property indicates if the read-only hint is to be hidden or not. Default is `false`.
    var hidesReadOnlyHint: Bool { get }
    // sourcery: defaultValue = false
    /// If `isCharCountEnabled` is true and `maxTextLenght` is not `nil`, the character count number and the `maxValueTextLength` will be shown. The character count number will be updated during editing. The default is `false`.
    var isCharCountEnabled: Bool { get }
    // sourcery: defaultValue = false
    /// If `allowsBeyondLimit` is `true`, it will allow the user to input continuously even after `maxValueTextLength` is reached. It will be in an error state with an error message and a semantic negative color. The default is false.
    var allowsBeyondLimit: Bool { get }
    /// The custom error message when the character count limitation is reached. If this property is `nil`, the default localized message will be used.
    var charCountReachLimitMessage: String? { get }
    /// The custom error message when the character count exceeds the limitation. If this property is `nil`, the default localized message will be used.
    var charCountBeyondLimitMsg: String? { get }
}

// sourcery: CompositeComponent
protocol _TextFieldFormViewComponent: _TitleComponent, _TitleFormViewComponent, _MandatoryField {
    /// The icon for the action button.
    var actionIcon: Image? { get }
    /// The action to be performed when the action button is tapped.
    var action: (() -> Void)? { get }
}

// sourcery: CompositeComponent
protocol _JouleWelcomeScreen: _MediaImageComponent, _GreetingTextComponent, _TitleComponent, _FootnoteComponent, _MessageContentComponent {}

// sourcery: CompositeComponent
protocol _StepperFieldComponent: _DecrementActionComponent, _TextInputFieldComponent, _IncrementActionComponent {
    /// The step value
    var step: Int? { get }
    
    /// a range of values
    var stepRange: ClosedRange<Int> { get }
}

// sourcery: CompositeComponent
protocol _StepperViewComponent: _TitleComponent, _StepperFieldComponent, _InformationViewComponent {}

/// SideBar: SwiftUI View
///
/// The `SideBar` SwiftUI view presents a expandable list of items using the `SideBarListItem` SwiftUI view. It has support for both edit and view modes. In edit mode, the listed data can be rearranged, and each item can be toggled as hidden. The hidden items are not shown in view mode.
///
/// This View should be used in `NavigationSplitView` as side bar. How, in case you are NOT using the `NavigationSplitView` for the SideBar, you should observe the change of selected item by property 'selection' of SideBar and handle follow-up logic by youself. Also, you should set 'isUsedInSplitView' of SideBar to true and return EmptyView in 'destination' callback.
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
/// The binding property `queryString` was used to trigger the searching on SideBar. The `.searchable` modifier on `NavigationSplieView` can be used to bind the @State variable `queryString` which will bind to SideBar. As the same time, an `UISearchBar` can inititalized in `onAppear` modifier and dismissed in `onDisappear` modifier
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
// sourcery: CompositeComponent
protocol _SideBarComponent {
    // sourcery: @Binding
    /// Indicate whether the edit mode of the side bar is active.
    var isEditing: Bool { get }
    // sourcery: @Binding
    /// The  query string for side bar
    var queryString: String? { get }
    // sourcery: @Binding
    /// The data for the expandable list that will be displayed in side bar
    var data: [SideBarItemModel] { get }
    // sourcery: @Binding
    /// The selected item of the side bar
    var selection: SideBarItemModel? { get }
    /// The title of the side bar.
    var title: AttributedString? { get }
    @ViewBuilder
    /// The footer for the Side bar
    var footer: (() -> any View)? { get }
    @ViewBuilder
    /// The edit button for the Side bar
    var editButton: (() -> any View)? { get }
    /// the destination for the selected item. It only can work when the SideBar was used in NavigationSplitView. For other case, you need observe the 'selection' property to perform the follow-up logic by yourself
    var destination: (SideBarItemModel) -> any View { get }
    /// Construct the row content according to the give SideBarItemModel
    var item: (Binding<SideBarItemModel>) -> any View { get }
    /// The callback event utilized to monitor data changes when the SideBar is in edit mode. This callback should be used if the editButton didn't provided for the SideBar. E,g, the case to wrapper this SwiftUI control in the UIkit.
    var onDataChange: (([SideBarItemModel]) -> Void)? { get }
    // sourcery: defaultValue = "true"
    /// Indicate whether the Side bar was used in NavigationSplitView. The default was true
    var isUsedInSplitView: Bool { get }
}

/// SideBarListItem: SwiftUI View
///
/// A SwiftUI View that displays a row with title, icon, subtitle and accessory icon in `SideBar` SwiftUI View
///
///
// sourcery: CompositeComponent
protocol _SideBarListItemComponent: _IconComponent, _FilledIconComponent, _TitleComponent, _SubtitleComponent, _AccessoryIconComponent, _SwitchComponent {
    /// The data of the side bar item
    var data: SideBarItemModel { get }
    // sourcery: @Binding
    /// Whether the item is selected or not
    var isSelected: Bool { get }
}

// sourcery: CompositeComponent
protocol _MenuSelectionItemComponent: _IconComponent, _TitleComponent {
    var action: (() -> Void)? { get }
}

// sourcery: CompositeComponent
protocol _MenuSelectionComponent: _ActionComponent {
    // sourcery: @Binding
    var isExpanded: Bool { get }
    // sourcery: resultBuilder.name = @ViewBuilder, resultBuilder.backingComponent = _MenuSelectionContainer
    var items: [MenuSelectionItemProtocol] { get }
}

// sourcery: CompositeComponent
protocol _BannerMessageComponent: _TitleComponent, _CloseActionComponent, _TopDividerComponent {
    /// The action to be performed when the banner is tapped.
    var bannerTapAction: (() -> Void)? { get }
}

/// `RatingControl` uses images to represent a rating.
///
/// The number of "On" images denotes the rating.
/// The default "On" image is a filled star while the default "Off" inmage
/// is an unfilled star.
// sourcery: CompositeComponent
protocol _RatingControlComponent {
    // sourcery: @Binding
    /// The rating value.
    var rating: Int { get }

    /// The rating conrol configuration parameters.
    var ratingControlConfig: RatingControlConfig { get }
}
