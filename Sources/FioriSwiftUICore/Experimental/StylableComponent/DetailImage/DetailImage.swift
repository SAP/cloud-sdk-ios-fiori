// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DetailImage {
    let detailImage: any View

    @Environment(\.detailImageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() }) {
        self.detailImage = detailImage()
    }
}

public extension DetailImage {
    init(detailImage: Image? = nil) {
        self.init(detailImage: { detailImage })
    }
}

public extension DetailImage {
    init(_ configuration: DetailImageConfiguration) {
        self.detailImage = configuration.detailImage
        self._shouldApplyDefaultStyle = false
    }
}

extension DetailImage: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(detailImage: .init(self.detailImage))).typeErased
                .transformEnvironment(\.detailImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DetailImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DetailImage(detailImage: { self.detailImage })
            .shouldApplyDefaultStyle(false)
            .detailImageStyle(.fiori)
    }
}
