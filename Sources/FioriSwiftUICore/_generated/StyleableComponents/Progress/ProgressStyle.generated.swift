// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol FioriProgressViewStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: FioriProgressViewConfiguration) -> Body
}

struct AnyFioriProgressViewStyle: FioriProgressViewStyle {
    let content: (FioriProgressViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FioriProgressViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FioriProgressViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FioriProgressViewConfiguration {
    public var componentIdentifier: String = "fiori_progress_component"
    public let progress: FioriProgressView

    public typealias FioriProgressView = ConfigurationViewWrapper
}

extension FioriProgressViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct FioriProgressViewDefaultStyle: FioriProgressViewStyle {
    nonisolated init() {}

    func makeBody(_ configuration: FioriProgressViewConfiguration) -> some View {
        FioriProgressView(configuration)
            .fioriProgressViewStyle(FioriProgressViewBaseStyle())
    }
}
