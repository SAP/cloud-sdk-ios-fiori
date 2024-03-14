// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DetailImageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DetailImageConfiguration) -> Body
}
    
struct AnyDetailImageStyle: DetailImageStyle {
    let content: (DetailImageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DetailImageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DetailImageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct DetailImageConfiguration {
    public let detailImage: DetailImage

    public typealias DetailImage = ConfigurationViewWrapper
}
