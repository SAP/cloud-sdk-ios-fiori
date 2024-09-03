import Foundation
import SwiftUI

/// Protocol for a timelinePreviewItem
public protocol TimelinePreviewItemModel: Identifiable {
    var id: UUID { get }
    var title: String { get }
    var icon: Image? { get }
    var timelineNode: TimelineNodeType { get }
    var due: Date { get }
    var formatter: DateFormatter? { get }
    var isFuture: Bool? { get set }
    var isCurrent: Bool? { get set }
}

/// Extension to provide a default date formatter for the `TimelinePreviewItemModel`.
extension TimelinePreviewItemModel {
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter
    }
}

/// Extension to provide an initializer for `TimelinePreviewItem` from a `TimelinePreviewItemModel`.
public extension TimelinePreviewItem {
    init(model: any TimelinePreviewItemModel) {
        self.init(title: AttributedString(model.title), icon: model.icon, timelineNode: model.timelineNode, timestamp: AttributedString(model.formatter.string(from: model.due)), isFuture: model.isFuture ?? false, nodeType: model.timelineNode)
    }
}
