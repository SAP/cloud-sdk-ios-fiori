import Foundation
import SwiftUI

// sourcery: isCompositeComponent
protocol _NewActionComponent: _ActionTitleComponent {
    var action: (() -> Void)? { get }
}

// sourcery: isCompositeComponent
protocol _NewObjectItemComponent: _TitleComponent, _SubtitleComponent, _FootnoteComponent, _DescriptionComponent, _StatusComponent, _SubstatusComponent, _DetailImageComponent, _IconsComponent, _AvatarsComponent, _FootnoteIconsComponent, _TagsComponent, _NewActionComponent {}
