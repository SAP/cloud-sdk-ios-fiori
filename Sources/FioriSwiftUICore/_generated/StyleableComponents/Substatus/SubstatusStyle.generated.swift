// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SubstatusStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SubstatusConfiguration) -> Body
}

struct AnySubstatusStyle: SubstatusStyle {
    let content: (SubstatusConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SubstatusConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SubstatusConfiguration {
    public let substatusIdentifier = "FioriSubstatus_substatus"

    public var componentIdentifier: String = "fiori_substatus_component"
    public let substatus: Substatus

    public typealias Substatus = ConfigurationViewWrapper
}

extension SubstatusConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
