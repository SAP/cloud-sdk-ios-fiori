// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TertiaryActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TertiaryActionConfiguration) -> Body
}

struct AnyTertiaryActionStyle: TertiaryActionStyle {
    let content: (TertiaryActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TertiaryActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TertiaryActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TertiaryActionConfiguration {
    public var componentIdentifier: String = "fiori_tertiaryaction_component"
    public let tertiaryAction: TertiaryAction

    public typealias TertiaryAction = ConfigurationViewWrapper
}

extension TertiaryActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
