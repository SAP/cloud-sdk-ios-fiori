// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol HelperTextStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: HelperTextConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_helpertext_component"
    public let helperText: HelperText

    public typealias HelperText = ConfigurationViewWrapper
}

extension HelperTextConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct HelperTextDefaultStyle: HelperTextStyle {
    nonisolated init() {}

    func makeBody(_ configuration: HelperTextConfiguration) -> some View {
        HelperText(configuration)
            .helperTextStyle(HelperTextBaseStyle())
    }
}
