// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CloseActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CloseActionConfiguration) -> Body
}

struct AnyCloseActionStyle: CloseActionStyle {
    let content: (CloseActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CloseActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CloseActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CloseActionConfiguration {
    public var componentIdentifier: String = "fiori_closeaction_component"
    public let closeAction: CloseAction

    public typealias CloseAction = ConfigurationViewWrapper
}

extension CloseActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
