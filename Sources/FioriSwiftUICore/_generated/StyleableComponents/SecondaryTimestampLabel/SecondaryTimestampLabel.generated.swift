// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SecondaryTimestampLabel {
    let secondaryTimestampLabel: any View

    @Environment(\.secondaryTimestampLabelStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder secondaryTimestampLabel: () -> any View = { EmptyView() }) {
        self.secondaryTimestampLabel = secondaryTimestampLabel()
    }
}

public extension SecondaryTimestampLabel {
    init(secondaryTimestampLabel: AttributedString? = nil) {
        self.init(secondaryTimestampLabel: { OptionalText(secondaryTimestampLabel) })
    }
}

public extension SecondaryTimestampLabel {
    init(_ configuration: SecondaryTimestampLabelConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SecondaryTimestampLabelConfiguration, shouldApplyDefaultStyle: Bool) {
        self.secondaryTimestampLabel = configuration.secondaryTimestampLabel
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension SecondaryTimestampLabel: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(secondaryTimestampLabel: .init(self.secondaryTimestampLabel))).typeErased
                .transformEnvironment(\.secondaryTimestampLabelStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SecondaryTimestampLabel {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SecondaryTimestampLabel(secondaryTimestampLabel: { self.secondaryTimestampLabel })
            .shouldApplyDefaultStyle(false)
            .secondaryTimestampLabelStyle(.fiori)
            .typeErased
    }
}
