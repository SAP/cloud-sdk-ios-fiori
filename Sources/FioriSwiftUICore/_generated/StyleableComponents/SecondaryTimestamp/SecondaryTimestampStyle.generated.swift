// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SecondaryTimestampStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SecondaryTimestampConfiguration) -> Body
}

struct AnySecondaryTimestampStyle: SecondaryTimestampStyle {
    let content: (SecondaryTimestampConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SecondaryTimestampConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SecondaryTimestampConfiguration {
    public let secondaryTimestampIdentifier = "FioriSecondaryTimestamp_secondaryTimestamp"

    public let secondaryTimestamp: SecondaryTimestamp

    public typealias SecondaryTimestamp = ConfigurationViewWrapper
}
