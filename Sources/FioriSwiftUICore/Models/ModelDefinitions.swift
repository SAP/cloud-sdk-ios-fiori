import Foundation
import SwiftUI

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
    var secondaryAction: ActionModel? { get }
}

// sourcery: generated_component_composite
public protocol ActivationScreenModel: TitleComponent, DescriptionTextComponent, FootnoteComponent {
    // sourcery: genericParameter.name = ActionView
    var action: ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    var secondaryAction: ActionModel? { get }
    
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
    var secondaryAction: ActionModel? { get }
}

// sourcery: generated_component_composite
// sourcery: virtualPropContentHeight = "@State var contentHeight: CGFloat = .zero"
// sourcery: add_env_props = ["presentationMode"]
public protocol EULAViewModel: TitleComponent, BodyAttributedTextComponent {
    // sourcery: genericParameter.name = ActionView
    // sourcery: default.value = _AgreeActionDefault()
    var action: ActionModel? { get }
    
    // sourcery: genericParameter.name = SecondaryActionView
    // sourcery: default.value = _DisagreeActionDefault()
    var secondaryAction: ActionModel? { get }
    
    // sourcery: genericParameter.name = CancelActionView
    // sourcery: default.value = _CancelActionDefault()
    var cancelAction: ActionModel? { get }
    
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
// sourcery: virtualPropXmarkColor = "var xmarkColor = Color.preferredColor(.quarternaryLabel)"
// sourcery: virtualPropSignatureLineColor = "var signatureLineColor = Color.preferredColor(.quarternaryLabel)"
// sourcery: virtualPropCropsImage = "var cropsImage = false"
// sourcery: virtualPropDrawingViewMinHeight = "let _drawingViewMinHeight: CGFloat = 256"
// sourcery: virtualPropDrawingViewMaxHeight = "var _drawingViewMaxHeight: CGFloat?"
// sourcery: virtualPropHidesXmark = "var hidesXmark = false"
// sourcery: virtualPropHidesSignatureLine = "var hidesSignatureLine = false"
// sourcery: generated_component_composite
public protocol SignatureCaptureViewModel: AnyObject {
    // sourcery: default.value = nil
    // sourcery: no_view
    var title: String? { get }

    // sourcery: genericParameter.name = StartActionView
    // sourcery: default.value = _TapToSignActionDefault()
    var startAction: ActionModel? { get }

    // sourcery: genericParameter.name = RestartActionView
    // sourcery: default.value = _ReEnterSignatureActionDefault()
    var restartAction: ActionModel? { get }

    // sourcery: genericParameter.name = CancelActionView
    // sourcery: default.value = _CancelActionDefault()
    var cancelAction: ActionModel? { get }

    // sourcery: genericParameter.name = ClearActionView
    // sourcery: default.value = _ClearActionDefault()
    var clearAction: ActionModel? { get }

    // sourcery: genericParameter.name = SaveActionView
    // sourcery: default.value = _SaveActionDefault()
    var saveAction: ActionModel? { get }

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
