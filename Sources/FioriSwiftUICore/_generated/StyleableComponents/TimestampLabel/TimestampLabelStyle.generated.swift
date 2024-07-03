// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TimestampLabelStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimestampLabelConfiguration) -> Body
}

struct AnyTimestampLabelStyle: TimestampLabelStyle {
    let content: (TimestampLabelConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimestampLabelConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimestampLabelConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimestampLabelConfiguration {
    public let timestampLabel: TimestampLabel

    public typealias TimestampLabel = ConfigurationViewWrapper
}
