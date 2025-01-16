// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ValueLabel {
    let valueLabel: any View

    @Environment(\.valueLabelStyle) var style

    var componentIdentifier: String = ValueLabel.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder valueLabel: () -> any View = { EmptyView() },
                componentIdentifier: String? = ValueLabel.identifier)
    {
        self.valueLabel = valueLabel()
        self.componentIdentifier = componentIdentifier ?? ValueLabel.identifier
    }
}

public extension ValueLabel {
    static let identifier = "fiori_valuelabel_component"
}

public extension ValueLabel {
    init(valueLabel: AttributedString? = nil) {
        self.init(valueLabel: { OptionalText(valueLabel) })
    }
}

public extension ValueLabel {
    init(_ configuration: ValueLabelConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ValueLabelConfiguration, shouldApplyDefaultStyle: Bool) {
        self.valueLabel = configuration.valueLabel
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ValueLabel: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, valueLabel: .init(self.valueLabel))).typeErased
                .transformEnvironment(\.valueLabelStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ValueLabel {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ValueLabel(.init(componentIdentifier: self.componentIdentifier, valueLabel: .init(self.valueLabel)))
            .shouldApplyDefaultStyle(false)
            .valueLabelStyle(.fiori)
            .typeErased
    }
}
