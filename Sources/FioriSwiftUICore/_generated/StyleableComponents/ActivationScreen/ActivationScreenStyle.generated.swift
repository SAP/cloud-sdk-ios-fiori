// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ActivationScreenStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ActivationScreenConfiguration) -> Body
}

struct AnyActivationScreenStyle: ActivationScreenStyle {
    let content: (ActivationScreenConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ActivationScreenConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ActivationScreenConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ActivationScreenConfiguration {
    public var componentIdentifier: String = "fiori_activationscreen_component"
    public let title: Title
    public let descriptionText: DescriptionText
    public let footnote: Footnote
    public let action: Action
    public let secondaryAction: SecondaryAction
    public let illustratedMessage: IllustratedMessage
    @Binding public var inputText: String
    public let showsIllustratedMessage: Bool

    public typealias Title = ConfigurationViewWrapper
    public typealias DescriptionText = ConfigurationViewWrapper
    public typealias Footnote = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
    public typealias SecondaryAction = ConfigurationViewWrapper
    public typealias IllustratedMessage = ConfigurationViewWrapper
}

extension ActivationScreenConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ActivationScreenFioriStyle: ActivationScreenStyle {
    public func makeBody(_ configuration: ActivationScreenConfiguration) -> some View {
        ActivationScreen(configuration)
            .titleStyle(TitleFioriStyle(activationScreenConfiguration: configuration))
            .descriptionTextStyle(DescriptionTextFioriStyle(activationScreenConfiguration: configuration))
            .footnoteStyle(FootnoteFioriStyle(activationScreenConfiguration: configuration))
            .actionStyle(ActionFioriStyle(activationScreenConfiguration: configuration))
            .secondaryActionStyle(SecondaryActionFioriStyle(activationScreenConfiguration: configuration))
    }
}
