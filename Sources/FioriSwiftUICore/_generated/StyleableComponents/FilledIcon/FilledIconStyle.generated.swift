// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol FilledIconStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: FilledIconConfiguration) -> Body
}

struct AnyFilledIconStyle: FilledIconStyle {
    let content: (FilledIconConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FilledIconConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FilledIconConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FilledIconConfiguration {
    public var componentIdentifier: String = "fiori_filledicon_component"
    public let filledIcon: FilledIcon

    public typealias FilledIcon = ConfigurationViewWrapper
}

public extension FilledIconConfiguration {
    var filledIconIdentifier: String {
        self.componentIdentifier + "_filledIcon"
    }
}

extension FilledIconConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
