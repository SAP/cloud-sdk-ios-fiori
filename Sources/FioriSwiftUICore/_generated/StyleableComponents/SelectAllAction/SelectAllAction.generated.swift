// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SelectAllAction {
    let selectAllAction: any View

    @Environment(\.selectAllActionStyle) var style

    var componentIdentifier: String = SelectAllAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder selectAllAction: () -> any View = { FioriButton { _ in Text("Select All".localizedFioriString()) } },
                componentIdentifier: String? = SelectAllAction.identifier)
    {
        self.selectAllAction = selectAllAction()
        self.componentIdentifier = componentIdentifier ?? SelectAllAction.identifier
    }
}

public extension SelectAllAction {
    static let identifier = "fiori_selectallaction_component"
}

public extension SelectAllAction {
    init(selectAllAction: FioriButton? = FioriButton { _ in Text("Select All".localizedFioriString()) }) {
        self.init(selectAllAction: { selectAllAction })
    }
}

public extension SelectAllAction {
    init(_ configuration: SelectAllActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SelectAllActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.selectAllAction = configuration.selectAllAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SelectAllAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, selectAllAction: .init(self.selectAllAction))).typeErased
                .transformEnvironment(\.selectAllActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SelectAllAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SelectAllAction(.init(componentIdentifier: self.componentIdentifier, selectAllAction: .init(self.selectAllAction)))
            .shouldApplyDefaultStyle(false)
            .selectAllActionStyle(.fiori)
            .typeErased
    }
}
