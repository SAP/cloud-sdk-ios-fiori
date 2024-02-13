// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol InformationViewContentStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: InformationViewContentConfiguration) -> Body
}
    
struct AnyInformationViewContentStyle: InformationViewContentStyle {
    let content: (InformationViewContentConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (InformationViewContentConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: InformationViewContentConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct InformationViewContentConfiguration {
    public let informationViewContent: InformationViewContent

    public typealias InformationViewContent = ConfigurationViewWrapper
}
