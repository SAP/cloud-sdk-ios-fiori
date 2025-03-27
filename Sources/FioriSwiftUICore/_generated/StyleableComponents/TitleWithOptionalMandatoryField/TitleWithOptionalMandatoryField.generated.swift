// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `TitleWithOptionalMandatoryField` provides a title and an optional mandatory field. The mandatory field will follow the title's last character.
/// ## Usage
/// ```swift
/// TitleWithOptionalMandatoryField(title: "Normal title, Customized Mandatory", isRequired: true, mandatoryField: .text("#"))
///    .titleWithOptionalMandatoryFieldStyle { conf in
///        TitleWithOptionalMandatoryField(conf)
///            .foregroundStyle(self.isEnabled ? Color.blue : Color.preferredColor(.quaternaryLabel))
///    }
/// ```
public struct TitleWithOptionalMandatoryField {
    let title: AttributedString
    let isRequired: Bool
    let mandatoryField: TextOrIcon?

    @Environment(\.titleWithOptionalMandatoryFieldStyle) var style

    var componentIdentifier: String = TitleWithOptionalMandatoryField.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(title: AttributedString,
                isRequired: Bool = false,
                mandatoryField: TextOrIcon? = .text("*"),
                componentIdentifier: String? = TitleWithOptionalMandatoryField.identifier)
    {
        self.title = title
        self.isRequired = isRequired
        self.mandatoryField = mandatoryField
        self.componentIdentifier = componentIdentifier ?? TitleWithOptionalMandatoryField.identifier
    }
}

public extension TitleWithOptionalMandatoryField {
    static let identifier = "fiori_titlewithoptionalmandatoryfield_component"
}

public extension TitleWithOptionalMandatoryField {
    init(_ configuration: TitleWithOptionalMandatoryFieldConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TitleWithOptionalMandatoryFieldConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.isRequired = configuration.isRequired
        self.mandatoryField = configuration.mandatoryField
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TitleWithOptionalMandatoryField: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: self.title, isRequired: self.isRequired, mandatoryField: self.mandatoryField)).typeErased
                .transformEnvironment(\.titleWithOptionalMandatoryFieldStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TitleWithOptionalMandatoryField {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TitleWithOptionalMandatoryField(.init(componentIdentifier: self.componentIdentifier, title: self.title, isRequired: self.isRequired, mandatoryField: self.mandatoryField))
            .shouldApplyDefaultStyle(false)
            .titleWithOptionalMandatoryFieldStyle(TitleWithOptionalMandatoryFieldFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
