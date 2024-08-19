// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SeeAllActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SeeAllActionConfiguration) -> Body
}

struct AnySeeAllActionStyle: SeeAllActionStyle {
    let content: (SeeAllActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SeeAllActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SeeAllActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SeeAllActionConfiguration {
    public let seeAllAction: SeeAllAction

    public typealias SeeAllAction = ConfigurationViewWrapper
}
