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
internal protocol _PrimaryAction: _ComponentMultiPropGenerating {
    var primaryActionText_: String? { get } // label
    func didSelectPrimaryAction() // action handler
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
