// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ApplyActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ApplyActionConfiguration) -> Body
}

struct AnyApplyActionStyle: ApplyActionStyle {
    let content: (ApplyActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ApplyActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ApplyActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ApplyActionConfiguration {
    public let applyAction: ApplyAction

    public typealias ApplyAction = ConfigurationViewWrapper
}
