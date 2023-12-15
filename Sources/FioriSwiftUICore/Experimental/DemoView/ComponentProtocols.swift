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
    associatedtype Subtitle: View
    var subtitle: Subtitle { get }
}

// MARK: NewStatusComponent

protocol _StatusComponent {
    associatedtype Status: View
    var status: Status { get }
}

// MARK: NewActionComponent

protocol _ActionComponent: _ActionTitleComponent {
    var action: (() -> Void)? { get }
}

protocol _SwitchComponent {
    var isOn: Bool { get }
}
