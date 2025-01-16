// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol IconStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: IconConfiguration) -> Body
}

struct AnyIconStyle: IconStyle {
    let content: (IconConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (IconConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: IconConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct IconConfiguration {
    public var componentIdentifier: String = "fiori_icon_component"
    public let icon: Icon

    public typealias Icon = ConfigurationViewWrapper
}

extension IconConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
