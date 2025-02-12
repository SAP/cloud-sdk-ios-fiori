// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ResetActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ResetActionConfiguration) -> Body
}

struct AnyResetActionStyle: ResetActionStyle {
    let content: (ResetActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ResetActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ResetActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ResetActionConfiguration {
    public var componentIdentifier: String = "fiori_resetaction_component"
    public let resetAction: ResetAction

    public typealias ResetAction = ConfigurationViewWrapper
}

extension ResetActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
