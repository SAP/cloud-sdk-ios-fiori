import Foundation
import SwiftUI

/// use for component with a function and one (or more) properties
internal protocol _ComponentMultiPropGenerating {}

internal protocol _ActionItems: _ComponentMultiPropGenerating {
    var actionItems_: [ActivityItemDataType]? { get }
    // sourcery: no_view
    var didSelectActivityItem_: ((ActivityItemDataType) -> Void)? { get }
}

internal protocol _Action: _ComponentMultiPropGenerating {
    var actionText_: String? { get }
    // sourcery: no_view
    var didSelectAction_: (() -> Void)? { get }
}

internal protocol _SecondaryAction: _ComponentMultiPropGenerating {
    var secondaryActionText_: String? { get }
    // sourcery: no_view
    var didSelectSecondaryAction_: (() -> Void)? { get }
}

internal protocol _NextAction: _ComponentMultiPropGenerating {
    // sourcery: default.value=NSLocalizedString("Next", comment: "")
    var nextActionText_: String? { get }
    // sourcery: no_view
    var didSelectNextAction_: (() -> Void)? { get }
}

internal protocol _CancelAction: _ComponentMultiPropGenerating {
    // sourcery: default.value=NSLocalizedString("Cancel", comment: "")
    var cancelActionText_: String? { get }
    // sourcery: no_view
    var didSelectCancelAction_: (() -> Void)? { get }
}

internal protocol _AllowAction: _ComponentMultiPropGenerating {
    // sourcery: default.value=NSLocalizedString("Allow", comment: "")
    var allowActionText_: String? { get }
    // sourcery: no_view
    var didSelectAllowAction_: (() -> Void)? { get }
}

internal protocol _DenyAction: _ComponentMultiPropGenerating {
    // sourcery: default.value=NSLocalizedString("Deny", comment: "")
    var denyActionText_: String? { get }
    // sourcery: no_view
    var didSelectDenyAction_: (() -> Void)? { get }
}

internal protocol _NotNowAction: _ComponentMultiPropGenerating {
    // sourcery: default.value=NSLocalizedString("Not Now", comment: "")
    var notNowActionText_: String? { get }
    // sourcery: no_view
    var didSelectNotNowAction_: (() -> Void)? { get }
}

internal protocol _TextInput: _ComponentMultiPropGenerating, AnyObject {
    // sourcery: bindingPropertyOptional = .constant("")
    var textInputValue_: String { get set }
    // sourcery: no_view
    var onCommit_: (() -> Void)? { get }
}

internal protocol _KpiProgress: KpiComponent, _ComponentMultiPropGenerating {
    // sourcery: no_view
    var fraction_: Double? { get }
}

internal protocol _ProgressIndicator: _ComponentMultiPropGenerating {
    var progressIndicatorText_: String? { get }
}

internal protocol _HTMLView: _ComponentMultiPropGenerating {
    var htmlContent_: NSAttributedString? { get }
}
