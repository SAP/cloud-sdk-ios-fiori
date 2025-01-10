// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TrendImage {
    let trendImage: any View

    @Environment(\.trendImageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder trendImage: () -> any View = { EmptyView() }) {
        self.trendImage = trendImage()
    }
}

public extension TrendImage {
    init(trendImage: Image? = nil) {
        self.init(trendImage: { trendImage })
    }
}

public extension TrendImage {
    init(_ configuration: TrendImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TrendImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.trendImage = configuration.trendImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TrendImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(trendImage: .init(self.trendImage))).typeErased
                .transformEnvironment(\.trendImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TrendImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TrendImage(.init(trendImage: .init(self.trendImage)))
            .shouldApplyDefaultStyle(false)
            .trendImageStyle(.fiori)
            .typeErased
    }
}
