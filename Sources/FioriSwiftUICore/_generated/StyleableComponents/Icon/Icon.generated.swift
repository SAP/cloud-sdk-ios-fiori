// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Icon {
    let icon: any View

    @Environment(\.iconStyle) var style

    var componentIdentifier: String = Icon.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                componentIdentifier: String? = Icon.identifier)
    {
        self.icon = icon()
        self.componentIdentifier = componentIdentifier ?? Icon.identifier
    }
}

public extension Icon {
    static let identifier = "fiori_icon_component"
}

public extension Icon {
    init(icon: Image? = nil,
         componentIdentifier: String? = Icon.identifier)
    {
        self.init(icon: { icon }, componentIdentifier: componentIdentifier)
    }
}

public extension Icon {
    init(_ configuration: IconConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: IconConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Icon: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon))).typeErased
                .transformEnvironment(\.iconStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Icon {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Icon(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon)))
            .shouldApplyDefaultStyle(false)
            .iconStyle(.fiori)
            .typeErased
    }
}
