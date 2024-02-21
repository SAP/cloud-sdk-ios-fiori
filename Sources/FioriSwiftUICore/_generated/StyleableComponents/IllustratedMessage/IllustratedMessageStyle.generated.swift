// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol IllustratedMessageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: IllustratedMessageConfiguration) -> Body
}
    
struct AnyIllustratedMessageStyle: IllustratedMessageStyle {
    let content: (IllustratedMessageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (IllustratedMessageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct IllustratedMessageConfiguration {
    public let detailImage: DetailImage
    public let title: Title
    public let description: Description
    public let action: Action

    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
}
    
public struct IllustratedMessageFioriStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .detailImageStyle(DetailImageFioriStyle())
            .titleStyle(TitleFioriStyle())
            .descriptionStyle(DescriptionFioriStyle())
            .actionStyle(ActionFioriStyle())
    }
}
