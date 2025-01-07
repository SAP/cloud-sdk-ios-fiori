// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol OuterCircleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: OuterCircleConfiguration) -> Body
}

struct AnyOuterCircleStyle: OuterCircleStyle {
    let content: (OuterCircleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (OuterCircleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: OuterCircleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct OuterCircleConfiguration {
    public let outerCircle: OuterCircle

    public typealias OuterCircle = ConfigurationViewWrapper
}
