import Foundation
import UIKit

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
public protocol ObjectHeaderModel: TitleComponent, SubtitleComponent, TagStackModel, BodyTextComponent, FootnoteComponent, DescriptionTextComponent, StatusComponent, SubstatusComponent, DetailImageComponent {}

// sourcery: add_view_builder_params = "chart"
// sourcery: virtualPropIntStateChanged = "@State var mainViewSize: CGSize = CGSize(width: 312, height: 0)"
// sourcery: generated_component
public protocol HeaderChartModel: TitleComponent, SubtitleComponent, TrendComponent, TrendImageComponent, KpiComponent {}

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

// sourcery: availableAttributeContent = "iOS 14, *"
// sourcery: virtualPropAnimatedFraction = "@State var animatedFraction: Double = 0.0"
// sourcery: virtualPropAction = "var action: (() -> Void)? = nil"
// sourcery: generated_component
public protocol KPIProgressItemModel: KpiProgressComponent, SubtitleComponent, FootnoteComponent {}

// sourcery: generated_component
public protocol KeyValueItemModel: KeyComponent, ValueComponent {}

// sourcery: generated_component_not_configurable
public protocol ActionModel: ActionComponent {}

// sourcery: generated_component_not_configurable
public protocol SecondaryActionModel: SecondaryActionComponent {}

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

// ----------------------------------------------------------------------------------------------------------------

// sourcery: add_env_props = "horizontalSizeClass"
// sourcery: generated_component_composite
public protocol ContactItemModel: TitleComponent, SubtitleComponent, FootnoteComponent, DescriptionTextComponent, DetailImageComponent, ActivityItemsModel {}

// sourcery: add_env_props = ["horizontalSizeClass"]
// sourcery: generated_component_composite
public protocol WelcomeScreenModel: TitleComponent, DescriptionTextComponent, TextInputModel, ActionModel, SubtitleComponent, FootnoteComponent, SecondaryActionModel, IconComponent {}

// sourcery: generated_component_composite
public protocol ActivationScreenModel: TitleComponent, DescriptionTextComponent, TextInputModel, ActionModel, FootnoteComponent, SecondaryActionModel {}

// sourcery: generated_component_composite
public protocol InfoViewModel: TitleComponent, DescriptionTextComponent, ProgressIndicatorModel, ActionModel, SecondaryActionModel {}

// sourcery: generated_component_composite
// sourcery: virtualPropContentHeight = "@State var contentHeight: CGFloat = .zero"
// sourcery: add_env_props = ["presentationMode"]
public protocol EULAViewModel: TitleComponent, HTMLViewModel, ActionModel, SecondaryActionModel {}
