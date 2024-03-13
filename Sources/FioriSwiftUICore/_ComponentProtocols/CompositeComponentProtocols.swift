import Foundation
import SwiftUI

/// A view that displays information of an object.
// sourcery: CompositeComponent
protocol _ObjectItemComponent: _TitleComponent, _SubtitleComponent, _FootnoteComponent, _DescriptionComponent, _StatusComponent, _SubstatusComponent, _DetailImageComponent, _IconsComponent, _AvatarsComponent, _FootnoteIconsComponent, _TagsComponent, _ActionComponent {}

// sourcery: CompositeComponent
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
protocol _CardFooterComponent: _ActionComponent, _SecondaryActionComponent {}

// sourcery: CompositeComponent
protocol _CardHeaderComponent: _CardMediaComponent, _CardMainHeaderComponent, _CardExtHeaderComponent {}

// sourcery: CompositeComponent
protocol _CardComponent: _CardHeaderComponent, _CardBodyComponent, _CardFooterComponent {}

// sourcery: CompositeComponent
protocol _IllustratedMessageComponent: _DetailImageComponent, _TitleComponent, _DescriptionComponent, _ActionComponent {
    var imageSize: ImageSize? { get }
}

// sourcery: CompositeComponent
protocol _InformationViewComponent: _IconComponent, _DescriptionComponent {}

// sourcery: CompositeComponent
protocol _TextInputInfoViewComponent: _InformationViewComponent, _CounterComponent {}

// sourcery: CompositeComponent
protocol _LinearProgressIndicatorViewComponent: _LinearProgressIndicatorComponent, _IconComponent, _DescriptionComponent {}

// sourcery: CompositeComponent
protocol _FormViewComponent {
    var controlState: ControlState? { get }
    var errorMessage: AttributedString? { get }
}

// sourcery: CompositeComponent
protocol _PlaceholderTextEditorComponent: _TextViewComponent, _PlaceholderComponent {}

// sourcery: CompositeComponent
protocol _NoteFormViewComponent: _PlaceholderTextEditorComponent, _FormViewComponent {
    var minTextEditorHeight: CGFloat? { get }
    var maxTextEditorHeight: CGFloat? { get }
    var maxTextLength: Int? { get }
    var hintText: AttributedString? { get }
    var hidesReadOnlyHint: Bool? { get }
    var isCharCountEnabled: Bool? { get }
    var allowsBeyondLimit: Bool? { get }
    var charCountReachLimitMessage: String? { get }
    var charCountBeyondLimitMsg: String? { get }
}

// sourcery: CompositeComponent
protocol _KeyValueFormViewComponent: _TitleComponent, _NoteFormViewComponent {}
