// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    public let selectAllAction: SelectAllAction

    public typealias SelectAllAction = ConfigurationViewWrapper
}
