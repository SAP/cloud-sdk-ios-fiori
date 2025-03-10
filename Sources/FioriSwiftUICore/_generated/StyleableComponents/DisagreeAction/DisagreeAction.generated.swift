// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DisagreeAction {
    let disagreeAction: any View

    @Environment(\.disagreeActionStyle) var style

    var componentIdentifier: String = DisagreeAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder disagreeAction: () -> any View = { FioriButton { _ in Text("Disagree".localizedFioriString()) } },
                componentIdentifier: String? = DisagreeAction.identifier)
    {
        self.disagreeAction = disagreeAction()
        self.componentIdentifier = componentIdentifier ?? DisagreeAction.identifier
    }
}

public extension DisagreeAction {
    static let identifier = "fiori_disagreeaction_component"
}

public extension DisagreeAction {
    init(disagreeAction: FioriButton? = FioriButton { _ in Text("Disagree".localizedFioriString()) }) {
        self.init(disagreeAction: { disagreeAction })
    }
}

public extension DisagreeAction {
    init(_ configuration: DisagreeActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DisagreeActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.disagreeAction = configuration.disagreeAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DisagreeAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, disagreeAction: .init(self.disagreeAction))).typeErased
                .transformEnvironment(\.disagreeActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DisagreeAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DisagreeAction(.init(componentIdentifier: self.componentIdentifier, disagreeAction: .init(self.disagreeAction)))
            .shouldApplyDefaultStyle(false)
            .disagreeActionStyle(.fiori)
            .typeErased
    }
}
