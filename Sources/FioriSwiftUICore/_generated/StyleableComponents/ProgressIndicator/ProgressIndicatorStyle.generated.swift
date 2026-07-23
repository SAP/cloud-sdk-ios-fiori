// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol ProgressIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: ProgressIndicatorConfiguration) -> Body
}

struct AnyProgressIndicatorStyle: ProgressIndicatorStyle {
    let content: (ProgressIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ProgressIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ProgressIndicatorConfiguration {
    public var componentIdentifier: String = "fiori_progressindicator_component"
    @Binding public var progress: Double
}

extension ProgressIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ProgressIndicatorFioriStyle: ProgressIndicatorStyle {
    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        ProgressIndicator(configuration)
            .progressIndicatorProtocolStyle(ProgressIndicatorProtocolFioriStyle(progressIndicatorConfiguration: configuration))
    }
}

struct ProgressIndicatorDefaultStyle: ProgressIndicatorStyle {
    nonisolated init() {}

    func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        ProgressIndicator(configuration)
            .progressIndicatorStyle(ProgressIndicatorFioriStyle())
            .modifier(ProgressIndicatorStyleModifier(style: ProgressIndicatorBaseStyle()))
    }
}
