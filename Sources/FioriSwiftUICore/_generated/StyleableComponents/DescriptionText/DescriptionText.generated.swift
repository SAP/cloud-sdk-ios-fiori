// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DescriptionText {
    let descriptionText: any View

    @Environment(\.descriptionTextStyle) var style

    var componentIdentifier: String = DescriptionText.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder descriptionText: () -> any View = { EmptyView() },
                componentIdentifier: String? = DescriptionText.identifier)
    {
        self.descriptionText = descriptionText()
        self.componentIdentifier = componentIdentifier ?? DescriptionText.identifier
    }
}

public extension DescriptionText {
    static let identifier = "fiori_descriptiontext_component"
}

public extension DescriptionText {
    init(descriptionText: AttributedString? = nil,
         componentIdentifier: String? = DescriptionText.identifier)
    {
        self.init(descriptionText: { OptionalText(descriptionText) }, componentIdentifier: componentIdentifier)
    }
}

public extension DescriptionText {
    init(_ configuration: DescriptionTextConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DescriptionTextConfiguration, shouldApplyDefaultStyle: Bool) {
        self.descriptionText = configuration.descriptionText
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DescriptionText: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, descriptionText: .init(self.descriptionText))).typeErased
                .transformEnvironment(\.descriptionTextStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DescriptionText {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DescriptionText(.init(componentIdentifier: self.componentIdentifier, descriptionText: .init(self.descriptionText)))
            .shouldApplyDefaultStyle(false)
            .descriptionTextStyle(.fiori)
            .typeErased
    }
}
