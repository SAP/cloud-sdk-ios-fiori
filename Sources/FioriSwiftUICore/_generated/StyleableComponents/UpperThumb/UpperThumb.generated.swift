// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct UpperThumb {
    let upperThumb: any View

    @Environment(\.upperThumbStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder upperThumb: () -> any View) {
        self.upperThumb = upperThumb()
    }
}

public extension UpperThumb {
    init(upperThumb: any Shape = Circle()) {
        self.init(upperThumb: { upperThumb })
    }
}

public extension UpperThumb {
    init(_ configuration: UpperThumbConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: UpperThumbConfiguration, shouldApplyDefaultStyle: Bool) {
        self.upperThumb = configuration.upperThumb
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension UpperThumb: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(upperThumb: .init(self.upperThumb))).typeErased
                .transformEnvironment(\.upperThumbStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension UpperThumb {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        UpperThumb(.init(upperThumb: .init(self.upperThumb)))
            .shouldApplyDefaultStyle(false)
            .upperThumbStyle(.fiori)
            .typeErased
    }
}
