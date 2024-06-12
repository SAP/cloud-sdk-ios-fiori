// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol FilledIconStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: FilledIconConfiguration) -> Body
}

struct AnyFilledIconStyle: FilledIconStyle {
    let content: (FilledIconConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FilledIconConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FilledIconConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FilledIconConfiguration {
    public let filledIcon: FilledIcon

    public typealias FilledIcon = ConfigurationViewWrapper
}
