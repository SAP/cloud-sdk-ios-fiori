// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Timestamp {
    let timestamp: any View

    @Environment(\.timestampStyle) var style

    var componentIdentifier: String = Timestamp.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder timestamp: () -> any View = { EmptyView() },
                componentIdentifier: String? = Timestamp.identifier)
    {
        self.timestamp = timestamp()
        self.componentIdentifier = componentIdentifier ?? Timestamp.identifier
    }
}

public extension Timestamp {
    static let identifier = "fiori_timestamp_component"
}

public extension Timestamp {
    init(timestamp: AttributedString? = nil,
         componentIdentifier: String? = Timestamp.identifier)
    {
        self.init(timestamp: { OptionalText(timestamp) }, componentIdentifier: componentIdentifier)
    }
}

public extension Timestamp {
    init(_ configuration: TimestampConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimestampConfiguration, shouldApplyDefaultStyle: Bool) {
        self.timestamp = configuration.timestamp
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Timestamp: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, timestamp: .init(self.timestamp))).typeErased
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
        Timestamp(.init(componentIdentifier: self.componentIdentifier, timestamp: .init(self.timestamp)))
            .shouldApplyDefaultStyle(false)
            .timestampStyle(.fiori)
            .typeErased
    }
}
