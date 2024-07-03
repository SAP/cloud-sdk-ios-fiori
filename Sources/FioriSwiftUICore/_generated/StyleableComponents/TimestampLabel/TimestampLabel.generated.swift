// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TimestampLabel {
    let timestampLabel: any View

    @Environment(\.timestampLabelStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder timestampLabel: () -> any View = { EmptyView() }) {
        self.timestampLabel = timestampLabel()
    }
}

public extension TimestampLabel {
    init(timestampLabel: AttributedString? = nil) {
        self.init(timestampLabel: { OptionalText(timestampLabel) })
    }
}

public extension TimestampLabel {
    init(_ configuration: TimestampLabelConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimestampLabelConfiguration, shouldApplyDefaultStyle: Bool) {
        self.timestampLabel = configuration.timestampLabel
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimestampLabel: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(timestampLabel: .init(self.timestampLabel))).typeErased
                .transformEnvironment(\.timestampLabelStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TimestampLabel {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TimestampLabel(timestampLabel: { self.timestampLabel })
            .shouldApplyDefaultStyle(false)
            .timestampLabelStyle(.fiori)
            .typeErased
    }
}
