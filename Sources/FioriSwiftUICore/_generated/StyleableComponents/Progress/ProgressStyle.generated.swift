// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol ProgressStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: ProgressConfiguration) -> Body
}

struct AnyProgressStyle: ProgressStyle {
    let content: (ProgressConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ProgressConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ProgressConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ProgressConfiguration {
    public var componentIdentifier: String = "fiori_progress_component"
    public let progress: Progress

    public typealias Progress = ConfigurationViewWrapper
}

extension ProgressConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
