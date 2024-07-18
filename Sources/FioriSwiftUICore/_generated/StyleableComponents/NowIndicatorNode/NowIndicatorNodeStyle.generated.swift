// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol NowIndicatorNodeStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: NowIndicatorNodeConfiguration) -> Body
}

struct AnyNowIndicatorNodeStyle: NowIndicatorNodeStyle {
    let content: (NowIndicatorNodeConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (NowIndicatorNodeConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: NowIndicatorNodeConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct NowIndicatorNodeConfiguration {
    public let nowIndicatorNode: NowIndicatorNode

    public typealias NowIndicatorNode = ConfigurationViewWrapper
}
