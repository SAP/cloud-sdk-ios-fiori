// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DemoView {
    let title: any View
    let subtitle: any View
    let status: any View
    let newAction: any View
    @Binding var isOn: Bool

    @Environment(\.demoViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder status: () -> any View = { EmptyView() },
                @ViewBuilder newAction: () -> any View = { EmptyView() },
                isOn: Binding<Bool>)
    {
        self.title = Title { title() }
        self.subtitle = Subtitle { subtitle() }
        self.status = Status { status() }
        self.newAction = NewAction { newAction() }
        self._isOn = isOn
    }
}

public extension DemoView {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         status: TextOrIcon? = nil,
         newAction: FioriButton? = nil,
         isOn: Binding<Bool>)
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, status: { TextOrIconView(status) }, newAction: { newAction }, isOn: isOn)
    }
}

public extension DemoView {
    init(_ configuration: DemoViewConfiguration) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.status = configuration.status
        self.newAction = configuration.newAction
        self._isOn = configuration.$isOn
        self._shouldApplyDefaultStyle = false
    }
}

extension DemoView: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(title: .init(self.title), subtitle: .init(self.subtitle), status: .init(self.status), newAction: .init(self.newAction), isOn: self.$isOn)).typeErased
                .transformEnvironment(\.demoViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DemoView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        DemoView(.init(title: .init(self.title), subtitle: .init(self.subtitle), status: .init(self.status), newAction: .init(self.newAction), isOn: self.$isOn))
            .shouldApplyDefaultStyle(false)
            .demoViewStyle(DemoViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
