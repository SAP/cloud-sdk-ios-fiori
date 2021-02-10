import Foundation

/// use for component with a function and one (or more) properties
internal protocol _ComponentMultiPropGenerating {}

internal protocol _ActionItems: _ComponentMultiPropGenerating {
    // sourcery: no_style
    // sourcery: backingComponent=ActivityItems
    // sourcery: backingComponentArgumentLabel=actionItemsControl
    var actionItems_: [ActivityItemDataType]? { get }
    func didSelect(_ activityItem: ActivityItemDataType)
}
