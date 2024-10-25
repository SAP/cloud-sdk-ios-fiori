// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DeselectAllActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DeselectAllActionConfiguration) -> Body
}

struct AnyDeselectAllActionStyle: DeselectAllActionStyle {
    let content: (DeselectAllActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DeselectAllActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DeselectAllActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DeselectAllActionConfiguration {
    public let deselectAllAction: DeselectAllAction

    public typealias DeselectAllAction = ConfigurationViewWrapper
}
