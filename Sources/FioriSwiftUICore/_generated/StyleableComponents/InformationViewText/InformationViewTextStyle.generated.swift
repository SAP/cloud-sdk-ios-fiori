// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol InformationViewTextStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: InformationViewTextConfiguration) -> Body
}
    
struct AnyInformationViewTextStyle: InformationViewTextStyle {
    let content: (InformationViewTextConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (InformationViewTextConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: InformationViewTextConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct InformationViewTextConfiguration {
    public let informationViewText: InformationViewText

    public typealias InformationViewText = ConfigurationViewWrapper
}
