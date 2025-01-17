// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TitlesStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TitlesConfiguration) -> Body
}

struct AnyTitlesStyle: TitlesStyle {
    let content: (TitlesConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TitlesConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TitlesConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TitlesConfiguration {
    public var componentIdentifier: String = "fiori_titles_component"
    public let titles: [String]
}

extension TitlesConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
