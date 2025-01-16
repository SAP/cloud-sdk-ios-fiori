// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardBody {
    let cardBody: any View

    @Environment(\.cardBodyStyle) var style

    var componentIdentifier: String = CardBody.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder cardBody: () -> any View = { EmptyView() },
                componentIdentifier: String? = CardBody.identifier)
    {
        self.cardBody = cardBody()
        self.componentIdentifier = componentIdentifier ?? CardBody.identifier
    }
}

public extension CardBody {
    static let identifier = "fiori_cardbody_component"
}

public extension CardBody {
    init(_ configuration: CardBodyConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CardBodyConfiguration, shouldApplyDefaultStyle: Bool) {
        self.cardBody = configuration.cardBody
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CardBody: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, cardBody: .init(self.cardBody))).typeErased
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
        CardBody(.init(componentIdentifier: self.componentIdentifier, cardBody: .init(self.cardBody)))
            .shouldApplyDefaultStyle(false)
            .cardBodyStyle(.fiori)
            .typeErased
    }
}
