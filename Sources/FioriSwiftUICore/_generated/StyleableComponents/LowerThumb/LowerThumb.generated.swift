// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LowerThumb {
    let lowerThumb: any View

    @Environment(\.lowerThumbStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder lowerThumb: () -> any View) {
        self.lowerThumb = lowerThumb()
    }
}

public extension LowerThumb {
    init(lowerThumb: any Shape = Circle()) {
        self.init(lowerThumb: { lowerThumb })
    }
}

public extension LowerThumb {
    init(_ configuration: LowerThumbConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LowerThumbConfiguration, shouldApplyDefaultStyle: Bool) {
        self.lowerThumb = configuration.lowerThumb
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension LowerThumb: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(lowerThumb: .init(self.lowerThumb))).typeErased
                .transformEnvironment(\.lowerThumbStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LowerThumb {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        LowerThumb(.init(lowerThumb: .init(self.lowerThumb)))
            .shouldApplyDefaultStyle(false)
            .lowerThumbStyle(.fiori)
            .typeErased
    }
}
