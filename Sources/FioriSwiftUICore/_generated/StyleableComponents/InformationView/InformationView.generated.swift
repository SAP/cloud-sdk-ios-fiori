// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct InformationView {
    let icon: any View
    let description: any View

    @Environment(\.informationViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() })
    {
        self.icon = Icon(icon: icon)
        self.description = Description(description: description)
    }
}

public extension InformationView {
    init(icon: Image? = nil,
         description: AttributedString? = nil)
    {
        self.init(icon: { icon }, description: { OptionalText(description) })
    }
}

public extension InformationView {
    init(_ configuration: InformationViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: InformationViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.description = configuration.description
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension InformationView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(icon: .init(self.icon), description: .init(self.description))).typeErased
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
        InformationView(.init(icon: .init(self.icon), description: .init(self.description)))
            .shouldApplyDefaultStyle(false)
            .informationViewStyle(InformationViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
