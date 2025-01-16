// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ApplyAction {
    let applyAction: any View

    @Environment(\.applyActionStyle) var style

    var componentIdentifier: String = ApplyAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder applyAction: () -> any View = { FioriButton { _ in Text("Apply".localizedFioriString()) } },
                componentIdentifier: String? = ApplyAction.identifier)
    {
        self.applyAction = applyAction()
        self.componentIdentifier = componentIdentifier ?? ApplyAction.identifier
    }
}

public extension ApplyAction {
    static let identifier = "fiori_applyaction_component"
}

public extension ApplyAction {
    init(applyAction: FioriButton? = FioriButton { _ in Text("Apply".localizedFioriString()) },
         componentIdentifier: String? = ApplyAction.identifier)
    {
        self.init(applyAction: { applyAction }, componentIdentifier: componentIdentifier)
    }
}

public extension ApplyAction {
    init(_ configuration: ApplyActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ApplyActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.applyAction = configuration.applyAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ApplyAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, applyAction: .init(self.applyAction))).typeErased
                .transformEnvironment(\.applyActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ApplyAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ApplyAction(.init(componentIdentifier: self.componentIdentifier, applyAction: .init(self.applyAction)))
            .shouldApplyDefaultStyle(false)
            .applyActionStyle(.fiori)
            .typeErased
    }
}
