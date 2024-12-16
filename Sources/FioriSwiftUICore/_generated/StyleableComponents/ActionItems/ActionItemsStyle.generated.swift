// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ActionItemsStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ActionItemsConfiguration) -> Body
}

struct AnyActionItemsStyle: ActionItemsStyle {
    let content: (ActionItemsConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ActionItemsConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ActionItemsConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ActionItemsConfiguration {
    public let actionItems: [ActivityItemDataType]?
    public let didSelectActivityItem: ((ActivityItemDataType) -> Void)?
}
