// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AllowAction {
    let allowAction: any View

    @Environment(\.allowActionStyle) var style

    var componentIdentifier: String = AllowAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder allowAction: () -> any View = { FioriButton { _ in Text("Allow".localizedFioriString()) } },
                componentIdentifier: String? = AllowAction.identifier)
    {
        self.allowAction = allowAction()
        self.componentIdentifier = componentIdentifier ?? AllowAction.identifier
    }
}

public extension AllowAction {
    static let identifier = "fiori_allowaction_component"
}

public extension AllowAction {
    init(allowAction: FioriButton? = FioriButton { _ in Text("Allow".localizedFioriString()) }) {
        self.init(allowAction: { allowAction })
    }
}

public extension AllowAction {
    init(_ configuration: AllowActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AllowActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.allowAction = configuration.allowAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AllowAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, allowAction: .init(self.allowAction))).typeErased
                .transformEnvironment(\.allowActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AllowAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AllowAction(.init(componentIdentifier: self.componentIdentifier, allowAction: .init(self.allowAction)))
            .shouldApplyDefaultStyle(false)
            .allowActionStyle(.fiori)
            .typeErased
    }
}
