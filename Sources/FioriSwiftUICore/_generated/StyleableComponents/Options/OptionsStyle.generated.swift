// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol OptionsStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: OptionsConfiguration) -> Body
}

struct AnyOptionsStyle: OptionsStyle {
    let content: (OptionsConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (OptionsConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: OptionsConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct OptionsConfiguration {
    public var componentIdentifier: String = "fiori_options_component"
    public let options: [AttributedString]
}

extension OptionsConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
