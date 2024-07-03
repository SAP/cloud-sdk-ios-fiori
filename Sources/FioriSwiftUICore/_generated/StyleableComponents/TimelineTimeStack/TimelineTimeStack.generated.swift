// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TimelineTimeStack {
    let timestampLabel: any View
    let secondaryTimestampLabel: any View
    let secondaryTimestampImage: any View

    @Environment(\.timelineTimeStackStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder timestampLabel: () -> any View = { EmptyView() },
                @ViewBuilder secondaryTimestampLabel: () -> any View = { EmptyView() },
                @ViewBuilder secondaryTimestampImage: () -> any View = { EmptyView() })
    {
        self.timestampLabel = TimestampLabel { timestampLabel() }
        self.secondaryTimestampLabel = SecondaryTimestampLabel { secondaryTimestampLabel() }
        self.secondaryTimestampImage = SecondaryTimestampImage { secondaryTimestampImage() }
    }
}

public extension TimelineTimeStack {
    init(timestampLabel: AttributedString? = nil,
         secondaryTimestampLabel: AttributedString? = nil,
         secondaryTimestampImage: Image? = nil)
    {
        self.init(timestampLabel: { OptionalText(timestampLabel) }, secondaryTimestampLabel: { OptionalText(secondaryTimestampLabel) }, secondaryTimestampImage: { secondaryTimestampImage })
    }
}

public extension TimelineTimeStack {
    init(_ configuration: TimelineTimeStackConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineTimeStackConfiguration, shouldApplyDefaultStyle: Bool) {
        self.timestampLabel = configuration.timestampLabel
        self.secondaryTimestampLabel = configuration.secondaryTimestampLabel
        self.secondaryTimestampImage = configuration.secondaryTimestampImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimelineTimeStack: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(timestampLabel: .init(self.timestampLabel), secondaryTimestampLabel: .init(self.secondaryTimestampLabel), secondaryTimestampImage: .init(self.secondaryTimestampImage))).typeErased
                .transformEnvironment(\.timelineTimeStackStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TimelineTimeStack {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TimelineTimeStack(.init(timestampLabel: .init(self.timestampLabel), secondaryTimestampLabel: .init(self.secondaryTimestampLabel), secondaryTimestampImage: .init(self.secondaryTimestampImage)))
            .shouldApplyDefaultStyle(false)
            .timelineTimeStackStyle(TimelineTimeStackFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
