import Foundation
import SwiftUI

// sourcery: CompositeComponent
protocol _NewObjectItemComponent: _TitleComponent, _SubtitleComponent, _FootnoteComponent, _DescriptionComponent, _StatusComponent, _SubstatusComponent, _DetailImageComponent, _IconsComponent, _AvatarsComponent, _FootnoteIconsComponent, _TagsComponent, _NewActionComponent {}

// sourcery: CompositeComponent
protocol _DemoViewComponent: _TitleComponent, _SubtitleComponent, _StatusComponent, _NewActionComponent, _SwitchComponent {}
