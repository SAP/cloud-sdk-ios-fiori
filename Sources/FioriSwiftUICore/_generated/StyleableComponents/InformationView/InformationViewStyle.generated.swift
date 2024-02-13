// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol InformationViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: InformationViewConfiguration) -> Body
}
    
struct AnyInformationViewStyle: InformationViewStyle {
    let content: (InformationViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (InformationViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct InformationViewConfiguration {
    public let informationViewContent: InformationViewContent
    public let informationViewIcon: InformationViewIcon
    public let informationViewText: InformationViewText

    public typealias InformationViewContent = ConfigurationViewWrapper
    public typealias InformationViewIcon = ConfigurationViewWrapper
    public typealias InformationViewText = ConfigurationViewWrapper
}
    
public struct InformationViewFioriStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .informationViewContentStyle(InformationViewContentFioriStyle())
            .informationViewIconStyle(InformationViewIconFioriStyle())
            .informationViewTextStyle(InformationViewTextFioriStyle())
    }
}
