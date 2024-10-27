import Foundation
import SwiftUI

/// A view that displays information of an object.
// sourcery: CompositeComponent
protocol _ObjectItemComponent: _TitleComponent, _SubtitleComponent, _FootnoteComponent, _DescriptionComponent, _StatusComponent, _SubstatusComponent, _DetailImageComponent, _IconsComponent, _AvatarsComponent, _FootnoteIconsComponent, _FootnoteIconsTextComponent, _TagsComponent, _ActionComponent {}

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
protocol _IllustratedMessageComponent: _DetailImageComponent, _TitleComponent, _DescriptionComponent, _ActionComponent, _SecondaryActionComponent {
    /// Specifies the size of the detailImage. This value should be an enum from the DetailImageSize set.
    var detailImageSize: IllustratedMessage.DetailImageSize? { get }
    // sourcery: defaultValue = false
    /// Determines the layout of the action buttons. If set to true, the buttons will be arranged vertically. If set to false, they will be arranged horizontally. The default value is false.
    var isActionVerticallyAligned: Bool { get }
    // sourcery: defaultValue = .leading
    /// Determines the alignment of the title, description and the action buttons in the horizontal mode. The default value e is `.leading`.
    var contentAlignment: HorizontalAlignment { get }
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
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _StepperFieldComponent: _DecrementActionComponent, _TextInputFieldComponent, _IncrementActionComponent {
    /// The step value
    // sourcery: defaultValue = 1
    var step: Int { get }
    
    /// a range of values
    var stepRange: ClosedRange<Int> { get }
}

// sourcery: CompositeComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _StepperViewComponent: _TitleComponent, _StepperFieldComponent, _InformationViewComponent {}

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
protocol _BannerMessageComponent: _IconComponent, _TitleComponent, _CloseActionComponent, _TopDividerComponent {
    /// The action to be performed when the banner is tapped.
    var bannerTapAction: (() -> Void)? { get }
    
    /// The icon and title's `HorizontalAlignment`. The default is `center`.
    // sourcery: defaultValue = .center
    var alignment: HorizontalAlignment { get }
    
    /// Hide bottom separator or not. The default is false.
    // sourcery: defaultValue = false
    var hideSeparator: Bool { get }
    
    /// The icon and title's type. The default is `negative`.
    // sourcery: defaultValue = .negative
    var messageType: BannerMultiMessageType { get }
    
    /// Show detail link or not. The default is false. When showDetailLink is true, and click the link will perform to popup the detail sheet.
    // sourcery: defaultValue = false
    var showDetailLink: Bool { get }
}

/// `RatingControl` uses images to represent a rating.
///
/// The number of "On" images denotes the rating.
/// The default "On" image is a filled star while the default "Off" inmage
/// is an unfilled star.
// sourcery: CompositeComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _RatingControlComponent: _ValueLabelComponent, _OnStarImageComponent, _OffStarImageComponent, _HalfStarImageComponent, _ReviewCountLabelComponent {
    // sourcery: @Binding
    /// The rating value.
    var rating: Int { get }

    /// The style of this `RatingControl`.
    // sourcery: defaultValue = ".editable"
    var ratingControlStyle: RatingControl.Style { get }

    /// The range of the rating values. The default is `0...5`.
    // sourcery: defaultValue = 0...5
    var ratingBounds: ClosedRange<Int> { get }

    /// The custom fixed size of each item image view.
    var itemSize: CGSize? { get }

    /// The custom spacing between images.
    var interItemSpacing: CGFloat? { get }

    /// The rating format for displaying rating value.
    /// When this is `nil`, the default format is "%d of %d" where "of" is the localized "of". The first parameter is the rating value while the second parameter is the total number of stars.
    // sourcery: defaultValue = "nil"
    var ratingValueFormat: String? { get }

    /// This property indicates if the value label is to be displayed or not. The default value is `false` for backward compatibility.
    // sourcery: defaultValue = "false"
    var showsValueLabel: Bool { get }

    /// The average rating for read-only style.
    // sourcery: defaultValue = "nil"
    var averageRating: CGFloat? { get }

    /// The format for display the average rating. The default is "%.1f"
    // sourcery: defaultValue = ""%.1f""
    var averageRatingFormat: String { get }

    /// The number of reviews.
    // sourcery: defaultValue = "nil"
    var reviewCount: Int? { get }

    /// The format for the review count string. The default is "%d reviews" where "reviews" is the localized "reviews" string.
    // sourcery: defaultValue = "nil"
    var reviewCountFormat: String? { get }

    /// The ceiling number to be displayed for review count. If the `reviewCount` is larger than this number, this number will be displayed with a "+" sign after the number.
    // sourcery: defaultValue = "nil"
    var reviewCountCeiling: Int? { get }

    /// The format for the review count string when the count is over the ceiling. The default is "%d+ reviews" where "reviews" is the localized "reviews" string.
    // sourcery: defaultValue = "nil"
    var reviewCountCeilingFormat: String? { get }

    /// This property indicates if the review count label is to be displayed or not. The default value is `false` for backward compatibility.
    // sourcery: defaultValue = "false"
    var showsReviewCountLabel: Bool { get }
}

/// `TimelineMarker` is a non-selectable view intended for timelineMarkers that require beforeStart, start, beforeEnd and end status that displays timelineMarker details.
/// It uses a vertical line and `timelineNode` as a separator. To the left of the vertical line is the timeline timestamp stack view that contains `timestamp` and `secondaryTimestamp`. To the right of the vertical line is the main stack view that contains  `title`. There is a divider line as separator under main stack.
///
/// ## Notes
/// ### Separator between TimelineMarker Items in the List
/// All list styles in SwiftUI include separators by default. This is why there is a separator between two timelineMarker items in the list. To get rid of the separator, set ‘listRowSeparator’ modifier to hidden.
///
/// ## Usage
/// ```swift
/// TimelineMarker(timestamp: "06/20/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .beforeStart, title: "Before Start", isPast: true, showUpperVerticalLine: false)
/// TimelineMarker(timestamp: "06/20/24", secondaryTimestamp: .text("Sunny"), timelineNode: .beforeEnd, title: "Before End", isPresent: true)
/// ```
// sourcery: CompositeComponent
protocol _TimelineMarkerComponent: _TimestampComponent, _SecondaryTimestampComponent, _TimelineNodeComponent, _IconComponent, _TitleComponent {
    // sourcery: defaultValue = false
    /// check if event is past
    var isPast: Bool { get }
    
    // sourcery: defaultValue = false
    /// check if event is present
    var isPresent: Bool { get }
    
    // sourcery: defaultValue = true
    /// Show upper vertical line or not. Default is to show.
    var showUpperVerticalLine: Bool { get }

    // sourcery: defaultValue = true
    /// Show lower vertical line or not. Default is to show.
    var showLowerVerticalLine: Bool { get }
}

/// `Timeline` is a selectable view intended for timelines that require open, inProgress and complete status that displays timeline details.
///  It uses a vertical line and `timelineNode` as a separator. To the left of the vertical line is the timeline timestamp stack view that contains `timestamp` and `secondaryTimestamp`. To the right of the vertical line is the main stack view that contains  title view and attribute view. Title view contains `title`, ‘subtitle’, ‘status’, ‘substatus’, below the title view is an attribute view with ‘ attribute’ and ‘subAttribute’. There is a divider line as separator under main stack.
///
///  ## Notes
/// ### Separator between Timeline Items in the List
/// All list styles in SwiftUI include separators by default. That is why there is a separator between two timeline items in the list. To get rid of the separator, set ‘listRowSeparator’ modifier to hidden.
///
/// ## Usage
/// ```swift
/// Timeline(timestamp: "06/21/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .complete, title: "Complete(Disabled)", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr", isPast: true)
/// Timeline(timestamp: "06/21/24", secondaryTimestamp: .text("Sunny"), timelineNode: .open, title: "Open", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr")
/// ```
// sourcery: CompositeComponent
protocol _TimelineComponent: _TimestampComponent, _SecondaryTimestampComponent, _TimelineNodeComponent, _IconComponent, _TitleComponent, _SubtitleComponent, _AttributeComponent, _StatusComponent, _SubstatusComponent, _SubAttributeComponent {
    // sourcery: defaultValue = false
    /// check if event is past
    var isPast: Bool { get }

    // sourcery: defaultValue = false
    /// check if event is present
    var isPresent: Bool { get }
}

/// `TimelineNowIndicator` is used to present now indicator in a Timeline view.
/// It uses a node view and  horizontal line to present now indicator.
///
/// ## Notes
/// ### Minimum list row height between Timeline Items in the List
/// Since the default size of node image on the TimelineNowIndicator is 7 pixels, in order to display TimelineNowIndicator correctly in the List, set the minimum height for all row in a List using the .environment(\.defaultMinListRowHeight, value) modifier on the List, the value should be less than or equal to 7.
// sourcery: CompositeComponent
protocol _TimelineNowIndicatorComponent: _NowIndicatorNodeComponent {}

/// The form view which contains a title, rating control, and a subtitle
// sourcery: CompositeComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _RatingControlFormViewComponent: _TitleComponent, _RatingControlComponent, _SubtitleComponent {
    /// Indicates if the axis for displaying the title and rating control.
    // sourcery: defaultValue = .horizontal
    var axis: Axis { get }
}

// sourcery: CompositeComponent
protocol _ProfileHeaderComponent: _DetailImageComponent, _TitleComponent, _SubtitleComponent, _DescriptionComponent {
    // sourcery: defaultValue = "false"
    /// Indicate whether the profile header was animatable in scroll view. The default was false.
    var animatable: Bool { get }
    
    @ViewBuilder
    /// The detail content for the profile header.
    var detailContent: (() -> any View)? { get }
}

/// `SegmentedControlPicker` provides a segmented style `Picker` with Fiori styling.
///
/// ## Usage
/// ```swift
/// @State var selectedIndex: Int = 0
///
/// SegmentedControlPicker(options: ["Segment 1", "Segment 2", "Segment 3"], selectedIndex: $selectedIndex)
/// ```
// sourcery: CompositeComponent
protocol _SegmentedControlPickerComponent: _OptionsComponent {
    // sourcery: @Binding
    /// The selected value index of the Picker
    var selectedIndex: Int { get }
}

/// 'TimelinePreviewItem' is an item specialized for placement in TimelinePreview.
// sourcery: CompositeComponent
protocol _TimelinePreviewItemComponent: _TitleComponent, _IconComponent, _TimelineNodeComponent, _TimestampComponent {
    // sourcery: defaultValue = false
    /// The node is in future or not. Default is not in future.
    var isFuture: Bool { get }
    /// Timeline node type
    var nodeType: TimelineNodeType { get }
}

/// `TimelinePreview` is an view for showing a collection of tasks. It comes with a header and a collection view which uses `TimelinePreviewItem` to represent data items within it.
///
/// ## Usage
/// ```swift
/// Create a struct that conforms to the protocol: TimelinePreviewItemModel, providing implementation for the required properties and methods:
/// struct TimelinePreviewItemModelImplementation: TimelinePreviewItemModel {
///    var id: UUID
///    var title: AttributedString
///    var icon: Image?
///    var timelineNode: FioriSwiftUICore.TimelineNodeType
///    var due: Date
///    var formatter: DateFormatter?
///    var isFuture: Bool?
///    var isCurrent: Bool?
///
///    init(id: UUID = UUID(), title: AttributedString, icon: Image? = nil, timelineNode: FioriSwiftUICore.TimelineNodeType, due: Date, dateFormat: String? = nil, isFuture: Bool? = nil, isCurrent: Bool? = nil) {
///        self.id = id
///        self.title = title
///        self.icon = icon
///        self.timelineNode = timelineNode
///        self.due = due
///        self.formatter = DateFormatter()
///        if let dateFormat {
///            self.formatter.dateFormat = dateFormat
///        } else {
///            self.formatter.dateFormat = "MMMM dd yyyy"
///        }
///        self.isFuture = isFuture
///        self.isCurrent = isCurrent
///    }
/// }
///
/// Create a Protocol Instance array with Initial Value
/// @State private var items: [TimelinePreviewItemModelImplementation] = [TimelinePreviewItemModelImplementation(title: "Complete", timelineNode: TimelineNodeType.complete, due: ISO8601DateFormatter().date(from: "2023-07-21T12:00:00Z")!),TimelinePreviewItemModelImplementation(title: "End", timelineNode: TimelineNodeType.end, due: ISO8601DateFormatter().date(from: "2023-08-10T12:00:00Z")!)]
///
///  Create TimelinePreview with the array
/// TimelinePreview(optionalTitle: { Text("Timeline") }, data: .constant(items.map { $0 as any TimelinePreviewItemModel }))
/// ```
// sourcery: CompositeComponent
protocol _TimelinePreviewComponent: _OptionalTitleComponent, _ActionComponent {
    // sourcery: @Binding
    /// The data for all timelinePreviewItems
    var items: [any TimelinePreviewItemModel] { get }
}

/// `SwitchView`provides a Fiori style title and`Toggle`.
///
/// ## Usage
/// ```swift
/// @State var isOn: Bool = true
///
/// SwitchView(title: "Switch", isOn: self.$isOn)
/// ```
// sourcery: CompositeComponent
protocol _SwitchViewComponent: _TitleComponent, _SwitchComponent {}

/// `DateTimePicker`  provides a title and value label with Fiori styling and a `DatePicker`.
///
/// ## Usage
/// ```swift
/// @State var selection: Date = .init(timeIntervalSince1970: 0.0)
/// @State var isRequired = false
/// @State var showsErrorMessage = false
///
/// DateTimePicker(title: "Default", isRequired: self.isRequired, selectedDate: self.$selection)
///    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("The Date should be before December."))
///    .informationViewStyle(.informational)
/// ```
// sourcery: CompositeComponent
protocol _DateTimePickerComponent: _TitleComponent, _ValueLabelComponent, _MandatoryField, _FormViewComponent {
    // sourcery: @Binding
    var selectedDate: Date { get }
    
    // sourcery: defaultValue = [.date, .hourAndMinute]
    /// The components shown in the date picker, default value shows date and time.
    var pickerComponents: DatePicker.Components { get }
    
    // sourcery: defaultValue = .abbreviated
    /// The custom style for displaying the date. The default value is `.abbreviated`, showing for example, "Oct 21, 2015".
    var dateStyle: Date.FormatStyle.DateStyle { get }
    
    // sourcery: defaultValue = .shortened
    /// The custom style for displaying the time. The default value is `.shortened`, showing for example, "4:29 PM" or "16:29".
    var timeStyle: Date.FormatStyle.TimeStyle { get }
    
    /// The text to be displayed when no date is selected. If this property is `nil`, the localized string “No date selected” will be used.
    var noDateSelectedString: String? { get }
}

// sourcery: CompositeComponent
protocol _AvatarStackComponent: _AvatarsComponent, _AvatarsTitleComponent {}

/// `ListPickerItem` is a view that provides a `NavigationLink` with a title and selected value(s). And `ListPickerDestination` is recommended to be used as its destination, for which selection, search filter and customized rows are supported.
/// ## Usage
/// ```swift
/// let data = ["first", "second", "third"]
/// var body: some View {
///     ListPickerItem(title: {
///         Text("title")
///     }, value: {
///         Text("value")
///     }, axis: .vertical) {
///         ListPickerDestination(data,
///                               id: \.self,
///                               selection: $selection,
///                               isTrackingLiveChanges: true,
///                               searchFilter: { f, s in f.contains(s) }, rowContent: {
///             Text($0)
///         })
///     }
/// }
///
/// // If you want grouped different sections, the protocol `ListPickerSectionModel` is need be implemented for your element of data.
///
/// struct ListPickerSection: ListPickerSectionModel {}
/// let data = [ListPickerSection(title: "Section 1", items: ["first", "second", "third"]),
///             ListPickerSection(title: "Section 2", items: ["apple", "banana", "orange"])]
/// var body: some View {
///     ListPickerItem(title: {
///         Text("title")
///     }, value: {
///         Text("value")
///     }, axis: .vertical) {
///         ListPickerDestination(data,
///                               id: \.self,
///                               selection: $selection,
///                               isTrackingLiveChanges: true,
///                               searchFilter: { f, s in f.contains(s) }, rowContent: {
///             Text($0)
///         })
///     }
/// }
/// ```
// sourcery: CompositeComponent
protocol _ListPickerItemComponent: _TitleComponent, _ValueComponent {
    // sourcery: defaultValue = .horizontal
    var axis: Axis { get }
    
    @ViewBuilder
    var destination: (() -> any View)? { get }
}

/// `ListPickerDestination` is a view that provides a customizable list for `ListPickerItem` with selection, search filter and  rows.
///
// sourcery: CompositeComponent
protocol _ListPickerDestinationComponent: _CancelActionComponent, _ApplyActionComponent, _SelectedEntriesSectionTitleComponent, _SelectAllActionComponent, _DeselectAllActionComponent, _AllEntriesSectionTitleComponent, _ListPickerContentComponent {}

// sourcery: CompositeComponent
protocol _ToastMessageComponent: _IconComponent, _TitleComponent {
    // sourcery: defaultValue = 1
    /// The duration in seconds for which the toast message is shown. The default is `1`.
    var duration: Double { get }
}
