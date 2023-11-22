import Foundation
import SwiftUI

// MARK: NewTitleComponent

protocol _TitleComponent {
    associatedtype _Title: View
    var title: _Title { get }
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

protocol _PrimaryButtonComponent {
    associatedtype Label: View
    // generate style
    var primaryButton: Button<Label> { get }
}

protocol _ActionComponent {
    associatedtype _ActionTitle: View
    // generate style
    var actionTitle: _ActionTitle { get }
    var action: (() -> Void)? { get }
}