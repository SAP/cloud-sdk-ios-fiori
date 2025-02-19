// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct StartSignatureAction {
    let startSignatureAction: any View

    @Environment(\.startSignatureActionStyle) var style

    var componentIdentifier: String = StartSignatureAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder startSignatureAction: () -> any View = { FioriButton { _ in Text("Tap to Sign".localizedFioriString()) } },
                componentIdentifier: String? = StartSignatureAction.identifier)
    {
        self.startSignatureAction = startSignatureAction()
        self.componentIdentifier = componentIdentifier ?? StartSignatureAction.identifier
    }
}

public extension StartSignatureAction {
    static let identifier = "fiori_startsignatureaction_component"
}

public extension StartSignatureAction {
    init(startSignatureAction: FioriButton? = FioriButton { _ in Text("Tap to Sign".localizedFioriString()) }) {
        self.init(startSignatureAction: { startSignatureAction })
    }
}

public extension StartSignatureAction {
    init(_ configuration: StartSignatureActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: StartSignatureActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.startSignatureAction = configuration.startSignatureAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension StartSignatureAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, startSignatureAction: .init(self.startSignatureAction))).typeErased
                .transformEnvironment(\.startSignatureActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension StartSignatureAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        StartSignatureAction(.init(componentIdentifier: self.componentIdentifier, startSignatureAction: .init(self.startSignatureAction)))
            .shouldApplyDefaultStyle(false)
            .startSignatureActionStyle(.fiori)
            .typeErased
    }
}
