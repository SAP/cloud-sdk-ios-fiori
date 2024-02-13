// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol InformationViewIconStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: InformationViewIconConfiguration) -> Body
}
    
struct AnyInformationViewIconStyle: InformationViewIconStyle {
    let content: (InformationViewIconConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (InformationViewIconConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: InformationViewIconConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct InformationViewIconConfiguration {
    public let informationViewIcon: InformationViewIcon

    public typealias InformationViewIcon = ConfigurationViewWrapper
}
