// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `TextWithMandatoryFieldIndicator` provides a text and an optional mandatory field. The mandatory field will follow the text's last character.
/// ## Usage
/// ```swift
/// TextWithMandatoryFieldIndicator(text: "Normal text, Customized Mandatory", isRequired: true, mandatoryFieldIndicator: .text("#"))
///    .textWithMandatoryFieldIndicatorStyle { conf in
///        TextWithMandatoryFieldIndicator(conf)
///            .foregroundStyle(self.isEnabled ? Color.blue : Color.preferredColor(.quaternaryLabel))
///    }
/// ```
public struct TextWithMandatoryFieldIndicator {
    let text: AttributedString
    let isRequired: Bool
    let mandatoryFieldIndicator: TextOrIcon?

    @Environment(\.textWithMandatoryFieldIndicatorStyle) var style

    var componentIdentifier: String = TextWithMandatoryFieldIndicator.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(text: AttributedString,
                isRequired: Bool = false,
                mandatoryFieldIndicator: TextOrIcon? = .text("*"),
                componentIdentifier: String? = TextWithMandatoryFieldIndicator.identifier)
    {
        self.text = text
        self.isRequired = isRequired
        self.mandatoryFieldIndicator = mandatoryFieldIndicator
        self.componentIdentifier = componentIdentifier ?? TextWithMandatoryFieldIndicator.identifier
    }
}

public extension TextWithMandatoryFieldIndicator {
    static let identifier = "fiori_textwithmandatoryfieldindicator_component"
}

public extension TextWithMandatoryFieldIndicator {
    init(_ configuration: TextWithMandatoryFieldIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TextWithMandatoryFieldIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.text = configuration.text
        self.isRequired = configuration.isRequired
        self.mandatoryFieldIndicator = configuration.mandatoryFieldIndicator
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TextWithMandatoryFieldIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, text: self.text, isRequired: self.isRequired, mandatoryFieldIndicator: self.mandatoryFieldIndicator)).typeErased
                .transformEnvironment(\.textWithMandatoryFieldIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TextWithMandatoryFieldIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TextWithMandatoryFieldIndicator(.init(componentIdentifier: self.componentIdentifier, text: self.text, isRequired: self.isRequired, mandatoryFieldIndicator: self.mandatoryFieldIndicator))
            .shouldApplyDefaultStyle(false)
            .textWithMandatoryFieldIndicatorStyle(TextWithMandatoryFieldIndicatorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
