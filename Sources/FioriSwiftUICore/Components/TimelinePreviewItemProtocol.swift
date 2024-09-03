import Foundation
import SwiftUI

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

extension TimelinePreviewItemModel {
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter
    }
}

public extension TimelinePreviewItem {
    init(model: any TimelinePreviewItemModel) {
        self.init(title: AttributedString(model.title), icon: model.icon, timelineNode: model.timelineNode, timestamp: AttributedString(model.formatter.string(from: model.due)), isFuture: model.isFuture ?? false, nodeType: model.timelineNode)
    }
}
