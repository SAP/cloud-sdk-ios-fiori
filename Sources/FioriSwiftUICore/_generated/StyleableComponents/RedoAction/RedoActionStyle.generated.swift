// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol RedoActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: RedoActionConfiguration) -> Body
}

struct AnyRedoActionStyle: RedoActionStyle {
    let content: (RedoActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (RedoActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: RedoActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct RedoActionConfiguration {
    public var componentIdentifier: String = "fiori_redoaction_component"
    public let redoAction: RedoAction

    public typealias RedoAction = ConfigurationViewWrapper
}

extension RedoActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
