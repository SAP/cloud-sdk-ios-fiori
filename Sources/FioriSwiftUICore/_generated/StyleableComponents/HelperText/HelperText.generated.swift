// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct HelperText {
    let helperText: any View

    @Environment(\.helperTextStyle) var style

    var componentIdentifier: String = HelperText.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder helperText: () -> any View = { EmptyView() },
                componentIdentifier: String? = HelperText.identifier)
    {
        self.helperText = helperText()
        self.componentIdentifier = componentIdentifier ?? HelperText.identifier
    }
}

public extension HelperText {
    static let identifier = "fiori_helpertext_component"
}

public extension HelperText {
    init(helperText: AttributedString? = nil,
         componentIdentifier: String? = HelperText.identifier)
    {
        self.init(helperText: { OptionalText(helperText) }, componentIdentifier: componentIdentifier)
    }
}

public extension HelperText {
    init(_ configuration: HelperTextConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: HelperTextConfiguration, shouldApplyDefaultStyle: Bool) {
        self.helperText = configuration.helperText
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension HelperText: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, helperText: .init(self.helperText))).typeErased
                .transformEnvironment(\.helperTextStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension HelperText {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        HelperText(.init(componentIdentifier: self.componentIdentifier, helperText: .init(self.helperText)))
            .shouldApplyDefaultStyle(false)
            .helperTextStyle(.fiori)
            .typeErased
    }
}
