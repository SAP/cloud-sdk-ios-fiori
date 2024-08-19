// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol HeaderTitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: HeaderTitleConfiguration) -> Body
}

struct AnyHeaderTitleStyle: HeaderTitleStyle {
    let content: (HeaderTitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (HeaderTitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: HeaderTitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct HeaderTitleConfiguration {
    public let headerTitle: HeaderTitle

    public typealias HeaderTitle = ConfigurationViewWrapper
}
