// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Status {
    let status: any View

    @Environment(\.statusStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder status: () -> any View = { EmptyView() }) {
        self.status = status()
    }
}

public extension Status {
    init(status: TextOrIcon? = nil) {
        self.init(status: { TextOrIconView(status) })
    }
}

public extension Status {
    init(_ configuration: StatusConfiguration) {
        self.status = configuration.status
        self._shouldApplyDefaultStyle = false
    }
}

extension Status: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(status: .init(self.status))).typeErased
                .transformEnvironment(\.statusStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Status {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Status(status: { self.status })
            .shouldApplyDefaultStyle(false)
            .statusStyle(.fiori)
            .typeErased
    }
}
