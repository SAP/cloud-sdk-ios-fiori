// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ReenterSignatureActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ReenterSignatureActionConfiguration) -> Body
}

struct AnyReenterSignatureActionStyle: ReenterSignatureActionStyle {
    let content: (ReenterSignatureActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ReenterSignatureActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ReenterSignatureActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ReenterSignatureActionConfiguration {
    public var componentIdentifier: String = "fiori_reentersignatureaction_component"
    public let reenterSignatureAction: ReenterSignatureAction

    public typealias ReenterSignatureAction = ConfigurationViewWrapper
}

extension ReenterSignatureActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
