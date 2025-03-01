// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SaveAction {
    let saveAction: any View

    @Environment(\.saveActionStyle) var style

    var componentIdentifier: String = SaveAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder saveAction: () -> any View = { FioriButton { _ in Text("Save".localizedFioriString()) } },
                componentIdentifier: String? = SaveAction.identifier)
    {
        self.saveAction = saveAction()
        self.componentIdentifier = componentIdentifier ?? SaveAction.identifier
    }
}

public extension SaveAction {
    static let identifier = "fiori_saveaction_component"
}

public extension SaveAction {
    init(saveAction: FioriButton? = FioriButton { _ in Text("Save".localizedFioriString()) }) {
        self.init(saveAction: { saveAction })
    }
}

public extension SaveAction {
    init(_ configuration: SaveActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SaveActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.saveAction = configuration.saveAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SaveAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, saveAction: .init(self.saveAction))).typeErased
                .transformEnvironment(\.saveActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SaveAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SaveAction(.init(componentIdentifier: self.componentIdentifier, saveAction: .init(self.saveAction)))
            .shouldApplyDefaultStyle(false)
            .saveActionStyle(.fiori)
            .typeErased
    }
}
