// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol Row1Style: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: Row1Configuration) -> Body
}

struct AnyRow1Style: Row1Style {
    let content: (Row1Configuration) -> any View

    init(@ViewBuilder _ content: @escaping (Row1Configuration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: Row1Configuration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct Row1Configuration {
    public var componentIdentifier: String = "fiori_row1_component"
    public let row1: Row1

    public typealias Row1 = ConfigurationViewWrapper
}

extension Row1Configuration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
