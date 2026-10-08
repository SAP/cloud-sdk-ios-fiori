// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol SecondaryTimestampStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: SecondaryTimestampConfiguration) -> Body
}

struct AnySecondaryTimestampStyle: SecondaryTimestampStyle {
    let content: (SecondaryTimestampConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SecondaryTimestampConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SecondaryTimestampConfiguration {
    public var componentIdentifier: String = "fiori_secondarytimestamp_component"
    public let secondaryTimestamp: SecondaryTimestamp

    public typealias SecondaryTimestamp = ConfigurationViewWrapper
}

extension SecondaryTimestampConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct SecondaryTimestampDefaultStyle: SecondaryTimestampStyle {
    nonisolated init() {}

    func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
        SecondaryTimestamp(configuration)
            .secondaryTimestampStyle(SecondaryTimestampBaseStyle())
    }
}
