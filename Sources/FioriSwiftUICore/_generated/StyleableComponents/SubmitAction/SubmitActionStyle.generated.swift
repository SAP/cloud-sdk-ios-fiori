// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SubmitActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SubmitActionConfiguration) -> Body
}

struct AnySubmitActionStyle: SubmitActionStyle {
    let content: (SubmitActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SubmitActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SubmitActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SubmitActionConfiguration {
    public var componentIdentifier: String = "fiori_submitaction_component"
    public let submitAction: SubmitAction

    public typealias SubmitAction = ConfigurationViewWrapper
}

extension SubmitActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
