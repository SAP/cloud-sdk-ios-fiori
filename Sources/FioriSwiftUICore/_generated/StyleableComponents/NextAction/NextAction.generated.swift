// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct NextAction {
    let nextAction: any View

    @Environment(\.nextActionStyle) var style

    var componentIdentifier: String = NextAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder nextAction: () -> any View = { FioriButton { _ in Text("Next".localizedFioriString()) } },
                componentIdentifier: String? = NextAction.identifier)
    {
        self.nextAction = nextAction()
        self.componentIdentifier = componentIdentifier ?? NextAction.identifier
    }
}

public extension NextAction {
    static let identifier = "fiori_nextaction_component"
}

public extension NextAction {
    init(nextAction: FioriButton? = FioriButton { _ in Text("Next".localizedFioriString()) }) {
        self.init(nextAction: { nextAction })
    }
}

public extension NextAction {
    init(_ configuration: NextActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: NextActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.nextAction = configuration.nextAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension NextAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, nextAction: .init(self.nextAction))).typeErased
                .transformEnvironment(\.nextActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension NextAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        NextAction(.init(componentIdentifier: self.componentIdentifier, nextAction: .init(self.nextAction)))
            .shouldApplyDefaultStyle(false)
            .nextActionStyle(.fiori)
            .typeErased
    }
}
