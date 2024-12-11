// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SubAttributeStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SubAttributeConfiguration) -> Body
}

struct AnySubAttributeStyle: SubAttributeStyle {
    let content: (SubAttributeConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SubAttributeConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SubAttributeConfiguration {
    public let subAttributeIdentifier = "FioriSubAttribute_subAttribute"

    public let subAttribute: SubAttribute

    public typealias SubAttribute = ConfigurationViewWrapper
}
