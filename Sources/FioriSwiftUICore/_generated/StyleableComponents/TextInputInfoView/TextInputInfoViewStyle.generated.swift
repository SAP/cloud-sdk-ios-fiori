// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TextInputInfoViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TextInputInfoViewConfiguration) -> Body
}
    
struct AnyTextInputInfoViewStyle: TextInputInfoViewStyle {
    let content: (TextInputInfoViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TextInputInfoViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct TextInputInfoViewConfiguration {
    public let icon: Icon
    public let description: Description
    public let content: Content
    public let counter: Counter

    public typealias Icon = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Content = ConfigurationViewWrapper
    public typealias Counter = ConfigurationViewWrapper
}
    
public struct TextInputInfoViewFioriStyle: TextInputInfoViewStyle {
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .iconStyle(IconFioriStyle())
            .descriptionStyle(DescriptionFioriStyle())
            .counterStyle(CounterFioriStyle())
            .informationViewStyle(InformationViewFioriStyle())
    }
}
