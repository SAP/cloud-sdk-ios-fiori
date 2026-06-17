// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol UndoActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: UndoActionConfiguration) -> Body
}

struct AnyUndoActionStyle: UndoActionStyle {
    let content: (UndoActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (UndoActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: UndoActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct UndoActionConfiguration {
    public var componentIdentifier: String = "fiori_undoaction_component"
    public let undoAction: UndoAction

    public typealias UndoAction = ConfigurationViewWrapper
}

extension UndoActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
