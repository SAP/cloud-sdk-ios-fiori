// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SecondaryTimestampImage {
    let secondaryTimestampImage: any View

    @Environment(\.secondaryTimestampImageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder secondaryTimestampImage: () -> any View = { EmptyView() }) {
        self.secondaryTimestampImage = secondaryTimestampImage()
    }
}

public extension SecondaryTimestampImage {
    init(secondaryTimestampImage: Image? = nil) {
        self.init(secondaryTimestampImage: { secondaryTimestampImage })
    }
}

public extension SecondaryTimestampImage {
    init(_ configuration: SecondaryTimestampImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SecondaryTimestampImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.secondaryTimestampImage = configuration.secondaryTimestampImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension SecondaryTimestampImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(secondaryTimestampImage: .init(self.secondaryTimestampImage))).typeErased
                .transformEnvironment(\.secondaryTimestampImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SecondaryTimestampImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SecondaryTimestampImage(secondaryTimestampImage: { self.secondaryTimestampImage })
            .shouldApplyDefaultStyle(false)
            .secondaryTimestampImageStyle(.fiori)
            .typeErased
    }
}
