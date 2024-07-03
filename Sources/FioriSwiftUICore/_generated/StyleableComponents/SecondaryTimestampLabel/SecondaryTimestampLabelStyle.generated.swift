// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SecondaryTimestampLabelStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SecondaryTimestampLabelConfiguration) -> Body
}

struct AnySecondaryTimestampLabelStyle: SecondaryTimestampLabelStyle {
    let content: (SecondaryTimestampLabelConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SecondaryTimestampLabelConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SecondaryTimestampLabelConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SecondaryTimestampLabelConfiguration {
    public let secondaryTimestampLabel: SecondaryTimestampLabel

    public typealias SecondaryTimestampLabel = ConfigurationViewWrapper
}
