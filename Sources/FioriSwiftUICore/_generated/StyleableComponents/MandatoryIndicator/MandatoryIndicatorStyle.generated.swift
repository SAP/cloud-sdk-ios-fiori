// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol MandatoryIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: MandatoryIndicatorConfiguration) -> Body
}

struct AnyMandatoryIndicatorStyle: MandatoryIndicatorStyle {
    let content: (MandatoryIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (MandatoryIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: MandatoryIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct MandatoryIndicatorConfiguration {
    public let mandatoryIndicator: MandatoryIndicator

    public typealias MandatoryIndicator = ConfigurationViewWrapper
}
