// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

struct TextInputInfoView {
    let icon: any View
    let description: any View
    let counter: any View

    @Environment(\.textInputInfoViewStyle) var style

    var componentIdentifier: String = TextInputInfoView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder counter: () -> any View = { EmptyView() },
                componentIdentifier: String? = TextInputInfoView.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.counter = Counter(counter: counter, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? TextInputInfoView.identifier
    }
}

extension TextInputInfoView {
    public static let identifier = "fiori_textinputinfoview_component"
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
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    init(_ configuration: TextInputInfoViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.description = configuration.description
        self.counter = configuration.counter
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TextInputInfoView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), description: .init(self.description), counter: .init(self.counter))).typeErased
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
        TextInputInfoView(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), description: .init(self.description), counter: .init(self.counter)))
            .shouldApplyDefaultStyle(false)
            .textInputInfoViewStyle(TextInputInfoViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
