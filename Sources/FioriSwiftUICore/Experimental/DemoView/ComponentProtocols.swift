import Foundation
import SwiftUI

// MARK: NewTitleComponent

protocol _TitleComponent {
    associatedtype Title: View
    var title: Title { get }
}

// MARK: NewSubtitleComponent

protocol _SubtitleComponent {
    associatedtype Subtitle: View
    var subtitle: Subtitle? { get }
}

// MARK: NewStatusComponent

protocol _StatusComponent {
    associatedtype Status: View
    var status: Status { get }
}

// MARK: NewActionComponent

protocol _ActionComponent {
    associatedtype ActionTitle: View
    // generate style
    var actionTitle: ActionTitle { get }
    var action: (() -> Void)? { get }
}
