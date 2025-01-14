// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol DetailContentStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DetailContentConfiguration) -> Body
}

struct AnyDetailContentStyle: DetailContentStyle {
    let content: (DetailContentConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DetailContentConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DetailContentConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DetailContentConfiguration {
    public let detailContentIdentifier = "FioriDetailContent_detailContent"

    public var componentIdentifier: String = "fiori_detailcontent_component"
    public let detailContent: DetailContent

    public typealias DetailContent = ConfigurationViewWrapper
}

extension DetailContentConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
