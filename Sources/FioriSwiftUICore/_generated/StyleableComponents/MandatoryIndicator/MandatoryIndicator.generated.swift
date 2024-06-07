// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct MandatoryIndicator {
    let mandatoryIndicator: any View

    @Environment(\.mandatoryIndicatorStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder mandatoryIndicator: () -> any View = { EmptyView() }) {
        self.mandatoryIndicator = mandatoryIndicator()
    }
}

public extension MandatoryIndicator {
    init(mandatoryIndicator: AttributedString? = AttributedString("*")) {
        self.init(mandatoryIndicator: { OptionalText(mandatoryIndicator) })
    }
}

public extension MandatoryIndicator {
    init(_ configuration: MandatoryIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: MandatoryIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.mandatoryIndicator = configuration.mandatoryIndicator
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension MandatoryIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(mandatoryIndicator: .init(self.mandatoryIndicator))).typeErased
                .transformEnvironment(\.mandatoryIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension MandatoryIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        MandatoryIndicator(mandatoryIndicator: { self.mandatoryIndicator })
            .shouldApplyDefaultStyle(false)
            .mandatoryIndicatorStyle(.fiori)
            .typeErased
    }
}
