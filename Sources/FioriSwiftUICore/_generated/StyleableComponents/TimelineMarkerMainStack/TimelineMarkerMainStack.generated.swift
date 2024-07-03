// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TimelineMarkerMainStack {
    let title: any View

    @Environment(\.timelineMarkerMainStackStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View) {
        self.title = Title { title() }
    }
}

public extension TimelineMarkerMainStack {
    init(title: AttributedString) {
        self.init(title: { Text(title) })
    }
}

public extension TimelineMarkerMainStack {
    init(_ configuration: TimelineMarkerMainStackConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineMarkerMainStackConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimelineMarkerMainStack: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title))).typeErased
                .transformEnvironment(\.timelineMarkerMainStackStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TimelineMarkerMainStack {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TimelineMarkerMainStack(.init(title: .init(self.title)))
            .shouldApplyDefaultStyle(false)
            .timelineMarkerMainStackStyle(TimelineMarkerMainStackFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
