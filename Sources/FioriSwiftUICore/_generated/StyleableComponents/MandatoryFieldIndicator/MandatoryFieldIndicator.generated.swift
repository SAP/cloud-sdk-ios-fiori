// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct MandatoryFieldIndicator {
    let mandatoryFieldIndicator: any View

    @Environment(\.mandatoryFieldIndicatorStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder mandatoryFieldIndicator: () -> any View = { Text("*") }) {
        self.mandatoryFieldIndicator = mandatoryFieldIndicator()
    }
}

public extension MandatoryFieldIndicator {
    init(mandatoryFieldIndicator: TextOrIcon? = .text("*")) {
        self.init(mandatoryFieldIndicator: { TextOrIconView(mandatoryFieldIndicator) })
    }
}

public extension MandatoryFieldIndicator {
    init(_ configuration: MandatoryFieldIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: MandatoryFieldIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.mandatoryFieldIndicator = configuration.mandatoryFieldIndicator
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension MandatoryFieldIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator))).typeErased
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
        MandatoryFieldIndicator(.init(mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator)))
            .shouldApplyDefaultStyle(false)
            .mandatoryFieldIndicatorStyle(.fiori)
            .typeErased
    }
}
