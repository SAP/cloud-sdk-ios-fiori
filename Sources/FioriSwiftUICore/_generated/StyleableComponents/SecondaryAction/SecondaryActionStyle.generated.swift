// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SecondaryActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SecondaryActionConfiguration) -> Body
}
    
struct AnySecondaryActionStyle: SecondaryActionStyle {
    let content: (SecondaryActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SecondaryActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct SecondaryActionConfiguration {
    public let secondaryAction: SecondaryAction

    public typealias SecondaryAction = ConfigurationViewWrapper
}
