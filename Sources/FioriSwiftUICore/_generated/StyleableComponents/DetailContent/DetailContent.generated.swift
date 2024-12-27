// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DetailContent {
    let detailContent: any View

    @Environment(\.detailContentStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailContent: () -> any View = { EmptyView() }) {
        self.detailContent = detailContent()
    }
}

public extension DetailContent {
    init(_ configuration: DetailContentConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DetailContentConfiguration, shouldApplyDefaultStyle: Bool) {
        self.detailContent = configuration.detailContent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension DetailContent: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(detailContent: .init(self.detailContent))).typeErased
                .transformEnvironment(\.detailContentStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DetailContent {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DetailContent(.init(detailContent: .init(self.detailContent)))
            .shouldApplyDefaultStyle(false)
            .detailContentStyle(.fiori)
            .typeErased
    }
}
