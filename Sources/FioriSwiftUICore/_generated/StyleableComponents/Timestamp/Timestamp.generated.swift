// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Timestamp {
    let timestamp: any View

    @Environment(\.timestampStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder timestamp: () -> any View = { EmptyView() }) {
        self.timestamp = timestamp()
    }
}

public extension Timestamp {
    init(timestamp: AttributedString? = nil) {
        self.init(timestamp: { OptionalText(timestamp) })
    }
}

public extension Timestamp {
    init(_ configuration: TimestampConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimestampConfiguration, shouldApplyDefaultStyle: Bool) {
        self.timestamp = configuration.timestamp
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Timestamp: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(timestamp: .init(self.timestamp))).typeErased
                .transformEnvironment(\.timestampStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Timestamp {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Timestamp(timestamp: { self.timestamp })
            .shouldApplyDefaultStyle(false)
            .timestampStyle(.fiori)
            .typeErased
    }
}
