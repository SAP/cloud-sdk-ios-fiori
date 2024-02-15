// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardMainHeader {
    let title: any View
    let subtitle: any View
    let detailImage: any View
    let counter: any View

    @Environment(\.cardMainHeaderStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder counter: () -> any View = { EmptyView() })
    {
        self.title = Title { title() }
        self.subtitle = Subtitle { subtitle() }
        self.detailImage = DetailImage { detailImage() }
        self.counter = Counter { counter() }
    }
}

public extension CardMainHeader {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         detailImage: Image? = nil,
         counter: AttributedString? = nil)
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, detailImage: { detailImage }, counter: { OptionalText(counter) })
    }
}

public extension CardMainHeader {
    init(_ configuration: CardMainHeaderConfiguration) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.detailImage = configuration.detailImage
        self.counter = configuration.counter
        self._shouldApplyDefaultStyle = false
    }
}

extension CardMainHeader: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(title: .init(self.title), subtitle: .init(self.subtitle), detailImage: .init(self.detailImage), counter: .init(self.counter))).typeErased
                .transformEnvironment(\.cardMainHeaderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CardMainHeader {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        CardMainHeader(.init(title: .init(self.title), subtitle: .init(self.subtitle), detailImage: .init(self.detailImage), counter: .init(self.counter)))
            .shouldApplyDefaultStyle(false)
            .cardMainHeaderStyle(CardMainHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
