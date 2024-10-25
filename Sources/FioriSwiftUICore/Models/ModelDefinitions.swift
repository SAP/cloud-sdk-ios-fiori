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

// sourcery: add_env_props = "horizontalSizeClass"
// sourcery: add_env_props = "sizeCategory"
// sourcery: add_env_props = "splitPercent"
// sourcery: virtualPropIntStateChanged = "@State var mainViewSize: CGSize = .zero"
// sourcery: generated_component_composite
public protocol _ObjectItemModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, StatusComponent, SubstatusComponent, DetailImageComponent, IconsComponent, AvatarsComponent, FootnoteIconsComponent, TagsComponent {
    // sourcery: genericParameter.name = ActionView
    var action: _ActionModel? { get }
}

@available(*, unavailable, renamed: "_ObjectItemModel", message: "Will be removed in the future release. Please create ObjectItem with other initializers instead.")
public protocol ObjectItemModel {}

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
public protocol ObjectHeaderModel: TitleComponent, SubtitleComponent, TagsComponent, BodyTextComponent, FootnoteComponent, DescriptionTextComponent, StatusComponent, SubstatusComponent, DetailImageComponent {}

// sourcery: add_view_builder_params = "chart"
// sourcery: virtualPropIntStateChanged = "@State var mainViewSize: CGSize = CGSize(width: 312, height: 0)"
// sourcery: generated_component
public protocol HeaderChartModel: TitleComponent, SubtitleComponent, TrendComponent, TrendImageComponent, KpiComponent {}

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
public protocol SectionHeaderModel: TitleComponent, AttributeComponent {}

// sourcery: generated_component
// sourcery: virtualPropAction = "var action: (() -> Void)? = nil"
public protocol KPIItemModel: KpiComponent, SubtitleComponent, KPIHeaderItemModel {}

// sourcery: virtualPropIsPressed = "@State var isPressed: Bool = false"
// sourcery: virtualPropAction = "var action: (() -> Void)? = nil"
// sourcery: add_env_props = "kpiProgressViewStyle"
// sourcery: add_env_props = "isEnabled"
// sourcery: generated_component
public protocol KPIProgressItemModel: KpiProgressComponent, SubtitleComponent, FootnoteComponent, KPIHeaderItemModel {}

// sourcery: generated_component
public protocol KeyValueItemModel: KeyComponent, ValueComponent {
    // sourcery: default.value = .horizontal
    // sourcery: no_view
    var axis: Axis { get }
}

// sourcery: add_env_props = "sharedAction"
// sourcery: generated_component_not_configurable
public protocol _ActionModel: ActionComponent {}

@available(*, unavailable, renamed: "_ActionModel", message: "Will be removed in the future release. Please create Action with other initializers instead.")
public protocol ActionModel: ActionComponent {}

// sourcery: generated_component_not_configurable
public protocol TextInputModel: TextInputComponent {}

// sourcery: generated_component
public protocol ActivityItemModel: IconComponent, SubtitleComponent {}

// sourcery: generated_component_not_configurable
public protocol ActivityItemsModel: ActionItemsComponent {}

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

// sourcery: generated_component_not_configurable
public protocol ProgressIndicatorModel: ProgressIndicatorComponent {}

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

// sourcery: add_env_props = "horizontalSizeClass"
// sourcery: add_env_props = "sizeCategory"
// sourcery: add_env_props = "splitPercent"
// sourcery: virtualPropMainViewSize = "@State var mainViewSize: CGSize = .zero"
// sourcery: generated_component_composite
public protocol ContactItemModel: TitleComponent, SubtitleComponent, DescriptionTextComponent, DetailImageComponent {
    var actionItems: ActivityItemsModel? { get }
}

// sourcery: add_env_props = ["horizontalSizeClass"]
// sourcery: generated_component_composite
public protocol WelcomeScreenModel: TitleComponent, DescriptionTextComponent, SubtitleComponent, FootnoteComponent, IconComponent {
    // sourcery: genericParameter.name = TextInputView
    var textInput: TextInputModel? { get }
    
    // sourcery: genericParameter.name = ActionView
    var action: _ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    var secondaryAction: _ActionModel? { get }
}

// sourcery: generated_component_composite
public protocol ActivationScreenModel: TitleComponent, DescriptionTextComponent, FootnoteComponent {
    // sourcery: genericParameter.name = ActionView
    var action: _ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    var secondaryAction: _ActionModel? { get }
    
    // sourcery: genericParameter.name = TextInputView
    var textInput: TextInputModel? { get }
}

// sourcery: generated_component_composite
public protocol InfoViewModel: TitleComponent, DescriptionTextComponent {
    // sourcery: genericParameter.name = ProgressIndicatorView
    var progressIndicator: ProgressIndicatorModel? { get }
    
    // sourcery: genericParameter.name = ActionView
    var action: _ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    var secondaryAction: _ActionModel? { get }
}

// sourcery: generated_component_composite
// sourcery: virtualPropContentHeight = "@State var contentHeight: CGFloat = .zero"
// sourcery: add_env_props = ["presentationMode"]
public protocol EULAViewModel: TitleComponent, BodyAttributedTextComponent {
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

// sourcery: virtualPropFormIndex = "@State var _formIndex = 0"
// sourcery: virtualPropAllowedFormIndexes = "@State var _allowedFormIndexes: [Int] = []"
// sourcery: generated_component_composite
public protocol UserConsentViewModel {
    // sourcery: no_style
    // sourcery: backingComponent=_UserConsentFormsContainer
    // sourcery: customFunctionBuilder=IndexedViewBuilder
    // sourcery: genericParameter.type=IndexedViewContainer
    var userConsentForms: [UserConsentFormModel] { get }
 
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
public protocol UserConsentFormModel {
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
    var userConsentPages: [UserConsentPageModel] { get }
    
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
public protocol UserConsentPageModel: TitleComponent, BodyAttributedTextComponent {
    // sourcery: genericParameter.name = ActionView
    var action: _ActionModel? { get }
}

// sourcery: importFrameworks = ["Combine"]
// sourcery: virtualPropHeightDidChangePublisher = "public private(set) var _heightDidChangePublisher = CurrentValueSubject<CGFloat, Never>(0)"
// sourcery: virtualPropIsEditing = "@State var isEditing = false"
// sourcery: virtualPropFullSignatureImage = "@State var fullSignatureImage: UIImage?"
// sourcery: virtualPropCurrentDrawing = "@State var currentDrawing = Drawing()"
// sourcery: virtualPropDrawings = "@State var drawings = [Drawing]()"
// sourcery: virtualPropIsSaved = "@State var isSaved = false"
// sourcery: virtualPropIsReenterTapped = "@State var isReenterTapped = false"
// sourcery: virtualPropTitleFont = "var titleFont = Font.fiori(forTextStyle: .subheadline).weight(.semibold)"
// sourcery: virtualPropTitleColor = "var titleColor = Color.preferredColor(.primaryLabel)"
// sourcery: virtualPropStrokeWidth = "var strokeWidth: CGFloat = 3.0"
// sourcery: virtualPropStrokeColor = "var strokeColor = Color.preferredColor(.primaryLabel)"
// sourcery: virtualPropDrawingViewBackgroundColor = "var drawingViewBackgroundColor = Color.preferredColor(.primaryBackground)"
// sourcery: virtualPropXmarkColor = "var xmarkColor = Color.preferredColor(.quaternaryLabel)"
// sourcery: virtualPropSignatureLineColor = "var signatureLineColor = Color.preferredColor(.quaternaryLabel)"
// sourcery: virtualPropCropsImage = "var cropsImage = false"
// sourcery: virtualPropDrawingViewMinHeight = "let _drawingViewMinHeight: CGFloat = 256"
// sourcery: virtualPropDrawingViewMaxHeight = "var _drawingViewMaxHeight: CGFloat?"
// sourcery: virtualPropHidesXmark = "var hidesXmark = false"
// sourcery: virtualPropHidesSignatureLine = "var hidesSignatureLine = false"
// sourcery: virtualPropAddsTimestampInImage = "var addsTimestampInImage: Bool = false"
// sourcery: virtualPropTimestampFormatter = "var timestampFormatter: DateFormatter?"
// sourcery: virtualPropWatermarkText = "var watermarkText: String?"
// sourcery: virtualPropWatermarkTextAlignment = "var watermarkTextAlignment: NSTextAlignment = .natural"
// sourcery: virtualPropWatermarkTextFont = "var watermarkTextFont: UIFont = .preferredFont(forTextStyle: .caption1)"
// sourcery: virtualPropWatermarkTextColor = "var watermarkTextColor: Color = .preferredColor(.tertiaryLabel)"
// sourcery: virtualPropAppliesTintColorToImage = "var appliesTintColorToImage = true"
// sourcery: generated_component_composite
// sourcery: virtualPropIsRequired = "var isRequired = false"
public protocol SignatureCaptureViewModel: AnyObject {
    // sourcery: default.value = nil
    // sourcery: no_view
    var title: String? { get }

    // sourcery: genericParameter.name = StartActionView
    // sourcery: default.value = _TapToSignActionDefault()
    var startAction: _ActionModel? { get }

    // sourcery: genericParameter.name = RestartActionView
    // sourcery: default.value = _ReEnterSignatureActionDefault()
    var restartAction: _ActionModel? { get }

    // sourcery: genericParameter.name = CancelActionView
    // sourcery: default.value = _CancelActionDefault()
    var cancelAction: _ActionModel? { get }

    // sourcery: genericParameter.name = ClearActionView
    // sourcery: default.value = _ClearActionDefault()
    var clearAction: _ActionModel? { get }

    // sourcery: genericParameter.name = SaveActionView
    // sourcery: default.value = _SaveActionDefault()
    var saveAction: _ActionModel? { get }

    // sourcery: default.value = nil
    // sourcery: no_view
    var signatureImage: UIImage? { get }

    // sourcery: default.value = nil
    // sourcery: no_view
    var onSave: ((UIImage) -> Void)? { get }

    // sourcery: default.value = nil
    // sourcery: no_view
    var onDelete: (() -> Void)? { get }
}

// sourcery: generated_component_composite
public protocol EmptyStateViewModel: TitleComponent, DescriptionTextComponent, DetailImageComponent {
    // sourcery: genericParameter.name = ActionView
    var action: _ActionModel? { get }
}

// sourcery: generated_component_not_configurable
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

public protocol KPIHeaderItemModel {}

// sourcery: add_env_props = "stepLineModifier"
// sourcery: add_env_props = "stepAxis"
// sourcery: add_env_props = "currentStepId"
// sourcery: add_env_props = "stepStyle"
// sourcery: virtualPropTop = "var top: CGFloat = 8"
// sourcery: virtualPropVerticalSpacing = "var verticalSpacing: CGFloat = 8"
// sourcery: virtualPropBottom = "var bottom: CGFloat = 8"
// sourcery: virtualPropLeading = "var leading: CGFloat = 8"
// sourcery: virtualPropTrailing = "var trailing: CGFloat = 8"
// sourcery: virtualPropHorizontalSpacing = "var horizontalSpacing: CGFloat = 8"
// sourcery: virtualPropLineSize = "var lineSize: CGSize? = nil"
// sourcery: virtualPropStepState = "var state: StepProgressIndicatorState?"
// sourcery: virtualPropIsLastStep = "var isLastStep: Bool = false"
// sourcery: generated_component_composite
public protocol SingleStepModel {
    // sourcery: default.value = UUID().uuidString
    // sourcery: no_view
    var id: String { get set }
    
    var title: String? { get set }
    // sourcery: backingComponent=TextOrIconView
    var node: TextOrIcon { get set }
    
    // sourcery: no_style
    // sourcery: backingComponent=_StepsContainer
    // sourcery: customFunctionBuilder=IndexedViewBuilder
    // sourcery: genericParameter.type=IndexedViewContainer
    var substeps: [SingleStepModel] { get set }
}

// sourcery: add_env_props = "presentationMode"
// sourcery: virtualPropAxis = "var axis: Axis = .horizontal"
// sourcery: virtualPropStepsData = "var stepItems: [StepItem] = []"
// sourcery: virtualPropIsPresented = "@State var isPresented: Bool = false"
// sourcery: virtualPropStepFrames = "@State var stepFrames: [String: CGRect] = [:]"
// sourcery: virtualPropScrollBounds = "@State var scrollBounds: CGRect = .zero"
// sourcery: generated_component_composite
public protocol StepProgressIndicatorModel: AnyObject {
    // sourcery: bindingProperty
    // sourcery: no_view
    var selection: String { get set }
    
    var title: String? { get }
    
    // sourcery: genericParameter.name = ActionView
    // sourcery: default.value = _AllStepsActionDefault()
    var action: _ActionModel? { get }
    
    // sourcery: no_style
    // sourcery: backingComponent=_StepsContainer
    // sourcery: customFunctionBuilder=IndexedViewBuilder
    // sourcery: genericParameter.type=IndexedViewContainer
    var steps: [SingleStepModel] { get }
    
    // sourcery: genericParameter.name = CancelActionView
    // sourcery: default.value = _CancelActionDefault()
    var cancelAction: _ActionModel? { get }
}

// sourcery: generated_component_composite
public protocol FilterFeedbackBarModel: AnyObject {
    // sourcery: bindingProperty
    // sourcery: backingComponent=_SortFilterMenuItemContainer
    var items: [[SortFilterItem]] { get set }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var onUpdate: (() -> Void)? { get set }
}

// sourcery: virtualPropActionHelper = "@StateObject var context: SortFilterContext = SortFilterContext()"
// sourcery: add_env_props = "dismiss"
// sourcery: generated_component_composite
public protocol SortFilterViewModel: AnyObject, TitleComponent {
    // sourcery: bindingProperty
    // sourcery: backingComponent=_SortFilterCFGItemContainer
    var items: [[SortFilterItem]] { get set }
    
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

// sourcery: add_env_props = "filterFeedbackBarStyle"
// sourcery: virtualPropActionHelper = "@StateObject var context: SortFilterContext = SortFilterContext()"
// sourcery: generated_component_composite
public protocol FilterFeedbackBarItemModel: LeftIconComponent, TitleComponent, RightIconComponent {
    // sourcery: no_view
    var isSelected: Bool { get }
}

// sourcery: add_env_props = "optionListPickerStyle"
// sourcery: generated_component_composite
public protocol FilterFeedbackBarButtonModel: LeftIconComponent, TitleComponent {
    // sourcery: no_view
    var isSelected: Bool { get }
}

// sourcery: add_env_props = "filterFeedbackBarStyle"
// sourcery: generated_component_not_configurable
// sourcery: virtualPropHeight = "@State var _height: CGFloat = 0"
public protocol OptionListPickerItemModel: OptionListPickerComponent {
    // sourcery: default.value = .fixed
    // sourcery: no_view
    var itemLayout: OptionListPickerItemLayoutType { get set }
    
    // sourcery: default.value = nil
    // sourcery: no_view
    var onTap: ((_ index: Int) -> Void)? { get }
}

// sourcery: add_env_props = "filterFeedbackBarStyle"
// sourcery: generated_component_not_configurable
// sourcery: virtualPropHeight = "@State var _height: CGFloat = 44"
// sourcery: virtualPropSearchText = "@State var _searchText: String = """
// sourcery: virtualPropSearchViewCornerRadius = "@State var _searchViewCornerRadius: CGFloat = 18"
// sourcery: virtualPropSelectAll = "var selectAll: ((Bool) -> ())? = nil"
// sourcery: virtualPropUpdateSearchListPickerHeight = "var updateSearchListPickerHeight: ((CGFloat) -> ())? = nil"
// sourcery: virtualPropAllowsMultipleSelection = "var allowsMultipleSelection: Bool = false"
// sourcery: virtualPropAllowsEmptySelection = "var allowsEmptySelection: Bool = false"
public protocol SearchListPickerItemModel: OptionListPickerComponent {
    // sourcery: default.value = nil
    // sourcery: no_view
    var onTap: ((_ index: Int) -> Void)? { get }
}

// sourcery: add_env_props = "filterFeedbackBarStyle"
// sourcery: generated_component_not_configurable
// sourcery: add_env_props = "fioriToggleStyle"
public protocol SwitchPickerItemModel: SwitchPickerComponent {}

// sourcery: add_env_props = "filterFeedbackBarStyle"
// sourcery: generated_component_not_configurable
public protocol SliderPickerItemModel: SliderPickerComponent {}
