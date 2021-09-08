import Foundation

// Standard Components

// sourcery: generated_component_not_configurable
// sourcery: add_env_props = "numberOfLines"
public protocol IconStackModel: IconsComponent {}

// sourcery: add_env_props = "horizontalSizeClass"
// sourcery: add_env_props = "sizeCategory"
// sourcery: add_env_props = "splitPercent"
// sourcery: virtualPropIntStateChanged = "@State var mainViewSize: CGSize = .zero"
// sourcery: generated_component_composite
public protocol ObjectItemModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, StatusComponent, SubstatusComponent, DetailImageComponent, IconsComponent {
    // sourcery: genericParameter.name = ActionView
    var action: ActionModel? { get }
}

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
public protocol KPIItemModel: KpiComponent, SubtitleComponent {}

// sourcery: virtualPropIsPressed = "@State var isPressed: Bool = false"
// sourcery: virtualPropAction = "var action: (() -> Void)? = nil"
// sourcery: add_env_props = "kpiProgressViewStyle"
// sourcery: add_env_props = "isEnabled"
// sourcery: generated_component
public protocol KPIProgressItemModel: KpiProgressComponent, SubtitleComponent, FootnoteComponent {}

// sourcery: generated_component
public protocol KeyValueItemModel: KeyComponent, ValueComponent {}

// sourcery: generated_component_not_configurable
public protocol ActionModel: ActionComponent {}

// sourcery: generated_component_not_configurable
public protocol SecondaryActionModel: SecondaryActionComponent {}

// sourcery: generated_component_not_configurable
public protocol NextActionModel: NextActionComponent {}

// sourcery: generated_component_not_configurable
public protocol CancelActionModel: CancelActionComponent {}

// sourcery: generated_component_not_configurable
public protocol AllowActionModel: AllowActionComponent {}

// sourcery: generated_component_not_configurable
public protocol DenyActionModel: DenyActionComponent {}

// sourcery: generated_component_not_configurable
public protocol NotNowActionModel: NotNowActionComponent {}

// sourcery: generated_component_not_configurable
public protocol TextInputModel: TextInputComponent {}

// sourcery: generated_component
public protocol ActivityItemModel: IconComponent, SubtitleComponent {}

// sourcery: generated_component_not_configurable
public protocol ActivityItemsModel: ActionItemsComponent {}

// sourcery: generated_component
// sourcery: virtualPropDestinationView = "var destinationView: AnyView? = nil"
public protocol ListPickerItemModel: KeyComponent, ValueComponent {}

// sourcery: generated_component_not_configurable
public protocol ProgressIndicatorModel: ProgressIndicatorComponent {}

// sourcery: add_env_props = "sideBarListItemConfigMode"
// sourcery: generated_component
public protocol SideBarListItemModel: IconComponent, TitleComponent, SubtitleComponent, AccessoryIconComponent {}

// sourcery: availableAttributeContent = "iOS 14, *"
// sourcery: add_view_builder_params = "detail"
// sourcery: add_view_builder_params = "footer"
// sourcery: generated_component
public protocol SideBarModel: SubtitleComponent {}

// sourcery: generated_component_not_configurable
// sourcery: virtualPropContentHeight = "@State var contentHeight: CGFloat = .zero"
public protocol HTMLViewModel: HTMLViewComponent {}

// sourcery: generated_component
// sourcery: virtualPropBundle = "let bundle = Bundle.module"
// sourcery: virtualPropTableName = "let tableName = "FioriSwiftUICore""
// sourcery: virtualPropNumAccepted = "@State var numAccepted: Int = 0"
// sourcery: virtualPropContentHeight = "@State var contentHeight: CGFloat = .zero"
// sourcery: virtualPropCurrentState = "@State var currentState: UserConsentState = .userConsentInit"
// sourcery: add_env_props = ["presentationMode"]
// public protocol UserConsentModel: UserConsentFormsComponent, ActionTitleComponent, FirstActionTitleComponent, SecondActionTitleComponent {}

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
    var action: ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    var secondaryAction: SecondaryActionModel? { get }
}

// sourcery: generated_component_composite
public protocol ActivationScreenModel: TitleComponent, DescriptionTextComponent, FootnoteComponent {
    // sourcery: genericParameter.name = ActionView
    var action: ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    var secondaryAction: SecondaryActionModel? { get }
    
    // sourcery: genericParameter.name = TextInputView
    var textInput: TextInputModel? { get }
}

// sourcery: generated_component_composite
public protocol InfoViewModel: TitleComponent, DescriptionTextComponent {
    // sourcery: genericParameter.name = ProgressIndicatorView
    var progressIndicator: ProgressIndicatorModel? { get }
    
    // sourcery: genericParameter.name = ActionView
    var action: ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    var secondaryAction: SecondaryActionModel? { get }
}

// sourcery: generated_component_composite
// sourcery: virtualPropContentHeight = "@State var contentHeight: CGFloat = .zero"
// sourcery: add_env_props = ["presentationMode"]
public protocol EULAViewModel: TitleComponent {
    var htmlView: HTMLViewModel? { get }
    
    // sourcery: genericParameter.name = ActionView
    var action: ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    var secondaryAction: SecondaryActionModel? { get }
}

//// sourcery: generated_component_composite
// public protocol UserConsentView {
//    // sourcery: no_style
//    // sourcery: backingComponent=_UserConsentPagesContainer
//    // sourcery: customFunctionBuilder=UserConsentFormBuilder
//    // sourcery: genericParameter.type=PageViewContainer
//    var userConsentForms: [UserConsentFormModel] { get }
// }

// sourcery: virtualPropPageIndex = "@State var _pageIndex = 0"
// sourcery: virtualPropShowAlert = "@State var _showAlert = false"
// sourcery: generated_component_composite
public protocol UserConsentFormModel {
    // sourcery: genericParameter.name = NextActionView
    // sourcery: default.value = _NextActionDefaultModel()
    var nextAction: NextActionModel? { get }
    
    // sourcery: genericParameter.name = CancelActionView
    // sourcery: default.value = _CancelActionDefaultModel()
    var cancelAction: CancelActionModel? { get }
    
    // sourcery: genericParameter.name = AllowActionView
    // sourcery: default.value = _AllowActionDefaultModel()
    var allowAction: AllowActionModel? { get }
    
    // sourcery: genericParameter.name = DenyActionView
    // sourcery: default.value = _DenyActionDefaultModel()
    var denyAction: DenyActionModel? { get }
    
    // sourcery: genericParameter.name = NotNowActionView
    // sourcery: default.value = _NotNowActionDefaultModel()
    var notNowAction: NotNowActionModel? { get }
    
    // sourcery: no_style
    // sourcery: backingComponent=_UserConsentPagesContainer
    // sourcery: customFunctionBuilder=UserConsentFormBuilder
    // sourcery: genericParameter.type=PageViewContainer
    var userConsentPages: [UserConsentPageModel] { get }
    
    // sourcery: no_view
    // sourcery: default.value="true"
    var isRequired: Bool { get }
    
    // sourcery: default.value = AlertConfiguration.UserConsentFormDefault
    // sourcery: no_view
    var alertConfiguration: AlertConfiguration { get }
    
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
// sourcery: virtualPropBundle = "let bundle = Bundle.module"
// sourcery: virtualPropTableName = "let tableName = "FioriSwiftUICore""
// sourcery: virtualPropContentHeight = "@State var contentHeight: CGFloat = .zero"
public protocol UserConsentPageModel: TitleComponent, BodyTextComponent, FootnoteComponent {
    var htmlView: HTMLViewModel? { get }
}
