import Foundation

/// use for component with a function and one (or more) properties
internal protocol _ComponentMultiPropGenerating {}

// sourcery: backingComponent=ActivityItems
internal protocol _ActionItems: _ComponentMultiPropGenerating {
    // sourcery: no_style
    var actionItems_: [ActivityItemDataType]? { get }
    func didSelect(_ activityItem: ActivityItemDataType)
}

// sourcery: backingComponent=PrimaryAction
internal protocol _primaryAction: _ComponentMultiPropGenerating {
    // sourcery: no_style
    var primaryActionLabel_: String? { get } // label
    func didSelectPrimaryAction() // action handler
}

// sourcery: backingComponent=SecondaryAction
internal protocol _secondaryAction: _ComponentMultiPropGenerating {
    // sourcery: no_style
    var secondaryActionLabel_: String? { get } // label
    func didSelectSecondaryAction() // action handler
}
