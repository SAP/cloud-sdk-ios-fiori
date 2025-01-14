// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriJouleWelcomeScreen_content"
    public let mediaImageIdentifier = "FioriJouleWelcomeScreen_mediaImage"
    public let greetingTextIdentifier = "FioriJouleWelcomeScreen_greetingText"
    public let titleIdentifier = "FioriJouleWelcomeScreen_title"
    public let footnoteIdentifier = "FioriJouleWelcomeScreen_footnote"
    public let messageContentIdentifier = "FioriJouleWelcomeScreen_messageContent"

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

public struct JouleWelcomeScreenNSSStyle: JouleWelcomeScreenStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .mediaImageStyle(MediaImageNSSStyle(jouleWelcomeScreenConfiguration: configuration, nssData: self.data.value(configuration.mediaImageIdentifier)))
            .greetingTextStyle(GreetingTextNSSStyle(jouleWelcomeScreenConfiguration: configuration, nssData: self.data.value(configuration.greetingTextIdentifier)))
            .titleStyle(TitleNSSStyle(jouleWelcomeScreenConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .footnoteStyle(FootnoteNSSStyle(jouleWelcomeScreenConfiguration: configuration, nssData: self.data.value(configuration.footnoteIdentifier)))
            .messageContentStyle(MessageContentNSSStyle(jouleWelcomeScreenConfiguration: configuration, nssData: self.data.value(configuration.messageContentIdentifier)))
            .jouleWelcomeScreenStyle(ContentNSSStyle(jouleWelcomeScreenConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
