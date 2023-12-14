import Foundation
import SwiftUI

// MARK: NewTitleComponent

protocol _TitleComponent {
    associatedtype _Title: View
    var title: _Title { get }
}

protocol _ActionTitleComponent {
    associatedtype _ActionTitle: View
    var actionTitle: _ActionTitle { get }
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
