import Foundation
import SwiftUI

// swiftlint:disable file_length

/// A view that displays information of an object.
// sourcery: CompositeComponent
protocol _ObjectItemComponent: _TitleComponent, _SubtitleComponent, _FootnoteComponent, _DescriptionComponent, _StatusComponent, _SubstatusComponent, _DetailImageComponent, _IconsComponent, _AvatarsComponent, _FootnoteIconsComponent, _FootnoteIconsTextComponent, _TagsComponent, _ActionComponent {
    // sourcery: @ViewBuilder
    /// For accessory enhancement
    var objectItemButton: FioriButton? { get }
}

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
protocol _TextInputFieldComponent {
    // sourcery: @Binding
    var text: String { get set }
    // sourcery: defaultValue = false
    var isSecureEnabled: Bool? { get set }
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
    /// The accessibility label for the action icon
    var actionIconAccessibilityLabel: String? { get }
}

// sourcery: CompositeComponent
protocol _JouleWelcomeScreen: _MediaImageComponent, _GreetingTextComponent, _TitleComponent, _FootnoteComponent, _MessageContentComponent {}

// sourcery: CompositeComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _StepperFieldComponent: _DecrementActionComponent, _TextInputFieldComponent, _IncrementActionComponent {
    /// The step value
    // sourcery: defaultValue = 1
    var step: Double { get }
    
    /// a range of values
    var stepRange: ClosedRange<Double> { get }
    
    /// Indicates whether the stepper field  supports decimal values. Default is false.
    // sourcery: defaultValue = false
    var isDecimalSupported: Bool { get }
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
protocol _ListPickerItemComponent: _TitleComponent, _ValueComponent, _MandatoryField, _FormViewComponent {
    // sourcery: defaultValue = .horizontal
    var axis: Axis { get }
    
    @ViewBuilder
    var destination: (() -> any View)? { get }
}

/// `ListPickerDestination` is a view that provides a customizable list for `ListPickerItem` with selection, search filter and  rows.
///
// sourcery: CompositeComponent
protocol _ListPickerDestinationComponent: _CancelActionComponent, _ApplyActionComponent, _SelectedEntriesSectionTitleComponent, _SelectAllActionComponent, _DeselectAllActionComponent, _AllEntriesSectionTitleComponent, _ListPickerContentComponent, _PromptComponent {}

// sourcery: CompositeComponent
protocol _ToastMessageComponent: _IconComponent, _TitleComponent {
    // sourcery: defaultValue = 1
    /// The duration in seconds for which the toast message is shown. The default value is `1`.
    var duration: Double { get }
    // sourcery: defaultValue = .center
    /// The position of the toast message relative to its parent view. `.center` puts the toast message in the center of its parent view, `.above` aligns it above the view, and `.below` aligns it below the view. The default value is `.center`.
    var position: ToastMessagePosition { get }
    // sourcery: defaultValue = 0
    /// The amount of spacing to put in between the toast message and the frame of its parent view. This only applies to the `.above` and `.below` positions, and negative values are converted to `0`. The default value is `0`.
    var spacing: CGFloat { get }
    // sourcery: defaultValue = 14
    /// A number specifying how rounded the corners of the view should be. The default value is `14`.
    var cornerRadius: CGFloat { get }
    // sourcery: defaultValue = Color.preferredColor(.tertiaryFill)
    /// The background color of the view. The default value is `Color.preferredColor(.tertiaryFill)`.
    var backgroundColor: Color { get }
    // sourcery: defaultValue = 0
    /// The width of the border surrounding the toast message. The default value is `0`.
    var borderWidth: CGFloat { get }
    // sourcery: defaultValue = Color.clear
    /// The color of the border surrounding the toast message. The default value is `Color.clear`.
    var borderColor: Color { get }
    // sourcery: defaultValue = FioriShadowStyle.level3
    /// A shadow to render underneath the view. The default value is `FioriShadowStyle.level3`.
    var shadow: FioriShadowStyle? { get }
}

// sourcery: CompositeComponent
protocol _BannerMultiMessageSheet: _TitleComponent, _CloseActionComponent {
    /// callback when this component want to dismiss itself
    var dismissAction: (() -> Void)? { get }
    /// callback when category or single item is removed
    var removeAction: ((String, UUID?) -> Void)? { get }
    /// callback when the link button is clicked
    var viewDetailAction: ((UUID) -> Void)? { get }
    // sourcery: defaultValue = true
    /// the mark to turn on section header or not
    var turnOnSectionHeader: Bool { get }
    // sourcery: defaultValue = "{ _ in EmptyView() }"
    // sourcery: resultBuilder.defaultValue = "{ _ in EmptyView() }"
    /// view for each item under the category
    @ViewBuilder
    var messageItemView: (UUID) -> any View { get }
    // sourcery: @Binding
    /// the data source for banner multi-message sheet
    var bannerMultiMessages: [BannerMessageListModel] { get }
}

/// `FilterFormView` provides a view with options for filter, include title, mandatory, options and validation message.
/// ##Usage
/// ```swift
/// FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, fixed", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterFixedSelectionValue, buttonSize: .fixed)
///    .filterFormOptionMinTouchHeight(50)
///    .filterFormOptionCornerRadius(16)
///    .filterFormOptionTitleSpacing(4)
///    .filterFormOptionPadding(EdgeInsets(top: 4, leading: 9, bottom: 4, trailing: 9))
///    .filterFormOptionsItemSpacing(16)
///    .filterFormOptionsLineSpacing(10)
///    .filterFormOptionAttributes([
///        .enabledUnselected: [
///            .strokeWidth: 1.0,
///            .strokeColor: Color.preferredColor(.separator),
///            .foregroundColor: Color.preferredColor(.tertiaryLabel),
///            .backgroundColor: Color.preferredColor(.tertiaryFill),
///            .font: Font.system(.body)
///        ]
///    ])
///    ```

// sourcery: CompositeComponent
protocol _FilterFormViewComponent: _TitleComponent, _MandatoryField, _OptionsComponent, _FormViewComponent {
    var isEnabled: Bool { get }
    // sourcery: defaultValue = true
    /// Indicates whether the user may select multiple values. The default is `true`
    var allowsMultipleSelection: Bool { get }
    // sourcery: defaultValue = false
    var allowsEmptySelection: Bool { get }
    // sourcery: @Binding
    /// The indexes for the selected value in the valueOptions.
    var value: [Int] { get }
    // sourcery: defaultValue = .fixed
    /// Size of filter button.
    var buttonSize: FilterButtonSize { get }
    // sourcery: defaultValue = true
    /// Allow chips to layout on the same line as the title
    var isSingleLine: Bool { get }
    /// Implementation of value change callback.  Is invoked on changes to the `value` property.
    var onValueChange: (([Int]) -> Void)? { get }
}

/// This is just a mandatoryFieldIndicator flag protocol. With this protocol, the extension init api will append two more parameters: `isRequired` with false default value and `mandatoryFieldIndicator` with .text("*") default value. If `isRequired` is true, the `mandatoryFieldIndicator` will follow the last character of the title and be a part of title View.
protocol _MandatoryField {}

// sourcery: CompositeComponent
protocol _LoadingIndicatorComponent: _TitleComponent, _ProgressComponent {
    // sourcery: defaultValue = 0
    /// The duration in seconds for which the loading indicator is shown. If set to 0, the loading indicator will be displayed continuously. The default is `0`.
    var duration: Double { get }
    
    // sourcery: @Binding
    var isPresented: Bool { get }
    
    // sourcery: defaultValue = false
    var isAIEnabled: Bool { get }
}

/// `ValuePicker`  provides a title and value label with Fiori styling and a wheel-style `Picker`.
/// ## Usage
/// ```swift
/// let valueOptions :[AttributedString] = ["1", "20", "300"]
/// @State var selectedIndex: Int = 0
/// @State var isRequired = false
/// @State var stateIndex: Int = 0
/// @State var isTrackingLiveChanges = true
/// @State var showsErrorMessage = false
//  ValuePicker(title: "Picker Title(Default Style)", isRequired: self.isRequired, options: self.valueOptions, selectedIndex: self.$selectedIndex, isTrackingLiveChanges: self.isTrackingLiveChanges).informationView(isPresented: self.$showsErrorMessage, description: AttributedString("Please choose one available data")).informationViewStyle(.informational)
/// ```
// sourcery: CompositeComponent
protocol _ValuePickerComponent: _TitleComponent, _ValueLabelComponent, _MandatoryField, _OptionsComponent {
    // sourcery: @Binding
    /// The index for the selected value in the valueOptions.
    var selectedIndex: Int { get }

    /// When `isTrackingLiveChanges` is true, the value will be shown every time a selection is made. If it is set to false, the value will only be displayed when the value picker is collapsed. The default setting is true.
    // sourcery: defaultValue = true
    var isTrackingLiveChanges: Bool { get set }

    /// This property indicates whether the picker is to always be displayed. The default is false.
    // sourcery: defaultValue = false
    var alwaysShowPicker: Bool { get set }
    
    // sourcery: defaultValue = .normal
    /// The `ControlState` of the  view. Currently, `.disabled`, `.normal` and `.readOnly` are supported. The default is `normal`.
    var controlState: ControlState { get }
}

/// `ProgressIndicator` provides a circular progress indicator with custom styles for processing, pausable, and stoppable indicators.
///
/// ## Usage
/// ```swift
/// @State var progress: Double = 0.0
/// @State var isPaused: Bool = false
///
/// ProgressIndicator(progress: $progress)
///    .progressIndicatorStyle(.processing)
/// ProgressIndicator(progress: $progress)
///     .progressIndicatorStyle(ProgressIndicatorPausableStyle(isPaused: self.$isPaused))
/// ```
// sourcery: CompositeComponent
protocol _ProgressIndicatorComponent: _ProgressIndicatorProtocol {}

/// `ProcessingIndicator` provides a circular indeterminate indicator with an optional title below the indicator.
///
/// ## Usage
/// ```swift
/// ProcessingIndicator(optionalTitle: "Processing")
/// ```
// sourcery: CompositeComponent
protocol _ProcessingIndicatorComponent: _OptionalTitleComponent {}

/// `KPIProgressItem` enables a developer to present "KPI" information in a formatted manner consistent with the Fiori Design Language
///
/// ## Usage
/// ```swift
/// let percentData = KPIItemData.percent(0.65)
/// let fractionData = KPIItemData.fraction(76, 90, numberFormatterProvider.numberFormatter)
///
/// KPIProgressItem(kpiCaption: "Completed", data: .constant(percentData))
/// KPIProgressItem(kpiCaption: "In progress", data: .constant(fractionData), chartSize: .small)
/// ```
// sourcery: CompositeComponent
protocol _KPIProgressItemComponent: _KPIContentComponent, _KpiCaptionComponent, _FootnoteComponent, _InnerCircleComponent, _OuterCircleComponent {
    // sourcery: @Binding
    var data: KPIItemData { get }
    
    // sourcery: defaultValue = .large
    var chartSize: KPIProgressItemSize { get }
}

/// `ActivityItem` provides a customizable activity item with an icon and a subtitle.
///
/// ## Usage
/// ```swift
/// ActivityItem(icon: Image(systemName: "phone"), subtitle: AttributedString("phone"))
/// ```
// sourcery: CompositeComponent
protocol _ActivityItemComponent: _IconComponent, _SubtitleComponent {
    /// Activity item layout. The default is .vertical
    // sourcery: defaultValue = .vertical
    var layout: ActivityItemLayout { get }
}

/// `ContactItem` provides a view that shows information related to contact.
/// ## Usage
/// ```swift
/// ContactItem(title: "Headline only example", description: "One line of text description is baseline aligned.", actionItems: [.init(type: .phone, didSelectActivityItem: {
///     print("tap phone")
/// }), .init(type: .videoCall, didSelectActivityItem: {
///     print("tap videoCall")
/// }), .init(type: .message, didSelectActivityItem: {
///     print("tap message")
/// })])
///
/// ContactItem {
///      Text("Headline only example")
/// } subtitle: {
///      Text("One line of text description is baseline aligned.")
/// } description: {
///      Text("Description")
/// } detailImage: {
///      Image("person_square4").resizable()
/// } actionItems: {
///      ActivityItems(activityItems: [.init(type: .phone, didSelectActivityItem: {
///          print("tap phone")
///      })])
/// }
/// ```
// sourcery: CompositeComponent
protocol _ContactItemComponent: _TitleComponent, _SubtitleComponent, _DescriptionComponent, _DetailImageComponent, _ActivityItemsComponent {}

/// `WelcomeScreen` is used to display a welcome/launch screen to the application for onboarding.  The screen mainly displays the application name, instructions on how to start the activation process and an option to trigger the demo mode of the application.
/// ## Usage
/// ```
/// WelcomeScreen(title: {
///     Text(titleStr)
/// }, description: {
///     Text(descriptionStr)
/// }, icon: {
///     Image("oski")
/// }, footnote: {
///     Text("Want to explore?")
/// }, action: {
///     FioriButton { _ in
///         //
///     } label: { _ in
///         Text(primaryButtonTitleStr)
///             .multilineTextAlignment(.center)
///     }
/// }, secondaryAction: {
///     //
/// }, illustratedMessage: {
///     //
/// }, headlineImage: {
///     Image("SAPLogo")
/// }, inputText: self.$email, legalText: {
///     Text("legal text")
/// }, isLegalAgreementRequired: isLegalAgreementRequired, showsIllustratedMessage: self.showsIllustratedMessage, state: state, options: options, isDemoAvailable: isDemoAvailable, footerText: {
///    if showTermsOfService, type != .link, type != .customLogo {
///        Text("footer text")
///    }
/// })
/// ```
// sourcery: CompositeComponent
protocol _WelcomeScreenComponent: _TitleComponent, _DescriptionComponent, _IconComponent, _FootnoteComponent, _ActionComponent, _SecondaryActionComponent {
    // sourcery: @ViewBuilder
    var illustratedMessage: IllustratedMessage? { get }
    
    @ViewBuilder
    ///  This image view is to be displayed on the top center of the welcome screen and is typically the company logo image.
    var headlineImage: (() -> any View)? { get }
    // sourcery: @Binding
    // sourcery: defaultValue = ".constant("")"
    var inputText: String { get }
    // sourcery: @ViewBuilder
    var legalText: AttributedString? { get }
    // sourcery: defaultValue = false
    /// A flag indicating whether the user must agree to a legal agreement before proceeding. Default is false.
    /// When set to `true`, a checkbox with user-defined text in `legalTextView` will be displayed. The `primaryActionButton` will remain disabled until the checkbox is selected. Otherwise, both the `legalCheckbox` and `legalTextView` will be hidden.
    var isLegalAgreementRequired: Bool { get }
    // sourcery: defaultValue = false
    /// A flag determines whether the illustration message is displayed. Default is false. When `showsIllustratedMessage` is set to `true`, the `illustratedMessage` will be shown and the `description` will be hidden. Conversely, when `showsIllustratedMessage` is set to `false`, the `description` will be displayed and the `illustratedMessage` will be hidden.
    var showsIllustratedMessage: Bool { get }
    
    // sourcery: defaultValue = .notConfigured
    /// A property to indicate the state in the onboarding process. The default is `.notConfigured`, to indicate the application has not been configured and additionally setting `options` to allow end-users to provide configuration settings during onboarding.  An `.isConfigured` state indicates that the application contains the necessary configurations to connect to mobile services and should prompt the user to Start.
    /// - See `FUIWelcomeControllerConfigurationOption` for possible configuration options when `state` is `.notConfigured`
    var state: WelcomeScreenState { get }
    
    // sourcery: defaultValue = Set<WelcomeScreenOption>()
    /// A property to indicate the configuration option(s) in the onboarding process when `state` is `.notConfigured`.  Default sets no configuration options.
    var options: Set<WelcomeScreenOption> { get }
    
    // sourcery: defaultValue = true
    /// A flag to indicate demo availability.  Default is true.  Only when it's true, display `Want to explore` label and `Try the Demo` button.  Corresponding `delegate` function is `didSelectDemoMode(_:)` if the property is true.
    var isDemoAvailable: Bool { get }
    
    // sourcery: @ViewBuilder
    /// Designated for displaying text on the footer of the Welcome screen, such as terms of service.
    var footerText: AttributedString? { get }
}

// sourcery: CompositeComponent
protocol _RangeSliderControlComponent: _LowerThumbComponent, _UpperThumbComponent, _ActiveTrackComponent, _InactiveTrackComponent {
    // sourcery: @Binding
    /// The lower value of range slider.
    var lowerValue: Double { get }
    
    // sourcery: @Binding
    /// The upper value of range slider
    var upperValue: Double { get }
    
    // sourcery: defaultValue = 0...100
    /// The range of the slider values. The default is `0...100`.
    var range: ClosedRange<Double> { get }
    
    // sourcery: defaultValue = 1
    /// The incremental/decremental value when the thumb changes its position. The default is `1`.
    var step: Double { get }
    
    // sourcery: defaultValue = 0
    /// This property specifies the number of digits that should appear after the decimal point in the Double value for slider value or lower/upper value for range slider . It controls the precision of the numerical representation by determining how many decimal places are displayed or used in calculations, rounding the Double accordingly. The default is `0`
    var decimalPlaces: Int { get }
    
    // sourcery: defaultValue = 14
    /// The half-width of the thumb. This value only takes effect for a range slider. In the context of a circular representation of the thumb, this value is used as the radius. It should be less than 22. The default value is `14`.
    var thumbHalfWidth: CGFloat { get }
    
    // sourcery: defaultValue = "true"
    /// Indicates whether the lower thumb is to be displayed or not. The default value is `true`
    var showsLowerThumb: Bool { get }
    
    // sourcery: defaultValue = "true"
    /// Indicates whether the upper thumb is to be displayed or not. The default value is `true`
    var showsUpperThumb: Bool { get }
    
    /// An optional callback function that is triggered when the user begins to drag either the lower or upper thumb along the range slider's track or edit the value in text field to adjust the slider's values. The first boolean parameter indicates whether the editing has begun or ended, with `false` signifying that the editing has ended. The second parameter is a double that represents the updated lower value, while the third parameter (also a double) represents the updated upper value.
    var onRangeValueChange: ((Bool, Double, Double) -> Void)? { get }
}

/// The `FioriSlider` is a SwiftUI component that provides both a standard slider and a range slider.
/// The standard slider allows users to select a single value, while the range slider allows users to select a range of values with two thumbs.
///
/// ## Usage
///
/// ### Standard Slider:
///
/// A standard slider consists of a title, a bound value, and a "thumb" (an image that users can drag along a linear "track".
/// The track represents a continuum between two extremes: a minimum and a maximum value.
/// By default, the formatted minimum value is displayed at the leading end of the slider, and the formatted maximum value is displayed at the trailing end of the slider.
///
/// The title is displayed at the top left of the component, while the bound value is displayed at the top right. As users move the thumb, the slider continuously updates its bound value to reflect the thumb’s position.
///
/// The following example illustrates a standard slider bound to the value `speed`. The slider uses the default range of `0` to `100`, with a default step of `1`.
/// The minimum value of the range is displayed as the leading accessory view label, while the maximum value is shown as the trailing accessory view label.
/// As the slider updates the `speed` value, the updated value is displayed in a label at the top right of the slider.
///
///  ```swift
///  @State private var speed: Double = 20
///
///  FioriSlider(
///      title: "Speed Limit",
///      value: $speed,
///      description: "Simple standard slider"
///  )
///  ```
///
/// You can also use the `range` parameter to specify the value range of the slider.
/// The `step` parameter allows you to define incremental steps along the slider's path.
/// The `decimalPlaces` parameter can be used to manage the decimal places of the slider's value.
/// To format the bound value for display, use the `valueFormat` parameter.
/// The `leadingValueFormat` parameter customizes the leading value label, which displays the minimum value of the range.
/// Similarly, the `trailingValueFormat` parameter customizes the trailing value label, which displays the maximum value of the range.
/// Additionally, you can use the `showsValueLabel`, `showsLeadingAccessory`, and `showsTrailingAccessory` parameters to control the display of the related labels.
/// The `onValueChange` closure passed to the slider provides callbacks when the user drags the slider.
///
///  ```swift
///  @State private var speed: Double = 20
///
///  FioriSlider(
///      title: "Speed Limit",
///      value: $speed,
///      range: 10...200,
///      step: 2.5,
///      decimalPlaces: 1,
///      description: "Simple standard slider",
///      valueLabelFormat: "%.1f KM",
///      leadingLabelFormat: "%.1f KM",
///      trailingLabelFormat: "%.1f KM",
///      onValueChange: { isEditing, newSpeed in
///         if !isEditing {
///             print("The speed was changed to: " + String(format: "%.1f", value))
///         }
///      }
///  )
///  ```
/// The example above illustrates a standard slider with a range of `10` to `200` and a step increment of `2.5`.
/// Therefore, the slider's increments would be `10`, `12.5`, `15`, and so on.
/// At the same time, the minimum value of the range is formatted and displayed as `10.0 KM`.
/// Similarly, the maximum value of the range is formatted and displayed as `200.0 KM`.
/// The updated value can be received within the `onValueChange` closure callback when the user drags the slider.
///
/// The slider also uses the `step` to increase or decrease the value when a
/// VoiceOver user adjusts the slider with voice commands.
///
/// The `FioriSlider` supports a modifier called `accessibilityAdjustments`, which allows you to adjust the accessibility settings for a standard slider according to the Fiori Slider guidelines.
///
/// ### Range Slider:
///
/// A range slider consists of a title, a bound lower value, a bound upper value, and two "thumbs" (images that users can drag along a linear "track").
/// The track represents a continuum between two extremes: a minimum and a maximum value.
/// By default, the formatted lower value is displayed in a text field at the leading end of the slider, and the formatted upper value is displayed in a text field at the trailing end of the slider.
/// The title is displayed at the top left of the component. As users edit the lower or upper value in the text fields or move the thumbs, the slider continuously updates the bound values to reflect the thumbs’ positions.
///
/// A single editable range slider is also supported. In this case, only the formatted upper value is displayed in a text field at the trailing end of the slider.
///
/// The following example illustrates an editable range slider bound to the lower value `lowerValue` and the upper value `upperValue`.
/// The range slider uses the default range of `0` to `100`, with a default step of `1`.
/// By default, the lower value is displayed in a text field as the leading accessory view, while the upper value is shown in a text field as the trailing accessory view.
/// Both the lower thumb and upper thumb are clearly displayed on the slider track.
/// You can edit these values in the text fields to change the lower and upper values.
/// Alternatively, you can drag the lower thumb to adjust the lower value and drag the upper thumb to change the upper value.
/// The range slider does not display the value label at the top right of the slider by default.
///
///  ```swift
///  @State private var lowerValue: Double = 20
///  @State private var upperValue: Double = 40
///
///  FioriSlider(
///      title: "Editable Range Slider",
///      lowerValue: $lowerValue,
///      upperValue: $upperValue,
///      description: "Simple editable range slider"
///  )
///  ```
///
/// The following example illustrates a single editable range slider bound to the upper value `upperValue`.
/// The range slider uses the default range of `0` to `100`, with a default step of `1`.
/// By default, only the upper value is shown in a text field as the trailing accessory view and one thumb displayed on the slider track.
/// You can edit value in the text fields to change the upper values or drag the thumb to adjust the upper value.
/// The single range slider does not display the value label at the top right of the slider by default.
///
///  ```swift
///  @State private var upperValue: Double = 40
///
///  FioriSlider(
///      title: "Single Editable Range Slider",
///      upperValue: $upperValue,
///      description: "Simple Single Editable range slider"
///  )
///  ```
///
/// Similar with standard slider, the range slider also allow you use the `range` parameter to specify the value range of the slider.
/// The `step` parameter allows you to define incremental steps along the slider's path.
/// The `decimalPlaces` parameter can be used to manage the decimal places of the slider's value.
/// By default, the range slider does not display the value label.
/// However, you can specify what you want to display in the `valueLabel` parameter to show the value label at the top right of the slider.
/// The `showsLeadingAccessory` and `showsTrailingAccessory` parameters control the display of the leading accessory view and trailing accessory view, respectively.
/// By default, the editable range slider uses a text field as the leading or trailing accessory view.
/// However, you can specify your own view in the `leadingAccessory` or `trailingAccessory` parameters to override the default text field.
/// The `showsLeadingAccessory` and `showsTrailingAccessory` parameters can be used to control the display of the respective accessory views.
/// The `onRangeValueChange` closure passed to the slider provides callbacks when the user drags the slider.
/// The `onValueChange` closure passed to the single editable slider provides callbacks when the user drags the slider.
///
/// ```swift
///  @State private var lowerValue: Double = 20
///  @State private var upperValue: Double = 40
///
///  FioriSlider(
///      title: "Editable Range Slider",
///      lowerValue: $lowerValue,
///      upperValue: $upperValue,
///      range: 10...200,
///      step: 2.5,
///      decimalPlaces: 1,
///      description: "Simple editable range slider",
///      onRangeValueChange: { isEditing, lowerValue, upperValue in
///         if !isEditing {
///             print("Range Slider value was: " + String(format: "%.1f", lowerValue) + " - " + String(format: "%.1f", upperValue))
///         }
///      }
///  )
///  ```
///
/// The slider also uses the `step` to increase or decrease the value when a
/// VoiceOver user adjusts the slider with voice commands.
///
// sourcery: CompositeComponent
protocol _FioriSliderComponent: _TitleComponent, _ValueLabelComponent, _RangeSliderControlComponent, _InformationViewComponent, _LeadingAccessoryComponent, _TrailingAccessoryComponent {
    // sourcery: defaultValue = "true"
    /// Indicates whether the slider is a range slider or not. The default value is `true`, meaning that the slider is a range slider.
    var isRangeSlider: Bool { get }
    
    /// This optional format is used to format the displayed slider value in the value label view. It is also utilized for formatting the accessibility value, if provided.
    var valueFormat: String? { get }
    
    /// The optional formats are used to format the lower and upper bound values of the range. They are utilized for formatting the accessibility values when you customize the range slider with your own leading and trailing accessory views, if provided.
    var rangeFormat: (String, String)? { get }
    
    /// This optional format is used to format the displayed minimal value of standard slider's range or lower value of range slider  in the leading accessory view. It is also utilized for formatting the accessibility value, if provided.
    var leadingValueFormat: String? { get }
    
    /// This optional format is used to format the displayed maximal value of standard slider's range or upper value of range slider  in the trailing accessory view. It is also utilized for formatting the accessibility value, if provided.
    var trailingValueFormat: String? { get }
    
    // sourcery: defaultValue = "true"
    /// Indicates whether the value label is to be displayed or not. The default value is `true`
    var showsValueLabel: Bool { get }
    
    // sourcery: defaultValue = "true"
    /// Indicates whether the leading accessory view is to be displayed or not. The default value is `true`
    var showsLeadingAccessory: Bool { get }
    
    // sourcery: defaultValue = "true"
    /// Indicates whether the trailing accessory view is to be displayed or not. The default value is `true`
    var showsTrailingAccessory: Bool { get }
    
    /// An optional callback function is triggered when the user begins to drag the thumb along the standard slider's track to adjust its value. The first boolean property indicates whether the editing process has begun or ended, with `false` signifying that the editing has concluded. The second double property represents the newly adjusted slider value.
    var onValueChange: ((Bool, Double) -> Void)? { get }
    
    /// An optional callback function is triggered when the focus state of a text field, which serves as a leading or trailing accessory for an editable slider, changes. The boolean parameter of the callback indicates the focus state of the text field. This can be useful for obtaining the focus state when customizing the editable slider.
    var onEditFieldFocusStatusChange: ((Bool) -> Void)? { get }
}

// sourcery: CompositeComponent
protocol _SingleStepComponent: _TitleComponent, _NodeComponent, _LineComponent {
    // sourcery: default.value = UUID().uuidString
    // sourcery: no_view
    var id: String { get }

    // sourcery: default.value = .normal
    // sourcery: no_view
    var state: StepProgressIndicatorState { get }

    // sourcery: resultBuilder.backingComponent = StepsStack
    // sourcery: resultBuilder.name = @IndexedViewBuilder
    // sourcery: resultBuilder.returnType = any IndexedViewContainer
    var substeps: [StepItem] { get }
}

/// `StepProgressIndicator` is a view supporting a list of `StepItem` in a  horizontal stack. Also customized steps are also supported.
/// ## Usage
/// ```swift
/// @State var selection: String = "id"
/// var steps: [StepItem] = []
/// StepProgressIndicator(selection: self.$selection,
///                       stepItems: self.steps)
/// Also indexed view builder is also supported.
/// StepProgressIndicator(title: <#T##() -> any View#>, action: <#T##() -> any View#>, cancelAction: <#T##() -> any View#>, selection: <#T##Binding<String>#>, steps: <#T##() -> any IndexedViewContainer#>)
/// ```
/// You can also update step style for different states, if you created `StepProgressIndicator` by `[StepItem]`.
/// `func stepStyle(_ style: @escaping ((_ id: String) -> (some StepStyle)?)) -> some View`
// sourcery: CompositeComponent
protocol _StepProgressIndicatorComponent: _TitleComponent, _ActionComponent, _CancelActionComponent {
    // sourcery: @Binding
    var selection: String { get }

    // sourcery: resultBuilder.backingComponent = StepsStack
    // sourcery: resultBuilder.name = @IndexedViewBuilder
    // sourcery: resultBuilder.returnType = any IndexedViewContainer
    var steps: [StepItem] { get }
}

/// `Attachment` is the UI component to be used by `AttachmentGroup` along with `AttachmentButtonImage` to support users' operation, such as adding a photo or a file and to render attachment list.
///
/// ## Usage
/// ```swift
/// Attachment {
///   AttachmentThumbnail(url: fileURL)
/// } attachmentTitle: {
///   Text("Leaf")
/// } attachmentSubtitle: {
///   Text("15MB")
/// } attachmentFootnote: {
///   Text("Aug 15, 2024")
/// }
///
/// Attachment {
///   Image(systemName: "leaf")
///     .resizable()
/// } attachmentTitle: {
///   Text("Leaf")
/// } attachmentSubtitle: {
///   Text("15MB")
/// } attachmentFootnote: {
///   Text("Aug 15, 2024")
/// }
/// ```
// sourcery: CompositeComponent
protocol _AttachmentComponent: _AttachmentTitleComponent, _AttachmentSubtitleComponent, _AttachmentFootnoteComponent {
    /// The collection of local attachment URLs, which are prepared by Apps.
    var url: URL { get }
    
    // sourcery: defaultValue = .normal
    /// The state of attachement group component
    var controlState: ControlState { get }
}

/// `AttachmentButtonImage` provides the default `Add` button following visual design.
///
/// ## Usage
/// ```swift
/// @State var attachments: [URL]
/// @State var attachmentError: AttributedString?
/// let delegate: AttachmentDelegate
///
/// AttachmentGroup(
///   title: { Text("Attachements") },
///   attachments: self.$attachments,
///   maxCount: 5,
///   delegate: self.delegate,
///   errorMessage: self.$attachmentError,
///   operations: {
///       AttachmentButtonImage()
///           .operationsMenu {
///               PhotosPickerMenuItem(filter: [.images])
///               FilesPickerMenuItem(filter: [.pdf, .presentation])
///           }
///       }
///  )
/// ```
// sourcery: CompositeComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _AttachmentButtonImageComponent {
    //// The image to be used for "Add" menu or dialog for operations, such as poping up image picker or file picker.
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriIcon.actions.add.renderingMode(.template).resizable()"
    var addButtonImage: Image { get }

    // sourcery: defaultValue = .normal
    /// The state of attachement group component
    var controlState: ControlState { get }
}

/// `AttachmentGroup` is the UI component for adding, removing, and rendering thumbnails and previews.
///
/// ## Usage
/// ```swift
/// AttachmentGroup(
///   title: { Text("Attachements") },
///   attachments: self.$attachments,
///   maxCount: 5,
///   delegate: self.delegate,
///   errorMessage: self.$attachmentError,
///   operations: {
///       AttachmentButtonImage()
///           .operationsMenu {
///               PhotosPickerMenuItem(filter: [.images])
///               FilesPickerMenuItem(filter: [.pdf, .presentation])
///           }
///       }
///  )
/// ```
// sourcery: CompositeComponent
protocol _AttachmentGroupComponent: _TitleComponent {
    // sourcery: @Binding
    /// The collection of local attachment URLs, which are prepared by Apps.
    var attachments: [URL] { get }
    
    // sourcery: defaultValue = "nil"
    /// The maximium number of attachments
    var maxCount: Int? { get }

    // sourcery: defaultValue = "BasicAttachmentDelegate()"
    /// App specific attachemnt processing logics for adding or deleting attachments.
    var delegate: AttachmentDelegate { get }

    // sourcery: defaultValue = .normal
    /// The state of attachement group component
    var controlState: ControlState { get }
    
    // sourcery: @Binding
    // sourcery: defaultValue = ".constant(nil)"
    /// The error message of the form view.
    var errorMessage: AttributedString? { get }

    // sourcery: defaultValue = "{ EmptyView() }"
    /// For adding App specific operations, such as picking photos and files.
    @ViewBuilder
    var operations: (() -> any View)? { get }
    
    // sourcery: defaultValue = "nil"
    /// Triggering App specific preview, otherwise using default preview.
    var onPreview: ((URL) -> Void)? { get }
}

/// `AttachmentThumbnail` is the UI component for rendering attachment file thumbnails asynchronously starting with static icons.
///
/// ## Usage
/// ```swift
/// Attachment {
///   AttachmentThumbnail(url: fileURL)
/// } attachmentTitle: {
///   Text("Leaf")
/// } attachmentSubtitle: {
///   Text("15MB")
/// } attachmentFootnote: {
///   Text("Aug 15, 2024")
/// }
// sourcery: CompositeComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _AttachmentThumbnailComponent {
    ////  URL of document for rendering thumbnail
    var url: URL { get }
    
    // sourcery: defaultValue = .normal
    /// The state of attachement group component
    var controlState: ControlState { get }
}

// sourcery: CompositeComponent
protocol _SectionHeaderComponent: _TitleComponent, _AttributeComponent {
    /// Style determines fonts and colors. Default is `.title` style.
    // sourcery: defaultValue = .title
    var sectionHeaderStyle: SectionHeaderFooterStyle { get }
    
    /// Optional handler, to respond to tap events on the view.
    var didSelectHandler: (() -> Void)? { get }
}

// sourcery: CompositeComponent
protocol _SectionFooterComponent: _TitleComponent, _AttributeComponent {
    /// Style determines fonts and colors. Default is `.title` style.
    // sourcery: defaultValue = .title
    var sectionFooterStyle: SectionHeaderFooterStyle { get }
    
    /// Optional handler, to respond to tap events on the view.
    var didSelectHandler: (() -> Void)? { get }
}

/// `ObjectHeader` is a view that displays an object's title, subtitle, tags, body text, footnote, description, status, substatus, detail image and detail content.
/// ## Usage
/// ```swift
/// ObjectHeader {
///     Text("title")
/// } subtitle: {
///     Text("subtitle")
/// } tags: {
///     Text("tag01")
/// } bodyText: {
///     Text("body")
/// } footnote: {
///     Text("footnote")
/// } descriptionText: {
///     Text("description")
/// } status: {
///     Text("status")
/// } substatus: {
///     Text("substatus")
/// } detailImage: {
///     Image(systemName: "person")
/// } detailContent: {
///     Text("detail content")
/// }
/// ```
// sourcery: CompositeComponent
protocol _ObjectHeaderComponent: _TitleComponent, _SubtitleComponent, _TagsComponent, _BodyTextComponent, _FootnoteComponent, _DescriptionTextComponent, _StatusComponent, _SubstatusComponent, _DetailImageComponent, _DetailContentComponent {}

/// `HeaderChart` is a view that displays an object's title, subtitle, trend, trend image and kpi.
/// ## Usage
/// ```swift
/// HeaderChart {
///     Text("title")
/// } subtitle: {
///     Text("subtitle")
/// } trend: {
///     Text("trend")
/// } trendImage: {
///     Image(systemName: "person")
/// } kpi: {
///     Text("KPI View")
/// } chart: {
///     Text("Chart View")
/// }
/// ```
// sourcery: CompositeComponent
protocol _HeaderChartComponent: _TitleComponent, _SubtitleComponent, _TrendComponent, _TrendImageComponent, _KpiComponent {
    @ViewBuilder
    var chart: (() -> any View)? { get }
}

/// The `FilterFeedbackBarButton` is a SwiftUI component for item's options that are used in FilterFeedbackBar when the item's type is `SortFilterItem.picker`.
/// Typically not used by application developer.
///
/// ## Usage
///
/// `icon` is the leading image in the button.
/// `title` is the title for the option.
/// `isSelected` is the state of the button whether it is selected. The style of the button will change based on its state.
///
///  ```swift
///  FilterFeedbackBarButton(
///     icon: Image(systemName: "checkmark"),
///     title: "Status",
///     isSelected: true)
///  ```
///
// sourcery: CompositeComponent
protocol _FilterFeedbackBarButtonComponent: _IconComponent, _TitleComponent {
    /// Whether the item is selected or not
    var isSelected: Bool { get }
    /// The custom spacing between icon and title.
    // sourcery: defaultValue = 4.0
    var spacing: CGFloat { get }
}

/// The `FilterFeedbackBarItem` is a SwiftUI component for items in FilterFeedbackBar.
/// Typically not used by application developer.
///
/// ## Usage
///
/// `icon` is the leading image in the button.
/// `title` is the button title.
/// `accessoryIcon` is the trailing image in the button.
/// `isSelected` is the state of the button whether the item has selected value. The style of the button will change based on its state.
///
///  ```swift
///  FilterFeedbackBarItem(
///     icon: Image(systemName: "clock"),
///     title: "Item Title",
///     accessoryIcon: Image(systemName: "chevron.down"),
///     isSelected: self.item.isChecked)
///  ```
///
// sourcery: CompositeComponent
protocol _FilterFeedbackBarItemComponent: _IconComponent, _TitleComponent, _AccessoryIconComponent {
    /// Whether the item is selected or not
    var isSelected: Bool { get }
    /// The custom spacing between icon and title.
    // sourcery: defaultValue = 6.0
    var spacing: CGFloat { get }
}

/// `DimensionSegment` provides a customizable segment for `DimensionSelector`.
///
// sourcery: CompositeComponent
protocol _DimensionSegmentComponent: _TitleComponent {
    // sourcery: @binding
    /// Whether the item is selected or not
    var isSelected: Bool { get }
}

/// `DimensionSelector` is a horizontal control containing multiple segments, each segment functioning as a discrete button. Selection is mutually exclusive.
///
///  ## Usage:
///  ```swift
///  let titles = ["intraday: 1min", "one day: 1min", "1year:1day", "3years:1week"]
///  @State var selectedIndex: Int? = 0
///  @ObservedObject var stockModel = Tests.stockModels[0]
///
///  DimensionSelector(titles: titles, selectedIndex: $selectedIndex)
///     .onChange(of: selectedIndex) {
///            stockModel.indexOfStockSeries = selectedIndex ?? -1
///    }
///  ```
// sourcery: CompositeComponent
protocol _DimensionSelectorComponent {
    /// The array for segment titles
    var titles: [String] { get }
    
    // sourcery: @Binding
    /// The optional selected index of the DimensionSelector
    var selectedIndex: Int? { get }
    
    // sourcery: defaultValue = 6
    /// The spacing between two segments. The default value is `6`.
    var interItemSpacing: CGFloat { get }
    
    /// Content inset for the segmented control.
    var contentInset: EdgeInsets? { get }
    
    // sourcery: defaultValue = .intrinsic
    /// Mode that determines the width of each segment. The default value is `.intrinsic`.
    var segmentWidthMode: SegmentWidthMode { get }
    
    // sourcery: defaultValue = true
    /// A Boolean value indicating if empty selection is allowed. The default value is `true`.
    var allowEmptySelection: Bool { get }
    
    @ViewBuilder
    // sourcery: defaultValue = "{ _ in EmptyView() }"
    // sourcery: resultBuilder.defaultValue = "{ _ in EmptyView() }"
    ///  ViewBuilder for customizing the segments
    var segment: (String) -> any View { get }
}

/// The `FilterFeedbackBar` is a SwiftUI component contains FilterFeedbackBarItem. When tapping FilterFeedbackBarItem, it will show some sort and filter types of controls, List Picker, Switch, Slider, Value Picker, Stepper, Date Picker.
///
/// ## Usage
///
/// `items` is the data for the FilterFeedbackBar.
/// `onUpdate` is the callback function  is triggered when the data is updated.
///
///  ```swift
///  @State var items: [[SortFilterItem]] = [
///    [.switch(item: .init(name: "Favorite", value: true, icon: "heart.fill"), showsOnFilterFeedbackBar: true),
///     .slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]
///  ]
///
///  FilterFeedbackBar(items: self.$items) {}
///  ```
///
// sourcery: CompositeComponent
protocol _FilterFeedbackBarComponent {
    // sourcery: resultBuilder.name = @ViewBuilder, resultBuilder.backingComponent = FilterFeedbackBarItemContainer
    /// The data for the FilterFeedbackBar.
    var items: Binding<[[SortFilterItem]]> { get }
    
    /// The callback function is triggered when the data is updated.
    var onUpdate: (() -> Void)? { get }
}

/// `SortFilterView` is a view that will be presented when tap the full configuration button in the filter feed back bar.
///  ## Usage:
///  ```swift
///  @Binding var items: [[SortFilterItem]]
///  SortFilterView(
///     title: {
///         Text("Full Configuration")
///     },
///     items: self.$items,
///     onUpdate: {},
///     onCancel: {},
///     onReset: {}
///  )
///  ```
// sourcery: CompositeComponent
protocol _SortFilterViewComponent: _TitleComponent, _CancelActionComponent, _ApplyActionComponent, _ResetActionComponent {
    // sourcery: @Binding
    /// The data for the items that will be displayed in sort filter view.
    var items: [[SortFilterItem]] { get }
    /// The action to be performed when the apply button is tapped.
    var onUpdate: (() -> Void)? { get }
    /// The action to be performed when the cancel button is tapped.
    var onCancel: (() -> Void)? { get }
    /// The action to be performed when the reset button is tapped.
    var onReset: (() -> Void)? { get }
}

/// `SignatureCaptureView` allows user to sign above  the signature line.
/// ## Usage
/// ```swift
/// SignatureCaptureView(title: "Signature Title", isRequired: true, startSignatureAction: {
///    Button(action: {}, label: { Text("start") })
/// }, reenterSignatureAction: {
///    Button(action: {}, label: { Text("restart") })
/// }, cancelAction: {
///    Button(action: {}, label: { Text("cancel") })
/// }, clearAction: {
///    Button(action: {}, label: { Text("clear") })
/// }, saveAction: {
///    Button(action: {}, label: { Text("save") })
/// }, xmark: {
///    Image(systemName: "xmark")
/// }, watermark: {
///    Text("This is a watermark")
/// }, signatureImage: nil,
///                     drawingViewMaxHeight: 400,
///                     drawingViewBackgroundColor: Color.gray,
///                     strokeWidth: 1,
///                     appliesTintColorToImage: true,
///                     strokeColor: Color.red,
///                     signatureLineColor: Color.black,
///                     hidesSignatureLine: false,
///                     watermarkAlignment: .trailing,
///                     addsTimestampInImage: true,
///                     timestampFormatter: nil,
///                     cropsImage: false) { img in
///    let imgSaver = ImageSaver()
///    imgSaver.writeToPhotoAlbum(image: img)
/// }
/// ```
// sourcery: CompositeComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _SignatureCaptureViewComponent: _TitleComponent, _MandatoryField, _StartSignatureActionComponent, _ReenterSignatureActionComponent, _CancelActionComponent, _ClearActionComponent, _SaveActionComponent, _XmarkComponent, _WatermarkComponent {
    /// An optional image for default signature.
    var signatureImage: UIImage? { get }
    
    /// Maximum height of the drawing view.
    var drawingViewMaxHeight: CGFloat? { get }
    
    // sourcery: defaultValue = Color.preferredColor(.primaryBackground)
    /// The background color of the drawing view. Default value is `.primaryBackground`.
    var drawingViewBackgroundColor: Color { get }
    
    // sourcery: defaultValue = 3.0
    /// The width of the stroke. Default value is `3.0`.
    var strokeWidth: CGFloat { get }
    
    // sourcery: defaultValue = true
    /// Indicates if should use `strokeColor` as foreground color. Default value is `true`.
    var appliesTintColorToImage: Bool { get }
    
    // sourcery: defaultValue = Color.preferredColor(.primaryLabel)
    /// The color for the stroke. Default value is `.primaryLabel`.
    var strokeColor: Color { get }
    
    // sourcery: defaultValue = Color.preferredColor(.quaternaryLabel)
    /// The color of the signature line. Default value is `.quaternaryLabel`.
    var signatureLineColor: Color { get }
    
    // sourcery: defaultValue = false
    /// Indicates if the signature line should be hidden. Default value is `false`.
    var hidesSignatureLine: Bool { get }
    
    // sourcery: defaultValue = .leading
    /// The alignment of the watermark. Default value is `.leading`.
    var watermarkAlignment: HorizontalAlignment { get }
    
    // sourcery: defaultValue = false
    /// Indicates if timestamp should be added in image. Default value is `false`.
    var addsTimestampInImage: Bool { get }
    
    /// Timestamp formatter.
    var timestampFormatter: DateFormatter? { get }
    
    // sourcery: defaultValue = false
    /// Indicates if the image should be cropped. Default value is `false`.
    var cropsImage: Bool { get }

    /// An optional call back for save action.
    var onSave: ((UIImage) -> Void)? { get }
    
    /// An optional call back for delete action.
    var onDelete: (() -> Void)? { get }
}

/// `KeyValueItem` provides a customizable activity item with a key and a value.
///
/// ## Usage
/// ```swift
/// KeyValueItem(key: {
///         Text("key 1")
///     }, value: {
///         Text("value 1")
///     }, axis: .vertical)
/// ```
// sourcery: CompositeComponent
protocol _KeyValueItemComponent: _KeyComponent, _ValueComponent, _FormViewComponent {
    // sourcery: defaultValue = .horizontal
    var axis: Axis { get }
}

/// `KPIItem` enables a developer to present "KPI" information in a formatted manner consistent with the Fiori Design Language.
///
/// ## Usage
/// ```swift
/// struct KPISubItemModelImplementation: KPISubItemModel {
///     let id: UUID
///     let kPISubItemValue: TextOrIcon
///     let kPISubItemType: KPISubitemType
///
///     init(id: UUID = UUID(), kPISubItemValue: TextOrIcon, kPISubItemType: KPISubitemType) {
///         self.id = id
///         self.kPISubItemValue = kPISubItemValue
///         self.kPISubItemType = kPISubItemType
///     }
/// }
///
/// private var item: [KPISubItemModelImplementation] = [
///     KPISubItemModelImplementation(kPISubItemValue: .icon(Image(systemName: "triangleshape.fill")), kPISubItemType: KPISubitemType.icon),
///     KPISubItemModelImplementation(kPISubItemValue: .text("123"), kPISubItemType: KPISubitemType.metric),
///     KPISubItemModelImplementation(kPISubItemValue: .text("USD"), kPISubItemType: KPISubitemType.unit)
/// ]
///
/// KPIItem(kpiCaption: "abc", items: item, proposedViewSize: .small, alignment: .leading)
/// ```
// sourcery: CompositeComponent
protocol _KPIItemComponent: _KpiCaptionComponent {
    /// The data for KPI item
    var items: [any KPISubItemModel] { get }
    
    // sourcery: defaultValue = .small
    var proposedViewSize: KPIItemSize { get }
    
    // sourcery: defaultValue = .center
    var alignment: Alignment { get }
}

/// `UserConsentView` is used to display a series of user consent screens modally during the process of onboarding.
/// ## Usage
/// ```swift
/// UserConsentView {
///     UserConsentForm(userConsentPages: {
///                    UserConsentPage {
///                        Text("Form 0 Page 0")
///                    } bodyText: {
///                        Text("detailText")
///                    } action: {
///                        Button {
///                        } label: {
///                            Text("Learn more about privacy")
///                        }
///                    }
///                    UserConsentPage {
///                        Text("Form 0 Page 1")
///                    } bodyText: {
///                        Text("detailText")
///                    } action: {
///                        Button {
///                        } label: {
///                            Text("Learn more about privacy")
///                        }
///                    }
///                },
///                didAllow: { print("UserConsentForm - didAllow") }
///     )
///     UserConsentForm(userConsentPages: {
///                    UserConsentPage {
///                        Text("Form 1 Page 0")
///                    } bodyText: {
///                        Text("detailText")
///                    } action: {
///                        Button {
///                        } label: {
///                         Text("Learn more about Data Privacy")
///                        }
///                     }
///                 },
///                 isRequired: false,
///                 didAllow: { print("UserConsentForm - didAllow") })
/// } didAllow: {
///     print("UserConsentView - didAllow: index: \($0)")
/// } didDeny: {
///     print("UserConsentView - didDeny: index: \($0), isRequired: \($1)")
/// } didCancel: { _ in
///     print("UserConsentView - didCancel")
/// } didFinish: { _ in
///     presentationMode.wrappedValue.dismiss()
/// }
/// ```
// sourcery: CompositeComponent
protocol _UserConsentViewComponent {
    // sourcery: no_style
    // sourcery: resultBuilder.name = @IndexedViewBuilder
    // sourcery: resultBuilder.backingComponent = _UserConsentFormsContainer
    // sourcery: resultBuilder.returnType = any IndexedViewContainer
    var userConsentForms: [UserConsentForm] { get }
 
    // sourcery: default.value = nil
    // sourcery: no_view
    var didAllow: ((Int) -> Void)? { get }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var didDeny: ((Int, Bool) -> Void)? { get }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var didCancel: ((Int) -> Void)? { get }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var didFinish: (([Int]) -> Void)? { get }
}

// sourcery: CompositeComponent
protocol _UserConsentFormComponent: _NextActionComponent, _CancelActionComponent, _AllowActionComponent, _DenyActionComponent, _NotNowActionComponent {
    // sourcery: no_style
    // sourcery: resultBuilder.name = @IndexedViewBuilder
    // sourcery: resultBuilder.backingComponent = _UserConsentPagesContainer
    // sourcery: resultBuilder.returnType = any IndexedViewContainer
    var userConsentPages: [UserConsentPage] { get }
    
    // sourcery: no_view
    // sourcery: default.value="true"
    var isRequired: Bool { get }
    
    // sourcery: default.value = _UserConsentFormAlertConfigurationDefault
    // sourcery: no_view
    var alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? { get }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var didAllow: (() -> Void)? { get }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var didDeny: ((Bool) -> Void)? { get }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var didCancel: (() -> Void)? { get }
}

// sourcery: CompositeComponent
protocol _UserConsentPageComponent: _TitleComponent, _BodyTextComponent, _ActionComponent {}

/// `AINotice` is a SwiftUI view indicating if content is AI-supported or AI-generated. It can include an icon, a description, and an action label for accessing more details. If the icon or description is not set, a default value will be used. Action label has no default value and has to be set to be used.
/// ## Usage
/// ```swift
///  @State var showsAction = false
///  KeyValueItem {
///     Text("Marital Status Since*")
///   } value: {
///     Text(self.maritalStatusSince)
///   }
///   .id(self.maritalStatusSinceId)
///   .aiNoticeView(isPresented: self.$showAINotice, icon: Image(fioriName: "fiori.ai"), description: "AI Notice with icon. ", actionLabel: "View more details", viewMoreAction: self.toggleShowSheet)
///   .sheet(isPresented: self.$showBottomSheet) {
///      Text("detail information")
///         .presentationDetents([.height(250), .medium])
///         .presentationDragIndicator(.visible)
///    }
/// ```
// sourcery: CompositeComponent
protocol _AINoticeComponent: _IconComponent {
    ///  An `AttributedString` representing the AI notice message.
    var description: AttributedString? { get }
    
    /// An `AttributedString` that triggers an action to view more details.
    var actionLabel: AttributedString? { get }
    
    /// A callback triggered when the actionLabel is clicked to display more message details.
    var viewMoreAction: (() -> Void)? { get }
    
    /// The`HorizontalAlignment` of the AINotice view. The default value is `leading`.
    // sourcery: defaultValue = .leading
    var viewAlignment: HorizontalAlignment { get }
}

/// `EULAView` is used to display the End User License Agreement, EULA.
/// ## Usage
/// ```swift
///        EULAView(title: "EULA",
///                 bodyText: "BodyText",
///                 didAgree: {
///            print("EULAView - didAgree")
///        },
///                 didDisagree: {
///            print("EULAView - didDisagree")
///        },
///                 didCancel: {
///            presentationMode.wrappedValue.dismiss()
///        })
/// ```
// sourcery: CompositeComponent
protocol _EULAViewComponent: _TitleComponent, _BodyTextComponent, _AgreeActionComponent, _DisagreeActionComponent, _CancelActionComponent {
    // sourcery: default.value = nil
    // sourcery: no_view
    var didAgree: (() -> Void)? { get }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var didDisagree: (() -> Void)? { get }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var didCancel: (() -> Void)? { get }
}

/// `DurationPicker` provides a wheel style `Picker` with Fiori styling to select a duration.
/// ## Usage
/// ```swift
/// @State var selection: Int = 0
/// var formatter: MeasurementFormatter {
/// let formatter = MeasurementFormatter()
///     formatter.locale = Locale(identifier: "zh-CN")
///     formatter.unitStyle = .long
///     formatter.unitOptions = .providedUnit
///     return formatter
/// }
/// DurationPicker(selection: self.$selection, maximumMinutes: 124, minimumMinutes: 60, minuteInterval: 2)
///     .measurementFormatter(self.formatter)
/// ```
// sourcery: CompositeComponent
protocol _DurationPickerComponent {
    // sourcery: @Binding
    // sourcery: no_view
    var selection: Int { get set }
    // sourcery: default.value=1439
    // sourcery: no_view
    var maximumMinutes: Int { get set }
    // sourcery: default.value=0
    // sourcery: no_view
    var minimumMinutes: Int { get set }
    // sourcery: default.value
    // sourcery: no_view
    var minuteInterval: Int { get set }
    // sourcery: default.value=MeasurementFormatter()
    // sourcery: no_view
    var measurementFormatter: MeasurementFormatter { get set }
}
