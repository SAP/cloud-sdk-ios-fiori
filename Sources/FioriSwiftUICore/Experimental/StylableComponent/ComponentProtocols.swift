import Foundation
import SwiftUI

// MARK: NewTitleComponent

protocol _TitleComponent {
    var title: any View { get }
}

protocol _ActionTitleComponent {
    var actionTitle: any View { get }
}

// MARK: NewSubtitleComponent

protocol _SubtitleComponent {
    var subtitle: any View { get }
}

protocol _FootnoteComponent {
    var footnote: any View { get }
}

protocol _DescriptionComponent {
    var description: any View { get }
}

// MARK: NewStatusComponent

protocol _StatusComponent {
    var status: any View { get }
}

protocol _SubstatusComponent {
    var substatus: any View { get }
}

protocol _DetailImageComponent {
    var detailImage: any View { get }
}

protocol _IconsComponent {
    var icons: any View { get }
}

protocol _TagsComponent {
    var tags: any View { get }
}

// MARK: NewActionComponent

protocol _ActionComponent: _ActionTitleComponent {
    var action: (() -> Void)? { get }
}

protocol _SwitchComponent {
    var isOn: Bool { get }
}
