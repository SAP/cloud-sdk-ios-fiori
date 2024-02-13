// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct InformationViewIcon {
    let informationViewIcon: any View

    @Environment(\.informationViewIconStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder informationViewIcon: () -> any View = { EmptyView() }) {
        self.informationViewIcon = informationViewIcon()
    }
}

public extension InformationViewIcon {
    init(informationViewIcon: Image? = nil) {
        self.init(informationViewIcon: { informationViewIcon })
    }
}

public extension InformationViewIcon {
    init(_ configuration: InformationViewIconConfiguration) {
        self.informationViewIcon = configuration.informationViewIcon
        self._shouldApplyDefaultStyle = false
    }
}

extension InformationViewIcon: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(informationViewIcon: .init(self.informationViewIcon))).typeErased
                .transformEnvironment(\.informationViewIconStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension InformationViewIcon {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        InformationViewIcon(informationViewIcon: { self.informationViewIcon })
            .shouldApplyDefaultStyle(false)
            .informationViewIconStyle(.fiori)
    }
}
