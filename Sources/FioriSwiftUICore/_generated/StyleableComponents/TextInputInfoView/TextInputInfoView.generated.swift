// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

struct TextInputInfoView {
    let icon: any View
    let description: any View
    let counter: any View

    @Environment(\.textInputInfoViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder counter: () -> any View = { EmptyView() })
    {
        self.icon = Icon { icon() }
        self.description = Description { description() }
        self.counter = Counter { counter() }
    }
}

extension TextInputInfoView {
    init(icon: Image? = nil,
         description: AttributedString? = nil,
         counter: AttributedString? = nil)
    {
        self.init(icon: { icon }, description: { OptionalText(description) }, counter: { OptionalText(counter) })
    }
}

extension TextInputInfoView {
    init(_ configuration: TextInputInfoViewConfiguration) {
        self.icon = configuration.icon
        self.description = configuration.description
        self.counter = configuration.counter
        self._shouldApplyDefaultStyle = false
    }
}

extension TextInputInfoView: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(icon: .init(self.icon), description: .init(self.description), counter: .init(self.counter))).typeErased
                .transformEnvironment(\.textInputInfoViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TextInputInfoView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        TextInputInfoView(.init(icon: .init(self.icon), description: .init(self.description), counter: .init(self.counter)))
            .shouldApplyDefaultStyle(false)
            .textInputInfoViewStyle(TextInputInfoViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
