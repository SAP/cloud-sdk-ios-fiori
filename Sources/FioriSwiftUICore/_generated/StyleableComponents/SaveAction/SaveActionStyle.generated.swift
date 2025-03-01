// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SaveActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SaveActionConfiguration) -> Body
}

struct AnySaveActionStyle: SaveActionStyle {
    let content: (SaveActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SaveActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SaveActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SaveActionConfiguration {
    public var componentIdentifier: String = "fiori_saveaction_component"
    public let saveAction: SaveAction

    public typealias SaveAction = ConfigurationViewWrapper
}

extension SaveActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
