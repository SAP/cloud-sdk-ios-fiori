// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SelectAllActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SelectAllActionConfiguration) -> Body
}

struct AnySelectAllActionStyle: SelectAllActionStyle {
    let content: (SelectAllActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SelectAllActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SelectAllActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SelectAllActionConfiguration {
    public let selectAllActionIdentifier = "FioriSelectAllAction_selectAllAction"

    public var componentIdentifier: String = "fiori_selectallaction_component"
    public let selectAllAction: SelectAllAction

    public typealias SelectAllAction = ConfigurationViewWrapper
}

extension SelectAllActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
