// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// The Activation Screen is displayed after the Welcome Screen with title, description text, email input text field, action button and secondary action.
public struct ActivationScreen {
    let title: any View
    let descriptionText: any View
    let footnote: any View
    let action: any View
    let secondaryAction: any View
    let illustratedMessage: any View
    @Binding var inputText: String
    /// A boolean flag, `showsIllustratedMessage`, determines whether the illustration message is displayed.
    /// When `showsIllustratedMessage` is set to `true`, the `illustratedMessage` will be shown, and the `title` and `description` will be hidden. Conversely, when `showsIllustratedMessage` is set to `false`, the `title` and `description` will be displayed, and the `illustratedMessage` will be hidden.
    /// The default setting for `showsIllustratedMessage` is `false`.
    let showsIllustratedMessage: Bool

    @Environment(\.activationScreenStyle) var style

    var componentIdentifier: String = ActivationScreen.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder descriptionText: () -> any View = { EmptyView() },
                @ViewBuilder footnote: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder secondaryAction: () -> any View = { EmptyView() },
                @ViewBuilder illustratedMessage: () -> any View = { EmptyView() },
                inputText: Binding<String> = .constant(""),
                showsIllustratedMessage: Bool = false,
                componentIdentifier: String? = ActivationScreen.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.descriptionText = DescriptionText(descriptionText: descriptionText, componentIdentifier: componentIdentifier)
        self.footnote = Footnote(footnote: footnote, componentIdentifier: componentIdentifier)
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self.secondaryAction = SecondaryAction(secondaryAction: secondaryAction, componentIdentifier: componentIdentifier)
        self.illustratedMessage = illustratedMessage()
        self._inputText = inputText
        self.showsIllustratedMessage = showsIllustratedMessage
        self.componentIdentifier = componentIdentifier ?? ActivationScreen.identifier
    }
}

public extension ActivationScreen {
    static let identifier = "fiori_activationscreen_component"
}

public extension ActivationScreen {
    init(title: AttributedString,
         descriptionText: AttributedString? = nil,
         footnote: AttributedString? = nil,
         action: FioriButton? = nil,
         secondaryAction: FioriButton? = nil,
         illustratedMessage: IllustratedMessage? = nil,
         inputText: Binding<String>,
         showsIllustratedMessage: Bool = false)
    {
        self.init(title: { Text(title) }, descriptionText: { OptionalText(descriptionText) }, footnote: { OptionalText(footnote) }, action: { action }, secondaryAction: { secondaryAction }, illustratedMessage: { illustratedMessage }, inputText: inputText, showsIllustratedMessage: showsIllustratedMessage)
    }
}

public extension ActivationScreen {
    init(_ configuration: ActivationScreenConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ActivationScreenConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.descriptionText = configuration.descriptionText
        self.footnote = configuration.footnote
        self.action = configuration.action
        self.secondaryAction = configuration.secondaryAction
        self.illustratedMessage = configuration.illustratedMessage
        self._inputText = configuration.$inputText
        self.showsIllustratedMessage = configuration.showsIllustratedMessage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ActivationScreen: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), descriptionText: .init(self.descriptionText), footnote: .init(self.footnote), action: .init(self.action), secondaryAction: .init(self.secondaryAction), illustratedMessage: .init(self.illustratedMessage), inputText: self.$inputText, showsIllustratedMessage: self.showsIllustratedMessage)).typeErased
                .transformEnvironment(\.activationScreenStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ActivationScreen {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ActivationScreen(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), descriptionText: .init(self.descriptionText), footnote: .init(self.footnote), action: .init(self.action), secondaryAction: .init(self.secondaryAction), illustratedMessage: .init(self.illustratedMessage), inputText: self.$inputText, showsIllustratedMessage: self.showsIllustratedMessage))
            .shouldApplyDefaultStyle(false)
            .activationScreenStyle(ActivationScreenFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
