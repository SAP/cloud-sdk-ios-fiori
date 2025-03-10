// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol WelcomeScreenStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: WelcomeScreenConfiguration) -> Body
}

struct AnyWelcomeScreenStyle: WelcomeScreenStyle {
    let content: (WelcomeScreenConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (WelcomeScreenConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: WelcomeScreenConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct WelcomeScreenConfiguration {
    public var componentIdentifier: String = "fiori_welcomescreen_component"
    public let title: Title
    public let description: Description
    public let icon: Icon
    public let footnote: Footnote
    public let action: Action
    public let secondaryAction: SecondaryAction
    public let illustratedMessage: IllustratedMessage
    public let headlineImage: HeadlineImage
    @Binding public var inputText: String
    public let legalText: LegalText
    public let isLegalAgreementRequired: Bool
    public let showsIllustratedMessage: Bool
    public let state: WelcomeScreenState
    public let options: Set<WelcomeScreenOption>
    public let isDemoAvailable: Bool
    public let footerText: FooterText

    public typealias Title = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Icon = ConfigurationViewWrapper
    public typealias Footnote = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
    public typealias SecondaryAction = ConfigurationViewWrapper
    public typealias IllustratedMessage = ConfigurationViewWrapper
    public typealias HeadlineImage = ConfigurationViewWrapper
    public typealias LegalText = ConfigurationViewWrapper
    public typealias FooterText = ConfigurationViewWrapper
}

extension WelcomeScreenConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct WelcomeScreenFioriStyle: WelcomeScreenStyle {
    public func makeBody(_ configuration: WelcomeScreenConfiguration) -> some View {
        WelcomeScreen(configuration)
            .titleStyle(TitleFioriStyle(welcomeScreenConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(welcomeScreenConfiguration: configuration))
            .iconStyle(IconFioriStyle(welcomeScreenConfiguration: configuration))
            .footnoteStyle(FootnoteFioriStyle(welcomeScreenConfiguration: configuration))
            .actionStyle(ActionFioriStyle(welcomeScreenConfiguration: configuration))
            .secondaryActionStyle(SecondaryActionFioriStyle(welcomeScreenConfiguration: configuration))
    }
}
