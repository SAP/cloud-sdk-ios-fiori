import Foundation
import SwiftUI

/// use for component with a function and one (or more) properties
internal protocol _ComponentMultiPropGenerating {}

// sourcery: backingComponent=ActivityItems
internal protocol _ActionItems: _ComponentMultiPropGenerating {
    // sourcery: no_style
    var actionItems_: [ActivityItemDataType]? { get }
    func didSelectActivityItem(_ activityItem: ActivityItemDataType)
}

// sourcery: backingComponent=Action
internal protocol _Action: _ComponentMultiPropGenerating {
    var actionText_: String? { get } // label
    func didSelectAction() // action handler
}

// sourcery: backingComponent=SecondaryAction
internal protocol _SecondaryAction: _ComponentMultiPropGenerating {
    var secondaryActionText_: String? { get } // label
    func didSelectSecondaryAction() // action handler
}

// sourcery: backingComponent=TextInput
internal protocol _TextInput: _ComponentMultiPropGenerating {
    var textFilled_: String? { get }
    func onCommit() // action handler
}

internal protocol _KpiProgress: KpiComponent, _ComponentMultiPropGenerating {
    // sourcery: no_view
    var fraction_: Double? { get }
}
