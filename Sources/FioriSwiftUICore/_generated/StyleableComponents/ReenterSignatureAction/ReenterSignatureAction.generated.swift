// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ReenterSignatureAction {
    let reenterSignatureAction: any View

    @Environment(\.reenterSignatureActionStyle) var style

    var componentIdentifier: String = ReenterSignatureAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder reenterSignatureAction: () -> any View = { FioriButton { _ in Text("Re-enter Signature".localizedFioriString()) } },
                componentIdentifier: String? = ReenterSignatureAction.identifier)
    {
        self.reenterSignatureAction = reenterSignatureAction()
        self.componentIdentifier = componentIdentifier ?? ReenterSignatureAction.identifier
    }
}

public extension ReenterSignatureAction {
    static let identifier = "fiori_reentersignatureaction_component"
}

public extension ReenterSignatureAction {
    init(reenterSignatureAction: FioriButton? = FioriButton { _ in Text("Re-enter Signature".localizedFioriString()) }) {
        self.init(reenterSignatureAction: { reenterSignatureAction })
    }
}

public extension ReenterSignatureAction {
    init(_ configuration: ReenterSignatureActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ReenterSignatureActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.reenterSignatureAction = configuration.reenterSignatureAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ReenterSignatureAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, reenterSignatureAction: .init(self.reenterSignatureAction))).typeErased
                .transformEnvironment(\.reenterSignatureActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ReenterSignatureAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ReenterSignatureAction(.init(componentIdentifier: self.componentIdentifier, reenterSignatureAction: .init(self.reenterSignatureAction)))
            .shouldApplyDefaultStyle(false)
            .reenterSignatureActionStyle(.fiori)
            .typeErased
    }
}
