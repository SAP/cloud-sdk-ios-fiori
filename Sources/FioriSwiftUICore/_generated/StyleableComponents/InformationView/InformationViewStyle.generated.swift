// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
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
    public let icon: Icon
    public let description: Description

    public typealias Icon = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
}

public struct InformationViewFioriStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(IconFioriStyle())
            .descriptionStyle(DescriptionFioriStyle())
    }
}
