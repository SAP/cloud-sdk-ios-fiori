// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AccessoryViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AccessoryViewConfiguration) -> Body
}

struct AnyAccessoryViewStyle: AccessoryViewStyle {
    let content: (AccessoryViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AccessoryViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AccessoryViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AccessoryViewConfiguration {
    public var componentIdentifier: String = "fiori_accessoryview_component"
    public let accessoryType: AccessoryType
}

extension AccessoryViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
