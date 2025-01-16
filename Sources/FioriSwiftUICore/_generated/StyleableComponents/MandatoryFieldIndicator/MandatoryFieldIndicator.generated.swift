// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct MandatoryFieldIndicator {
    let mandatoryFieldIndicator: any View

    @Environment(\.mandatoryFieldIndicatorStyle) var style

    var componentIdentifier: String = MandatoryFieldIndicator.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder mandatoryFieldIndicator: () -> any View = { Text("*") },
                componentIdentifier: String? = MandatoryFieldIndicator.identifier)
    {
        self.mandatoryFieldIndicator = mandatoryFieldIndicator()
        self.componentIdentifier = componentIdentifier ?? MandatoryFieldIndicator.identifier
    }
}

public extension MandatoryFieldIndicator {
    static let identifier = "fiori_mandatoryfieldindicator_component"
}

public extension MandatoryFieldIndicator {
    init(mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         componentIdentifier: String? = MandatoryFieldIndicator.identifier)
    {
        self.init(mandatoryFieldIndicator: { TextOrIconView(mandatoryFieldIndicator) }, componentIdentifier: componentIdentifier)
    }
}

public extension MandatoryFieldIndicator {
    init(_ configuration: MandatoryFieldIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: MandatoryFieldIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.mandatoryFieldIndicator = configuration.mandatoryFieldIndicator
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension MandatoryFieldIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator))).typeErased
                .transformEnvironment(\.mandatoryFieldIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension MandatoryFieldIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        MandatoryFieldIndicator(.init(componentIdentifier: self.componentIdentifier, mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator)))
            .shouldApplyDefaultStyle(false)
            .mandatoryFieldIndicatorStyle(.fiori)
            .typeErased
    }
}
