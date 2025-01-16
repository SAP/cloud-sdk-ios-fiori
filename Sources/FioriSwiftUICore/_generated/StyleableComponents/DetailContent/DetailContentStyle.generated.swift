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
    public var componentIdentifier: String = "fiori_detailcontent_component"
    public let detailContent: DetailContent

    public typealias DetailContent = ConfigurationViewWrapper
}

public extension DetailContentConfiguration {
    var detailContentIdentifier: String {
        self.componentIdentifier + "_detailContent"
    }
}

extension DetailContentConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
