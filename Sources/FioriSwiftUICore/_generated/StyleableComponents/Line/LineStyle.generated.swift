// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol LineStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: LineConfiguration) -> Body
}

struct AnyLineStyle: LineStyle {
    let content: (LineConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (LineConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: LineConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct LineConfiguration {
    public var componentIdentifier: String = "fiori_line_component"
    public let line: Line

    public typealias Line = ConfigurationViewWrapper
}

public extension LineConfiguration {
    var lineIdentifier: String {
        self.componentIdentifier + "_line"
    }
}

extension LineConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
