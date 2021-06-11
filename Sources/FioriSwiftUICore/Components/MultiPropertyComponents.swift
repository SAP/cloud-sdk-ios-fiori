import Foundation
import SwiftUI

/// use for component with a function and one (or more) properties
internal protocol _ComponentMultiPropGenerating {}

// sourcery: backingComponent=ActivityItems
internal protocol _ActionItems: _ComponentMultiPropGenerating {
    // sourcery: no_style
    var actionItems_: [ActivityItemDataType]? { get }
    // sourcery: no_nil_check
    func didSelectActivityItem(_ activityItem: ActivityItemDataType)
}

// sourcery: backingComponent=Action
internal protocol _Action: _ComponentMultiPropGenerating {
    var actionText_: String? { get } // label
    // sourcery: no_nil_check
    func didSelectAction() // action handler
}

// sourcery: backingComponent=SecondaryAction
internal protocol _SecondaryAction: _ComponentMultiPropGenerating {
    var secondaryActionText_: String? { get } // label
    // sourcery: no_nil_check
    func didSelectSecondaryAction() // action handler
}

// sourcery: backingComponent=SecondaryAction
internal protocol _StartAction: _ComponentMultiPropGenerating {
    var startActionText_: String? { get } // label
    // sourcery: no_nil_check
    func didSelectStartAction() // action handler
}

// sourcery: backingComponent=SecondaryAction
internal protocol _CancelAction: _ComponentMultiPropGenerating {
    var cancelActionText_: String? { get } // label
    // sourcery: no_nil_check
    func didSelectCancelAction() // action handler
}

// sourcery: backingComponent=SecondaryAction
internal protocol _ClearAction: _ComponentMultiPropGenerating {
    var clearActionText_: String? { get } // label
    // sourcery: no_nil_check
    func didSelectClearAction() // action handler
}

// sourcery: backingComponent=SecondaryAction
internal protocol _SaveAction: _ComponentMultiPropGenerating {
    var saveActionText_: String? { get } // label
    // sourcery: no_nil_check
    func didSelectSaveAction() // action handler
}

// sourcery: backingComponent=TextInput
internal protocol _TextInput: _ComponentMultiPropGenerating, ObservableObject {
    // sourcery: bindingPropertyOptional = .constant("")
    var textInputValue_: String { get set }
    // sourcery: no_nil_check
    func onCommit() // action handler
}

internal protocol _KpiProgress: KpiComponent, _ComponentMultiPropGenerating {
    // sourcery: no_view
    var fraction_: Double? { get }
}

// sourcery: backingComponent=ProgressIndicator
internal protocol _ProgressIndicator: _ComponentMultiPropGenerating {
    var progressIndicatorText_: String? { get }
}

// sourcery: backingComponent=HTMLView
internal protocol _HTMLView: _ComponentMultiPropGenerating {
    var htmlContent_: NSAttributedString? { get }
}

internal protocol _Signature: _ComponentMultiPropGenerating, ObservableObject {
    // sourcery: bindingProperty
    // sourcery: no_view
    var signature_: Image? { get set }
}
