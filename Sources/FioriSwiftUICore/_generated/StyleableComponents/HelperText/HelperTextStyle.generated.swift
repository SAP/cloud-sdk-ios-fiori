// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol HelperTextStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: HelperTextConfiguration) -> Body
}

struct AnyHelperTextStyle: HelperTextStyle {
    let content: (HelperTextConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (HelperTextConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: HelperTextConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct HelperTextConfiguration {
    public let helperTextIdentifier = "FioriHelperText_helperText"

    public let helperText: HelperText

    public typealias HelperText = ConfigurationViewWrapper
}
