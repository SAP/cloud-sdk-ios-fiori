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

public extension TimelinePreviewItemModel {
    /// A default date formatter used when `formatter` is `nil`.
    var resolvedFormatter: DateFormatter {
        if let formatter {
            return formatter
        }
        let f = DateFormatter()
        f.dateFormat = "MMMM dd yyyy"
        return f
    }
}

/// Extension to provide an initializer for `TimelinePreviewItem` from a `TimelinePreviewItemModel`.
public extension TimelinePreviewItem {
    /// Initialize a `TimelinePreviewItem` from a `TimelinePreviewItemModel`.
    @MainActor init(model: any TimelinePreviewItemModel) {
        self.init(
            title: AttributedString(model.title),
            icon: model.icon,
            timelineNode: model.timelineNode,
            timestamp: AttributedString(model.resolvedFormatter.string(from: model.due)),
            isFuture: model.isFuture ?? false,
            nodeType: model.timelineNode
        )
    }
}

/// Controls the sort order of items in a `TimelinePreview`.
public enum TimelinePreviewSortOrder: Sendable {
    /// Ascending by due date (earliest first). Default.
    case ascending
    /// Descending by due date (latest first).
    case descending
}

private struct TimelinePreviewSortOrderKey: EnvironmentKey {
    static let defaultValue: TimelinePreviewSortOrder = .ascending
}

public extension EnvironmentValues {
    /// The sort order for items displayed in a `TimelinePreview`.
    var timelinePreviewSortOrder: TimelinePreviewSortOrder {
        get { self[TimelinePreviewSortOrderKey.self] }
        set { self[TimelinePreviewSortOrderKey.self] = newValue }
    }
}

public extension View {
    /// Sets the sort order for items displayed in a `TimelinePreview`.
    func timelinePreviewSortOrder(_ order: TimelinePreviewSortOrder) -> some View {
        environment(\.timelinePreviewSortOrder, order)
    }
}
