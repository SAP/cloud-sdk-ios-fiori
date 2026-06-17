// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol ProgressIndicatorProtocolStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: ProgressIndicatorProtocolConfiguration) -> Body
}

struct AnyProgressIndicatorProtocolStyle: ProgressIndicatorProtocolStyle {
    let content: (ProgressIndicatorProtocolConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ProgressIndicatorProtocolConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ProgressIndicatorProtocolConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ProgressIndicatorProtocolConfiguration {
    public var componentIdentifier: String = "fiori_progressindicatorprotocol_component"
    @Binding public var progress: Double
}

extension ProgressIndicatorProtocolConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
