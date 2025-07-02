// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DoneActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DoneActionConfiguration) -> Body
}

struct AnyDoneActionStyle: DoneActionStyle {
    let content: (DoneActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DoneActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DoneActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DoneActionConfiguration {
    public var componentIdentifier: String = "fiori_doneaction_component"
    public let doneAction: DoneAction

    public typealias DoneAction = ConfigurationViewWrapper
}

extension DoneActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
