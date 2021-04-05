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
public protocol ObjectItemModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, StatusComponent, SubstatusComponent, DetailImageComponent, IconStackModel, ActionModel {}

// sourcery: generated_component
public protocol ObjectHeaderModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, StatusComponent, SubstatusComponent, DetailImageComponent {}

// sourcery: generated_component
public protocol HeaderChartModel: TitleComponent, SubtitleComponent, TrendComponent, KpiComponent {}

// sourcery: generated_component
public protocol TimelineItemModel: TitleComponent, SubtitleComponent, FootnoteComponent, AttributeComponent, SecondaryAttributeComponent, TimestampComponent, SecondaryTimestampComponent, StatusComponent, SubstatusComponent {}

// sourcery: generated_component
public protocol ChartFloorplanModel: TitleComponent, SubtitleComponent, StatusComponent, ValueAxisTitleComponent, SeriesTitlesComponent, CategoryAxisTitleComponent {}

// sourcery: add_view_builder_params = "actionItems"
// sourcery: add_env_props = ["horizontalSizeClass"]
// sourcery: generated_component
public protocol ProfileHeaderModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, DetailImageComponent {}

// sourcery: generated_component
public protocol TimelineGridItemModel: TitleComponent, TimestampComponent, StatusComponent {}

// sourcery: generated_component
public protocol CollectionItemModel: DetailImageComponent, TitleComponent, SubtitleComponent {}

// sourcery: add_env_props = "colorScheme"
// sourcery: generated_component
public protocol SectionHeaderModel: TitleComponent, AttributeComponent {}

// sourcery: generated_component
// sourcery: virtualPropAction = "var action: (() -> Void)? = nil"
public protocol KPIItemModel: KpiComponent, SubtitleComponent {}

// sourcery: generated_component
public protocol KeyValueItemModel: KeyComponent, ValueComponent {}

// sourcery: generated_component_not_configurable
public protocol ActionModel: ActionComponent {}

// sourcery: generated_component_not_configurable
public protocol SecondaryActionModel: SecondaryActionComponent {}

// sourcery: generated_component_not_configurable
// sourcery: virtualPropTextInputValue = "@ObservedObject var textInputValue = UserInput()"
public protocol TextInputModel: TextInputComponent {}

// sourcery: generated_component
public protocol ActivityItemModel: IconComponent, SubtitleComponent {}

// sourcery: generated_component_not_configurable
public protocol ActivityItemsModel: ActionItemsComponent {}

// sourcery: generated_component
// sourcery: virtualPropDestinationView = "var destinationView: AnyView? = nil"
public protocol ListPickerItemModel: KeyComponent, ValueComponent {}

// ----------------------------------------------------------------------------------------------------------------

// sourcery: add_env_props = "horizontalSizeClass"
// sourcery: generated_component_composite
public protocol ContactItemModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, DetailImageComponent, ActivityItemsModel {}

// sourcery: add_env_props = ["horizontalSizeClass"]
// sourcery: generated_component_composite
public protocol WelcomeScreenModel: TitleComponent, DescriptionTextComponent, ActionModel, SubtitleComponent, FootnoteComponent, SecondaryActionModel, IconComponent {}

// sourcery: generated_component_composite
// sourcery: virtualPropEmailFilled = "@ObservedObject var emailFilled = UserInput()"
// sourcery: virtualPropButtonEnabled = "@State var buttonEnabled: Bool = false"
public protocol ActivationScreenModel: TitleComponent, DescriptionTextComponent, TextInputModel, ActionModel, FootnoteComponent, SecondaryActionModel {}
