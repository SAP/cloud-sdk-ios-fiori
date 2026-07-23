// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol SelectAllActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: SelectAllActionConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_selectallaction_component"
    public let selectAllAction: SelectAllAction

    public typealias SelectAllAction = ConfigurationViewWrapper
}

extension SelectAllActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct SelectAllActionDefaultStyle: SelectAllActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: SelectAllActionConfiguration) -> some View {
        SelectAllAction(configuration)
            .selectAllActionStyle(SelectAllActionBaseStyle())
    }
}
