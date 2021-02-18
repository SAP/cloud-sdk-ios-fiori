import Foundation

/// use for component with a function and one (or more) properties
internal protocol _ComponentMultiPropGenerating {}

// sourcery: backingComponent=ActivityItems
internal protocol _ActionItems: _ComponentMultiPropGenerating {
    // sourcery: no_style
    var actionItems_: [ActivityItemDataType]? { get }
    func didSelect(_ activityItem: ActivityItemDataType)
}
