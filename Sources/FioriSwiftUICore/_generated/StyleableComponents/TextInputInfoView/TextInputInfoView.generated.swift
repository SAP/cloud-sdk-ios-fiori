// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TextInputInfoView {
    let icon: any View
    let description: any View
    let content: any View
    let counter: any View

    @Environment(\.textInputInfoViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder content: () -> any View,
                @ViewBuilder counter: () -> any View = { EmptyView() })
    {
        self.icon = Icon { icon() }
        self.description = Description { description() }
        self.content = content()
        self.counter = Counter { counter() }
    }
}

public extension TextInputInfoView {
    init(icon: Image? = nil,
         description: AttributedString? = nil,
         @ViewBuilder content: () -> any View,
         counter: AttributedString? = nil)
    {
        self.init(icon: { icon }, description: { OptionalText(description) }, content: content, counter: { OptionalText(counter) })
    }
}

public extension TextInputInfoView {
    init(_ configuration: TextInputInfoViewConfiguration) {
        self.icon = configuration.icon
        self.description = configuration.description
        self.content = configuration.content
        self.counter = configuration.counter
        self._shouldApplyDefaultStyle = false
    }
}

extension TextInputInfoView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(icon: .init(self.icon), description: .init(self.description), content: .init(self.content), counter: .init(self.counter))).typeErased
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
        TextInputInfoView(.init(icon: .init(self.icon), description: .init(self.description), content: .init(self.content), counter: .init(self.counter)))
            .shouldApplyDefaultStyle(false)
            .textInputInfoViewStyle(TextInputInfoViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
