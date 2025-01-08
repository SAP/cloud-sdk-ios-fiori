// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol InnerCircleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: InnerCircleConfiguration) -> Body
}

struct AnyInnerCircleStyle: InnerCircleStyle {
    let content: (InnerCircleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (InnerCircleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: InnerCircleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct InnerCircleConfiguration {
    public let innerCircle: InnerCircle

    public typealias InnerCircle = ConfigurationViewWrapper
}
