// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol ValueLabelStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ValueLabelConfiguration) -> Body
}

struct AnyValueLabelStyle: ValueLabelStyle {
    let content: (ValueLabelConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ValueLabelConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ValueLabelConfiguration {
    public let valueLabelIdentifier = "FioriValueLabel_valueLabel"

    public let valueLabel: ValueLabel

    public typealias ValueLabel = ConfigurationViewWrapper
}
