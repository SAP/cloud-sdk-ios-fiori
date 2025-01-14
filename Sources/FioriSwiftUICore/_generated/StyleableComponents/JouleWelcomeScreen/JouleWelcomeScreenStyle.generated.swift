// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol JouleWelcomeScreenStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> Body
}

struct AnyJouleWelcomeScreenStyle: JouleWelcomeScreenStyle {
    let content: (JouleWelcomeScreenConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (JouleWelcomeScreenConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct JouleWelcomeScreenConfiguration {
    public var componentIdentifier: String = "fiori_joulewelcomescreen_component"
    public let mediaImage: MediaImage
    public let greetingText: GreetingText
    public let title: Title
    public let footnote: Footnote
    public let messageContent: MessageContent

    public typealias MediaImage = ConfigurationViewWrapper
    public typealias GreetingText = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Footnote = ConfigurationViewWrapper
    public typealias MessageContent = ConfigurationViewWrapper
}

extension JouleWelcomeScreenConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct JouleWelcomeScreenFioriStyle: JouleWelcomeScreenStyle {
    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .mediaImageStyle(MediaImageFioriStyle(jouleWelcomeScreenConfiguration: configuration))
            .greetingTextStyle(GreetingTextFioriStyle(jouleWelcomeScreenConfiguration: configuration))
            .titleStyle(TitleFioriStyle(jouleWelcomeScreenConfiguration: configuration))
            .footnoteStyle(FootnoteFioriStyle(jouleWelcomeScreenConfiguration: configuration))
            .messageContentStyle(MessageContentFioriStyle(jouleWelcomeScreenConfiguration: configuration))
    }
}
