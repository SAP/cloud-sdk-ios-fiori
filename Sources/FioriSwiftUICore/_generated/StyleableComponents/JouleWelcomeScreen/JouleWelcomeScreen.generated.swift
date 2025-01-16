// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct JouleWelcomeScreen {
    let mediaImage: any View
    let greetingText: any View
    let title: any View
    let footnote: any View
    let messageContent: any View

    @Environment(\.jouleWelcomeScreenStyle) var style

    var componentIdentifier: String = JouleWelcomeScreen.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder mediaImage: () -> any View = { EmptyView() },
                @ViewBuilder greetingText: () -> any View,
                @ViewBuilder title: () -> any View,
                @ViewBuilder footnote: () -> any View = { EmptyView() },
                @ViewBuilder messageContent: () -> any View = { EmptyView() },
                componentIdentifier: String? = JouleWelcomeScreen.identifier)
    {
        self.mediaImage = MediaImage(mediaImage: mediaImage, componentIdentifier: componentIdentifier)
        self.greetingText = GreetingText(greetingText: greetingText, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.footnote = Footnote(footnote: footnote, componentIdentifier: componentIdentifier)
        self.messageContent = MessageContent(messageContent: messageContent, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? JouleWelcomeScreen.identifier
    }
}

public extension JouleWelcomeScreen {
    static let identifier = "fiori_joulewelcomescreen_component"
}

public extension JouleWelcomeScreen {
    init(mediaImage: Image? = nil,
         greetingText: AttributedString,
         title: AttributedString,
         footnote: AttributedString? = nil,
         @ViewBuilder messageContent: () -> any View = { EmptyView() },
         componentIdentifier: String? = JouleWelcomeScreen.identifier)
    {
        self.init(mediaImage: { OptionalImage(mediaImage) }, greetingText: { Text(greetingText) }, title: { Text(title) }, footnote: { OptionalText(footnote) }, messageContent: messageContent, componentIdentifier: componentIdentifier)
    }
}

public extension JouleWelcomeScreen {
    init(_ configuration: JouleWelcomeScreenConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: JouleWelcomeScreenConfiguration, shouldApplyDefaultStyle: Bool) {
        self.mediaImage = configuration.mediaImage
        self.greetingText = configuration.greetingText
        self.title = configuration.title
        self.footnote = configuration.footnote
        self.messageContent = configuration.messageContent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension JouleWelcomeScreen: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, mediaImage: .init(self.mediaImage), greetingText: .init(self.greetingText), title: .init(self.title), footnote: .init(self.footnote), messageContent: .init(self.messageContent))).typeErased
                .transformEnvironment(\.jouleWelcomeScreenStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension JouleWelcomeScreen {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        JouleWelcomeScreen(.init(componentIdentifier: self.componentIdentifier, mediaImage: .init(self.mediaImage), greetingText: .init(self.greetingText), title: .init(self.title), footnote: .init(self.footnote), messageContent: .init(self.messageContent)))
            .shouldApplyDefaultStyle(false)
            .jouleWelcomeScreenStyle(JouleWelcomeScreenFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
