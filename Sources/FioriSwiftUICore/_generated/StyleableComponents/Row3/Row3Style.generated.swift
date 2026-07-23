// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol Row3Style: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: Row3Configuration) -> Body
}

struct AnyRow3Style: Row3Style {
    let content: (Row3Configuration) -> any View

    init(@ViewBuilder _ content: @escaping (Row3Configuration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: Row3Configuration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct Row3Configuration {
    public var componentIdentifier: String = "fiori_row3_component"
    public let row3: Row3

    public typealias Row3 = ConfigurationViewWrapper
}

extension Row3Configuration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct Row3DefaultStyle: Row3Style {
    nonisolated init() {}

    func makeBody(_ configuration: Row3Configuration) -> some View {
        Row3(configuration)
            .row3Style(Row3BaseStyle())
    }
}
