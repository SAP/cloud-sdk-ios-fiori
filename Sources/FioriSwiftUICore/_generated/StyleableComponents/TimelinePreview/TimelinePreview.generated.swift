// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `TimelinePreview` is an view for showing a collection of tasks. It comes with a header and a collection view which uses `TimelinePreviewItem` to represent data items within it.
///
/// ## Usage
/// ```swift
/// Create a struct that conforms to the protocol: TimelinePreviewItemModel, providing implementation for the required properties and methods:
/// struct TimelinePreviewItemModelImplementation: TimelinePreviewItemModel {
///    var id: UUID
///    var title: AttributedString
///    var icon: Image?
///    var timelineNode: FioriSwiftUICore.TimelineNodeType
///    var due: Date
///    var formatter: DateFormatter?
///    var isFuture: Bool?
///    var isCurrent: Bool?
///
///    init(id: UUID = UUID(), title: AttributedString, icon: Image? = nil, timelineNode: FioriSwiftUICore.TimelineNodeType, due: Date, dateFormat: String? = nil, isFuture: Bool? = nil, isCurrent: Bool? = nil) {
///        self.id = id
///        self.title = title
///        self.icon = icon
///        self.timelineNode = timelineNode
///        self.due = due
///        self.formatter = DateFormatter()
///        if let dateFormat {
///            self.formatter.dateFormat = dateFormat
///        } else {
///            self.formatter.dateFormat = "MMMM dd yyyy"
///        }
///        self.isFuture = isFuture
///        self.isCurrent = isCurrent
///    }
/// }
///
/// Create a Protocol Instance array with Initial Value
/// @State private var items: [TimelinePreviewItemModelImplementation] = [TimelinePreviewItemModelImplementation(title: "Complete", timelineNode: TimelineNodeType.complete, due: ISO8601DateFormatter().date(from: "2023-07-21T12:00:00Z")!),TimelinePreviewItemModelImplementation(title: "End", timelineNode: TimelineNodeType.end, due: ISO8601DateFormatter().date(from: "2023-08-10T12:00:00Z")!)]
///
///  Create TimelinePreview with the array
/// TimelinePreview(optionalTitle: { Text("Timeline") }, data: .constant(items.map { $0 as any TimelinePreviewItemModel }))
/// ```
public struct TimelinePreview {
    let optionalTitle: any View
    let action: any View
    /// The data for all timelinePreviewItems
    @Binding var items: [any TimelinePreviewItemModel]

    @Environment(\.timelinePreviewStyle) var style

    var componentIdentifier: String = TimelinePreview.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder optionalTitle: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                items: Binding<[any TimelinePreviewItemModel]>,
                componentIdentifier: String? = TimelinePreview.identifier)
    {
        self.optionalTitle = OptionalTitle(optionalTitle: optionalTitle, componentIdentifier: componentIdentifier)
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self._items = items
        self.componentIdentifier = componentIdentifier ?? TimelinePreview.identifier
    }
}

public extension TimelinePreview {
    static let identifier = "fiori_timelinepreview_component"
}

public extension TimelinePreview {
    init(optionalTitle: AttributedString?,
         action: FioriButton? = nil,
         items: Binding<[any TimelinePreviewItemModel]>)
    {
        self.init(optionalTitle: { OptionalText(optionalTitle) }, action: { action }, items: items)
    }
}

public extension TimelinePreview {
    init(_ configuration: TimelinePreviewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelinePreviewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.optionalTitle = configuration.optionalTitle
        self.action = configuration.action
        self._items = configuration.$items
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TimelinePreview: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, optionalTitle: .init(self.optionalTitle), action: .init(self.action), items: self.$items)).typeErased
                .transformEnvironment(\.timelinePreviewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TimelinePreview {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TimelinePreview(.init(componentIdentifier: self.componentIdentifier, optionalTitle: .init(self.optionalTitle), action: .init(self.action), items: self.$items))
            .shouldApplyDefaultStyle(false)
            .timelinePreviewStyle(TimelinePreviewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
