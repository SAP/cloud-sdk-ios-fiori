import Foundation
import SwiftUI

/// A view that displays information of an object.
// sourcery: CompositeComponent
protocol _ObjectItemComponent: _TitleComponent, _SubtitleComponent, _FootnoteComponent, _DescriptionComponent, _StatusComponent, _SubstatusComponent, _DetailImageComponent, _IconsComponent, _AvatarsComponent, _FootnoteIconsComponent, _TagsComponent, _ActionComponent {}

// sourcery: CompositeComponent
protocol _DemoViewComponent: _TitleComponent, _SubtitleComponent, _StatusComponent, _ActionComponent, _SwitchComponent {}

// sourcery: CompositeComponent
protocol _CardMediaComponent: _MediaImageComponent, _DescriptionComponent {}

// sourcery: CompositeComponent
protocol _CardMainHeaderComponent: _TitleComponent, _SubtitleComponent, _DetailImageComponent, _CounterComponent {}

// sourcery: CompositeComponent
protocol _CardExtHeaderComponent: _Row1Component, _Row2Component, _Row3Component {}

// sourcery: CompositeComponent
protocol _CardFooterComponent: _ActionComponent, _SecondaryActionComponent {}

// sourcery: CompositeComponent
protocol _CardHeaderComponent: _CardMediaComponent, _CardMainHeaderComponent, _CardExtHeaderComponent {}

// sourcery: CompositeComponent
protocol _CardComponent: _CardHeaderComponent, _CardBodyComponent, _CardFooterComponent {}

// sourcery: CompositeComponent
protocol _InformationViewComponent: _IconComponent, _DescriptionComponent {
    @ViewBuilder
    var content: () -> any View { get }
}

// sourcery: CompositeComponent
protocol _TextInputInfoViewComponent: _InformationViewComponent, _CounterComponent {}

// sourcery: CompositeComponent
protocol _LinearProgressIndicatorViewComponent: _LinearProgressIndicatorComponent, _IconComponent, _DescriptionComponent {}
