// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct BodyText {
    let bodyText: any View

    @Environment(\.bodyTextStyle) var style

    var componentIdentifier: String = BodyText.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder bodyText: () -> any View = { EmptyView() },
                componentIdentifier: String? = BodyText.identifier)
    {
        self.bodyText = bodyText()
        self.componentIdentifier = componentIdentifier ?? BodyText.identifier
    }
}

public extension BodyText {
    static let identifier = "fiori_bodytext_component"
}

public extension BodyText {
    init(bodyText: AttributedString? = nil) {
        self.init(bodyText: { OptionalText(bodyText) })
    }
}

public extension BodyText {
    init(_ configuration: BodyTextConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: BodyTextConfiguration, shouldApplyDefaultStyle: Bool) {
        self.bodyText = configuration.bodyText
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension BodyText: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, bodyText: .init(self.bodyText))).typeErased
                .transformEnvironment(\.bodyTextStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension BodyText {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        BodyText(.init(componentIdentifier: self.componentIdentifier, bodyText: .init(self.bodyText)))
            .shouldApplyDefaultStyle(false)
            .bodyTextStyle(.fiori)
            .typeErased
    }
}
