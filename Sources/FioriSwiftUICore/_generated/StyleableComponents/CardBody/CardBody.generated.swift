// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardBody {
    let cardBody: any View

    @Environment(\.cardBodyStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder cardBody: () -> any View = { EmptyView() }) {
        self.cardBody = cardBody()
    }
}

public extension CardBody {
    init(_ configuration: CardBodyConfiguration) {
        self.cardBody = configuration.cardBody
        self._shouldApplyDefaultStyle = false
    }
}

extension CardBody: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(cardBody: .init(self.cardBody))).typeErased
                .transformEnvironment(\.cardBodyStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CardBody {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        CardBody(cardBody: { self.cardBody })
            .shouldApplyDefaultStyle(false)
            .cardBodyStyle(.fiori)
            .typeErased
    }
}
