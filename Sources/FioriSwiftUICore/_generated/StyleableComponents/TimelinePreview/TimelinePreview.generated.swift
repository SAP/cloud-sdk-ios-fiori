// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `TimelinePreview` is an view for showing a collection of tasks. It comes with a header and a collection view which uses `TimelinePreviewItem` to represent data items within it.
///
/// ## Usage
/// ```swift
/// @State private var items: [TimelinePreviewItemModel] = [TimelinePreviewItemModel(title: "Complete", timelineNode: TimelineNodeType.complete, due: ISO8601DateFormatter().date(from: "2023-07-21T12:00:00Z")!),TimelinePreviewItemModel(title: "End", timelineNode: TimelineNodeType.end, due: ISO8601DateFormatter().date(from: "2023-08-10T12:00:00Z")!)]
/// TimelinePreview(headerTitle: { Text("Timeline") }, data: self.$items)
/// ```
public struct TimelinePreview {
    let headerTitle: any View
    let seeAllAction: any View
    /// The data for all timelinePreviewItems
    @Binding var data: [TimelinePreviewItemModel]

    @Environment(\.timelinePreviewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder headerTitle: () -> any View,
                @ViewBuilder seeAllAction: () -> any View = { Image(systemName: "chevron.forward") },
                data: Binding<[TimelinePreviewItemModel]>)
    {
        self.headerTitle = HeaderTitle { headerTitle() }
        self.seeAllAction = SeeAllAction { seeAllAction() }
        self._data = data
    }
}

public extension TimelinePreview {
    init(headerTitle: AttributedString,
         @ViewBuilder seeAllAction: () -> any View = { Image(systemName: "chevron.forward") },
         data: Binding<[TimelinePreviewItemModel]>)
    {
        self.init(headerTitle: { Text(headerTitle) }, seeAllAction: seeAllAction, data: data)
    }
}

public extension TimelinePreview {
    init(_ configuration: TimelinePreviewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelinePreviewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.headerTitle = configuration.headerTitle
        self.seeAllAction = configuration.seeAllAction
        self._data = configuration.$data
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimelinePreview: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(headerTitle: .init(self.headerTitle), seeAllAction: .init(self.seeAllAction), data: self.$data)).typeErased
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
        TimelinePreview(.init(headerTitle: .init(self.headerTitle), seeAllAction: .init(self.seeAllAction), data: self.$data))
            .shouldApplyDefaultStyle(false)
            .timelinePreviewStyle(TimelinePreviewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
