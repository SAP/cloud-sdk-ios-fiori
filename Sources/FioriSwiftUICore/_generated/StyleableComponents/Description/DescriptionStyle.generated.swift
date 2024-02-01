// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DescriptionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DescriptionConfiguration) -> Body
}
    
struct AnyDescriptionStyle: DescriptionStyle {
    let content: (DescriptionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DescriptionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct DescriptionConfiguration {
    public let description: Description

    public typealias Description = ConfigurationViewWrapper
}
