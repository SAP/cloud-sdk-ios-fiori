// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct InformationView {
    let icon: any View
    let description: any View
    let content: any View

    @Environment(\.informationViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder content: () -> any View)
    {
        self.icon = Icon { icon() }
        self.description = Description { description() }
        self.content = content()
    }
}

public extension InformationView {
    init(icon: Image? = nil,
         description: AttributedString? = nil,
         @ViewBuilder content: () -> any View)
    {
        self.init(icon: { icon }, description: { OptionalText(description) }, content: content)
    }
}

public extension InformationView {
    init(_ configuration: InformationViewConfiguration) {
        self.icon = configuration.icon
        self.description = configuration.description
        self.content = configuration.content
        self._shouldApplyDefaultStyle = false
    }
}

extension InformationView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(icon: .init(self.icon), description: .init(self.description), content: .init(self.content))).typeErased
                .transformEnvironment(\.informationViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension InformationView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        InformationView(.init(icon: .init(self.icon), description: .init(self.description), content: .init(self.content)))
            .shouldApplyDefaultStyle(false)
            .informationViewStyle(InformationViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
