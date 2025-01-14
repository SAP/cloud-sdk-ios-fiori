// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol TimestampStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimestampConfiguration) -> Body
}

struct AnyTimestampStyle: TimestampStyle {
    let content: (TimestampConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimestampConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimestampConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimestampConfiguration {
    public let timestampIdentifier = "FioriTimestamp_timestamp"

    public var componentIdentifier: String = "fiori_timestamp_component"
    public let timestamp: Timestamp

    public typealias Timestamp = ConfigurationViewWrapper
}

extension TimestampConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
