// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TopDividerStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TopDividerConfiguration) -> Body
}

struct AnyTopDividerStyle: TopDividerStyle {
    let content: (TopDividerConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TopDividerConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TopDividerConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TopDividerConfiguration {
    public let topDivider: TopDivider

    public typealias TopDivider = ConfigurationViewWrapper
}
