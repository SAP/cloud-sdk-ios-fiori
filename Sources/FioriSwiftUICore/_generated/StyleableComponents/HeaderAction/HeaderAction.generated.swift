// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct HeaderAction {
    let headerAction: any View

    @Environment(\.headerActionStyle) var style

    var componentIdentifier: String = HeaderAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder headerAction: () -> any View = { EmptyView() },
                componentIdentifier: String? = HeaderAction.identifier)
    {
        self.headerAction = headerAction()
        self.componentIdentifier = componentIdentifier ?? HeaderAction.identifier
    }
}

public extension HeaderAction {
    static let identifier = "fiori_headeraction_component"
}

public extension HeaderAction {
    init(headerAction: FioriButton? = nil,
         componentIdentifier: String? = HeaderAction.identifier)
    {
        self.init(headerAction: { headerAction }, componentIdentifier: componentIdentifier)
    }
}

public extension HeaderAction {
    init(_ configuration: HeaderActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: HeaderActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.headerAction = configuration.headerAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension HeaderAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, headerAction: .init(self.headerAction))).typeErased
                .transformEnvironment(\.headerActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension HeaderAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        HeaderAction(.init(componentIdentifier: self.componentIdentifier, headerAction: .init(self.headerAction)))
            .shouldApplyDefaultStyle(false)
            .headerActionStyle(.fiori)
            .typeErased
    }
}
