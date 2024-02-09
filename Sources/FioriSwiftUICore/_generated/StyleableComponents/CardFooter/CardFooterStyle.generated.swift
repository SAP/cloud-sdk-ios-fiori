// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CardFooterStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CardFooterConfiguration) -> Body
}
    
struct AnyCardFooterStyle: CardFooterStyle {
    let content: (CardFooterConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CardFooterConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct CardFooterConfiguration {
    public let newAction: NewAction
    public let secondaryAction: SecondaryAction

    public typealias NewAction = ConfigurationViewWrapper
    public typealias SecondaryAction = ConfigurationViewWrapper
}
    
public struct CardFooterFioriStyle: CardFooterStyle {
    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .newActionStyle(NewActionFioriStyle())
            .secondaryActionStyle(SecondaryActionFioriStyle())
    }
}
