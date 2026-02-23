import Foundation
import SwiftUI

// Standard Components

// sourcery: generated_component_not_configurable
// sourcery: add_env_props = "numberOfLines"
public protocol IconStackModel: IconsComponent {}

// sourcery: generated_component_not_configurable
// sourcery: add_env_props = "footnoteIconsSize"
// sourcery: add_env_props = "footnoteIconsSpacing"
// sourcery: add_env_props = "isFootnoteIconsCircular"
// sourcery: add_env_props = "footnoteIconsMaxCount"
public protocol FootnoteIconStackModel: FootnoteIconsComponent {}

// sourcery: generated_component_not_configurable
public protocol TagStackModel: TagsComponent {}

// sourcery: add_view_builder_params = "detailContent"
// sourcery: add_env_props = "horizontalSizeClass"
// sourcery: add_env_props = "sizeCategory"
// sourcery: virtualPropLeftViewSize = "@State var leftViewSize: CGSize = CGSize(width: 740, height: 0)"
// sourcery: virtualPropMiddleViewSize = "@State var middleViewSize: CGSize = CGSize(width: 312, height: 0)"
// sourcery: virtualPropRightViewSize = "@State var rightViewSize: CGSize = CGSize(width: 120, height: 0)"
// sourcery: virtualPropMainViewSize = "@State var mainViewSize: CGSize = .zero"
// sourcery: virtualPropStatusViewSize = "@State var statusViewSize: CGSize = .zero"
// sourcery: virtualPropCurrentTabIndex = "@State var currentTabIndex: Int = 0"
// sourcery: generated_component_composite
public protocol _ObjectHeaderModel: TitleComponent, SubtitleComponent, TagsComponent, BodyTextComponent, FootnoteComponent, DescriptionTextComponent, StatusComponent, SubstatusComponent, DetailImageComponent {}

@available(*, unavailable, renamed: "_ObjectHeaderModel", message: "Will be removed in the future release. Please create ObjectHeader with other initializers instead.")
public protocol ObjectHeaderModel {}

// sourcery: add_view_builder_params = "chart"
// sourcery: virtualPropIntStateChanged = "@State var mainViewSize: CGSize = CGSize(width: 312, height: 0)"
// sourcery: generated_component
public protocol _HeaderChartModel: TitleComponent, SubtitleComponent, TrendComponent, TrendImageComponent, KpiComponent {}

@available(*, unavailable, renamed: "_HeaderChartModel", message: "Will be removed in the future release. Please create HeaderChart with other initializers instead.")
public protocol HeaderChartModel {}
// sourcery: generated_component
// public protocol TimelineItemModel: TitleComponent, SubtitleComponent, FootnoteComponent, AttributeComponent, SecondaryAttributeComponent, TimestampComponent, SecondaryTimestampComponent, StatusComponent, SubstatusComponent {}

// sourcery: generated_component
// public protocol ChartFloorplanModel: TitleComponent, SubtitleComponent, StatusComponent, ValueAxisTitleComponent, SeriesTitlesComponent, CategoryAxisTitleComponent {}

// sourcery: add_view_builder_params = "actionItems"
// sourcery: add_env_props = ["horizontalSizeClass"]
// sourcery: generated_component
// public protocol ProfileHeaderModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, DetailImageComponent {}

// sourcery: generated_component
// public protocol TimelineGridItemModel: TitleComponent, TimestampComponent, StatusComponent {}

// sourcery: generated_component
// public protocol CollectionItemModel: DetailImageComponent, TitleComponent, SubtitleComponent {}

// sourcery: add_env_props = "colorScheme"
// sourcery: generated_component
public protocol _SectionHeaderModel: TitleComponent, AttributeComponent {}

@available(*, unavailable, renamed: "_SectionHeaderModel", message: "Will be removed in the future release. Please create SectionHeader with other initializers instead.")
public protocol SectionHeaderModel {}

// sourcery: generated_component
// sourcery: virtualPropAction = "var action: (() -> Void)? = nil"
public protocol _KPIItemModel: KpiComponent, SubtitleComponent, _KPIHeaderItemModel {}

@available(*, unavailable, renamed: "_KPIItemModel", message: "Will be removed in the future release. Please create KPIItem with other initializers instead.")
public protocol KPIItemModel {}

// sourcery: virtualPropIsPressed = "@State var isPressed: Bool = false"
// sourcery: virtualPropAction = "var action: (() -> Void)? = nil"
// sourcery: add_env_props = "kpiProgressViewStyle"
// sourcery: add_env_props = "isEnabled"
// sourcery: generated_component
public protocol _KPIProgressItemModel: KpiProgressComponent, SubtitleComponent, FootnoteComponent, _KPIHeaderItemModel {}

@available(*, unavailable, renamed: "_KPIProgressItemModel", message: "Will be removed in the future release. Please create KPIProgressItem with other initializers instead.")
public protocol KPIProgressItemModel {}

// sourcery: generated_component
public protocol _KeyValueItemModel: KeyComponent, ValueComponent {
    // sourcery: default.value = .horizontal
    // sourcery: no_view
    var axis: Axis { get }
}

/// Deprecated KeyValueItemModel
@available(*, unavailable, renamed: "_KeyValueItemModel", message: "Will be removed in the future release. Please create KeyValueItem with other initializers instead.")
public protocol KeyValueItemModel {}

// sourcery: add_env_props = "sharedAction"
// sourcery: generated_component_not_configurable
public protocol _ActionModel: ActionComponent {}

@available(*, unavailable, renamed: "_ActionModel", message: "Will be removed in the future release. Please create Action with other initializers instead.")
public protocol ActionModel: ActionComponent {}

// sourcery: generated_component_not_configurable
public protocol _TextInputModel: TextInputComponent {}

/// Deprecated TextInputModel
@available(*, unavailable, renamed: "_TextInputModel", message: "Will be removed in the future release. Please create TextInput with other initializers instead.")
public protocol TextInputModel {}

// sourcery: generated_component
public protocol _ActivityItemModel: IconComponent, SubtitleComponent {}

/// Deprecated ActivityItemModel
@available(*, unavailable, renamed: "_ActivityItemModel", message: "Will be removed in the future release. Please create ActivityItem with other initializers instead.")
public protocol ActivityItemModel {}

// sourcery: generated_component_not_configurable
public protocol _ActivityItemsModel: ActionItemsComponent {}

/// Deprecated ActivityItemsModel
@available(*, unavailable, renamed: "_ActivityItemsModel", message: "Will be removed in the future release. Please create ActivityItemsModel with other initializers instead.")
public protocol ActivityItemsModel {}

// sourcery: generated_component
// sourcery: add_env_props = "listBackground"
// sourcery: add_env_props = "listpickerListStyle"
// sourcery: add_env_props = "listPickerListViewModifier"

// sourcery: virtualPropDestinationConfiguration = "var destinationConfiguration: _ListPickerItemConfiguration? = nil"
public protocol _ListPickerItemModel: KeyComponent, ValueComponent {
    // sourcery: default.value = .horizontal
    // sourcery: no_view
    var axis: Axis { get }
}

@available(*, unavailable, renamed: "_ListPickerItemModel", message: "Will be removed in the future release. Please create ListPickerItem with other initializers instead.")
public protocol ListPickerItemModel {}

/// Deprecated ProgressIndicatorModel
// sourcery: generated_component_not_configurable
public protocol _ProgressIndicatorModel: ProgressIndicatorComponent {}

@available(*, unavailable, renamed: "_ProgressIndicatorModel", message: "Will be removed in the future release. Please use LoadingIndicator instead.")
public protocol ProgressIndicatorModel {}
    
/// Deprecated SideBarListItem
// sourcery: add_env_props = "sideBarListItemConfigMode"
// sourcery: add_env_props = "sizeCategory"
// sourcery: virtualPropSidebarIconScaleMetric = "@ScaledMetric var scale: CGFloat = 1"
// sourcery: generated_component
public protocol _SideBarListItemModel: IconComponent, TitleComponent, SubtitleComponent, AccessoryIconComponent {}

/// Deprecated SideBarListItem
@available(*, unavailable, renamed: "_SideBarListItemModel", message: "Will be removed in the future release. Please create SideBarListItem with other initializers instead.")
public protocol SideBarListItemModel {}

/// Deprecated SideBar
// sourcery: availableAttributeContent = "iOS 14, *"
// sourcery: add_view_builder_params = "detail"
// sourcery: add_view_builder_params = "footer"
// sourcery: generated_component
public protocol _SideBarModel: SubtitleComponent {}

/// Deprecated SideBar
@available(*, unavailable, renamed: "_SideBarModel", message: "Will be removed in the future release. Please create SideBar with other initializers instead.")
public protocol SideBarModel {}

// sourcery: add_env_props = ["horizontalSizeClass"]
// sourcery: generated_component_composite
public protocol _WelcomeScreenModel: TitleComponent, DescriptionTextComponent, SubtitleComponent, FootnoteComponent, IconComponent {
    // sourcery: genericParameter.name = TextInputView
    var textInput: _TextInputModel? { get }
    
    // sourcery: genericParameter.name = ActionView
    var action: _ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    var secondaryAction: _ActionModel? { get }
}

/// Deprecated WelcomeScreenModel
@available(*, unavailable, renamed: "_WelcomeScreenModel", message: "Will be removed in the future release. Please create WelcomeScreen with other initializers instead.")
public protocol WelcomeScreenModel {}
// sourcery: add_env_props = "horizontalSizeClass"
// sourcery: add_env_props = "sizeCategory"
// sourcery: add_env_props = "splitPercent"
// sourcery: virtualPropMainViewSize = "@State var mainViewSize: CGSize = .zero"
// sourcery: generated_component_composite
public protocol _ContactItemModel: TitleComponent, SubtitleComponent, DescriptionTextComponent, DetailImageComponent {
    var actionItems: _ActivityItemsModel? { get }
}

/// Deprecated ContactItemModel
@available(*, unavailable, renamed: "_ContactItemModel", message: "Will be removed in the future release. Please create ContactItem with other initializers instead.")
public protocol ContactItemModel {}

// sourcery: generated_component_composite
public protocol _InfoViewModel: TitleComponent, DescriptionTextComponent {
    // sourcery: default.value = nil
    // sourcery: no_view
    var showLoadingIndicator: Bool? { get }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var loadingIndicatorText: String? { get }
    
    // sourcery: genericParameter.name = ActionView
    var action: _ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    var secondaryAction: _ActionModel? { get }
}

/// Deprecated InfoViewModel
@available(*, deprecated, renamed: "_InfoViewModel", message: "Will be removed in the future release. Please create InfoViewModel with other initializers instead.")
public protocol InfoViewModel {}

// sourcery: generated_component_composite
// sourcery: virtualPropContentHeight = "@State var contentHeight: CGFloat = .zero"
// sourcery: add_env_props = ["presentationMode"]
public protocol _EULAViewModel: TitleComponent, BodyAttributedTextComponent {
    // sourcery: genericParameter.name = ActionView
    // sourcery: default.value = _AgreeActionDefault()
    var action: _ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    // sourcery: default.value = _DisagreeActionDefault()
    var secondaryAction: _ActionModel? { get }
    
    // sourcery: genericParameter.name = CancelActionView
    // sourcery: default.value = _CancelActionDefault()
    var cancelAction: _ActionModel? { get }
    
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

/// Deprecated EULAViewModel
@available(*, deprecated, renamed: "_EULAViewModel", message: "Will be removed in the future release. Please create EULAViewModel with other initializers instead.")
public protocol EULAViewModel {}

// sourcery: virtualPropFormIndex = "@State var _formIndex = 0"
// sourcery: virtualPropAllowedFormIndexes = "@State var _allowedFormIndexes: [Int] = []"
// sourcery: generated_component_composite
public protocol _UserConsentViewModel {
    // sourcery: no_style
    // sourcery: backingComponent=_UserConsentFormsContainer
    // sourcery: customFunctionBuilder=IndexedViewBuilder
    // sourcery: genericParameter.type=IndexedViewContainer
    var userConsentForms: [_UserConsentFormModel] { get }
 
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

// sourcery: virtualPropPageIndex = "@State var _pageIndex = 0"
// sourcery: virtualPropShowAlert = "@State var _showAlert: (Bool, UserConsentAlertType) = (false, .deny)"
// sourcery: add_env_props = "userConsentFormDidAllow"
// sourcery: add_env_props = "userConsentFormDidDeny"
// sourcery: add_env_props = "userConsentFormDidCancel"
// sourcery: generated_component_composite
public protocol _UserConsentFormModel {
    // sourcery: genericParameter.name = NextActionView
    // sourcery: default.value = _NextActionDefault()
    var nextAction: _ActionModel? { get }
    
    // sourcery: genericParameter.name = CancelActionView
    // sourcery: default.value = _CancelActionDefault()
    var cancelAction: _ActionModel? { get }
    
    // sourcery: genericParameter.name = AllowActionView
    // sourcery: default.value = _AllowActionDefault()
    var allowAction: _ActionModel? { get }
    
    // sourcery: genericParameter.name = DenyActionView
    // sourcery: default.value = _DenyActionDefault()
    var denyAction: _ActionModel? { get }
    
    // sourcery: genericParameter.name = NotNowActionView
    // sourcery: default.value = _NotNowActionDefault()
    var notNowAction: _ActionModel? { get }
    
    // sourcery: no_style
    // sourcery: backingComponent=_UserConsentPagesContainer
    // sourcery: customFunctionBuilder=IndexedViewBuilder
    // sourcery: genericParameter.type=IndexedViewContainer
    var userConsentPages: [_UserConsentPageModel] { get }
    
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

// sourcery: generated_component_composite
public protocol _UserConsentPageModel: TitleComponent, BodyAttributedTextComponent {
    // sourcery: genericParameter.name = ActionView
    var action: _ActionModel? { get }
}

@available(*, unavailable, renamed: "_UserConsentViewModel", message: "Will be removed in the future release. Please create UserConsentView with other initializers instead.")
public protocol UserConsentViewModel {}

@available(*, unavailable, renamed: "_UserConsentFormModel", message: "Will be removed in the future release. Please create UserConsentForm with other initializers instead.")
public protocol UserConsentFormModel {}

@available(*, unavailable, renamed: "_UserConsentPageModel", message: "Will be removed in the future release. Please create UserConsentPage with other initializers instead.")
public protocol UserConsentPageModel {}

// sourcery: generated_component_composite
public protocol _EmptyStateViewModel: TitleComponent, DescriptionTextComponent, DetailImageComponent {
    // sourcery: genericParameter.name = ActionView
    var action: _ActionModel? { get }
}

/// Deprecated EmptyStateViewModel
@available(*, deprecated, renamed: "_EmptyStateViewModel", message: "Will be removed in the future release. Please use IllustratedMessageComponent instead.")
public protocol EmptyStateViewModel {}

// sourcery: generated_component_not_configurable
public protocol _DurationPickerModel: DurationPickerComponent {}

@available(*, unavailable, renamed: "_DurationPickerModel", message: "Will be removed in the future release. Please create DurationPicker with other initializers instead.")
public protocol DurationPickerModel: DurationPickerComponent {}

// sourcery: availableAttributeContent = "iOS 15.0, macOS 12.0, *"
// sourcery: add_env_props = "presentationMode"
// sourcery: add_env_props = "listBackground"
// sourcery: add_env_props = "listpickerListStyle"
// sourcery: virtualPropContentView = "var contentView: AnyView? = nil"
// sourcery: virtualPropIsTopLevel = "var isTopLevel: Bool = true"
// sourcery: virtualPropDataHandler = "var dataHandler: (() -> ())? = nil"
// sourcery: generated_component_composite
public protocol SearchableListViewModel {
    // sourcery: genericParameter.name = CancelActionView
    // sourcery: default.value = _CancelActionDefault()
    var cancelAction: _ActionModel? { get }
    
    // sourcery: genericParameter.name = DoneActionView
    // sourcery: default.value = _DoneActionDefault()
    var doneAction: _ActionModel? { get }
}

/// :nodoc:
public protocol _KPIHeaderItemModel {}

// sourcery: generated_component_composite
public protocol _FilterFeedbackBarModel: AnyObject {
    // sourcery: bindingProperty
    // sourcery: backingComponent=_SortFilterMenuItemContainer
    var items: [[_SortFilterItem]] { get set }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var onUpdate: (() -> Void)? { get set }
}

@available(*, unavailable, renamed: "_FilterFeedbackBarModel", message: "Will be removed in the future release. Please use FilterFeedbackBar instead.")
public protocol FilterFeedbackBarModel {}

// sourcery: virtualPropActionHelper = "@StateObject var context: SortFilterContext = SortFilterContext()"
// sourcery: add_env_props = "dismiss"
// sourcery: generated_component_composite
// sourcery: virtualPropViewSize = "@State var size: CGSize = .zero"
// sourcery: virtualPropPopoverWidth = "let popoverWidth = 393.0"
public protocol _SortFilterViewModel: AnyObject, TitleComponent {
    // sourcery: bindingProperty
    // sourcery: backingComponent=_SortFilterCFGItemContainer
    var items: [[_SortFilterItem]] { get set }
    
    // sourcery: genericParameter.name = CancelActionView
    // sourcery: default.value = _CancelActionDefault()
    var cancelAction: _ActionModel? { get }
    
    // sourcery: genericParameter.name = ResetActionView
    // sourcery: default.value = _ResetActionDefault()
    var resetAction: _ActionModel? { get }
    
    // sourcery: genericParameter.name = ApplyActionView
    // sourcery: default.value = _ApplyActionDefault()
    var applyAction: _ActionModel? { get }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var onUpdate: (() -> Void)? { get }
}

@available(*, unavailable, renamed: "_SortFilterViewModel", message: "Will be removed in the future release. Please use SortFilterView instead.")
public protocol SortFilterViewModel {}

// sourcery: add_env_props = "_filterFeedbackBarStyle"
// sourcery: virtualPropActionHelper = "@StateObject var context: SortFilterContext = SortFilterContext()"
// sourcery: generated_component_composite
public protocol _FilterFeedbackBarItemModel: LeftIconComponent, TitleComponent, RightIconComponent {
    // sourcery: no_view
    var isSelected: Bool { get }
}

@available(*, unavailable, renamed: "_FilterFeedbackBarItemModel", message: "Will be removed in the future release. Please use FilterFeedbackBarItem instead.")
public protocol FilterFeedbackBarItemModel {}

// sourcery: add_env_props = "optionListPickerStyle"
// sourcery: generated_component_composite
public protocol _FilterFeedbackBarButtonModel: LeftIconComponent, TitleComponent {
    // sourcery: no_view
    var isSelected: Bool { get }
}

@available(*, unavailable, renamed: "_FilterFeedbackBarButtonModel", message: "Will be removed in the future release. Please use FilterFeedbackBarButton instead.")
public protocol FilterFeedbackBarButtonModel {}

// sourcery: add_env_props = "_filterFeedbackBarStyle"
// sourcery: generated_component_not_configurable
// sourcery: virtualPropHeight = "@State var _height: CGFloat = 0"
// sourcery: virtualPropUpdateSearchListPickerHeight = "var updateSearchListPickerHeight: ((CGFloat) -> ())? = nil"
// sourcery: virtualPropBarItemFrame = "var barItemFrame: CGRect = .zero"
public protocol OptionListPickerItemModel: OptionListPickerComponent {
    // sourcery: default.value = nil
    // sourcery: no_view
    var title: String? { get set }
    
    // sourcery: default.value = .fixed
    // sourcery: no_view
    var itemLayout: OptionListPickerItemLayoutType { get set }
    
    // sourcery: default.value = true
    // sourcery: no_view
    var allowsMultipleSelection: Bool { get set }

    // sourcery: default.value = false
    // sourcery: no_view
    var allowsEmptySelection: Bool { get set }

    // sourcery: default.value = nil
    // sourcery: no_view
    var onTap: ((_ index: Int) -> Void)? { get }
}

// sourcery: add_env_props = "_filterFeedbackBarStyle"
// sourcery: generated_component_not_configurable
// sourcery: virtualPropHeight = "@State var _height: CGFloat = 44"
// sourcery: virtualPropSearchText = "@State var _searchText: String = """
// sourcery: virtualPropSearchViewCornerRadius = "@State var _searchViewCornerRadius: CGFloat = 18"
// sourcery: virtualPropSelectAll = "var selectAll: ((Bool) -> ())? = nil"
// sourcery: virtualPropUpdateSearchListPickerHeight = "var updateSearchListPickerHeight: ((CGFloat) -> ())? = nil"
// sourcery: virtualPropAllowsMultipleSelection = "var allowsMultipleSelection: Bool = false"
// sourcery: virtualPropAllowsEmptySelection = "var allowsEmptySelection: Bool = false"
// sourcery: virtualPropPopoverWidth = "let popoverWidth = 393.0"
// sourcery: virtualPropIsSearchBarHidden = "var isSearchBarHidden: Bool = false"
// sourcery: virtualPropKeyboardHeight = "@State var _keyboardHeight: CGFloat = 0.0"
// sourcery: virtualPropDisableListEntriesSection = "var disableListEntriesSection: Bool = false"
// sourcery: virtualPropAllowsDisplaySelectionCount = "var allowsDisplaySelectionCount: Bool = true"
// sourcery: virtualPropBarItemFrame = "var barItemFrame: CGRect = .zero"
// sourcery: virtualPropUUIDValueOptions = "var uuidValueOptions: [[String: String]] = []"
public protocol SearchListPickerItemModel: OptionListPickerComponent {
    // sourcery: default.value = nil
    // sourcery: no_view
    var onTap: ((_ index: Int) -> Void)? { get }
}

// sourcery: add_env_props = "_filterFeedbackBarStyle"
// sourcery: generated_component_not_configurable
public protocol _SliderPickerItemModel: SliderPickerComponent {}

/// Deprecated SliderPickerItemModel
@available(*, deprecated, renamed: "_SliderPickerItemModel", message: "Will be removed in the future release. Please create FioriSlider with other initializers instead.")
public protocol SliderPickerItemModel {}
