// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SecondaryTimestampImageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SecondaryTimestampImageConfiguration) -> Body
}

struct AnySecondaryTimestampImageStyle: SecondaryTimestampImageStyle {
    let content: (SecondaryTimestampImageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SecondaryTimestampImageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SecondaryTimestampImageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SecondaryTimestampImageConfiguration {
    public let secondaryTimestampImage: SecondaryTimestampImage

    public typealias SecondaryTimestampImage = ConfigurationViewWrapper
}
