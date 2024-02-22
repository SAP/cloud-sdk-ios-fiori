// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ActionConfiguration) -> Body
}
    
struct AnyActionStyle: ActionStyle {
    let content: (ActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct ActionConfiguration {
    public let action: Action

    public typealias Action = ConfigurationViewWrapper
}
