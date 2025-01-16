// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Status {
    let status: any View

    @Environment(\.statusStyle) var style

    var componentIdentifier: String = Status.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder status: () -> any View = { EmptyView() },
                componentIdentifier: String? = Status.identifier)
    {
        self.status = status()
        self.componentIdentifier = componentIdentifier ?? Status.identifier
    }
}

public extension Status {
    static let identifier = "fiori_status_component"
}

public extension Status {
    init(status: TextOrIcon? = nil,
         componentIdentifier: String? = Status.identifier)
    {
        self.init(status: { TextOrIconView(status) }, componentIdentifier: componentIdentifier)
    }
}

public extension Status {
    init(_ configuration: StatusConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: StatusConfiguration, shouldApplyDefaultStyle: Bool) {
        self.status = configuration.status
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Status: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, status: .init(self.status))).typeErased
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
        Status(.init(componentIdentifier: self.componentIdentifier, status: .init(self.status)))
            .shouldApplyDefaultStyle(false)
            .statusStyle(.fiori)
            .typeErased
    }
}
