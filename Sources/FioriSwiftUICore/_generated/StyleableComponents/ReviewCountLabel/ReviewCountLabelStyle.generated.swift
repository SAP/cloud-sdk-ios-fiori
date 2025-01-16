// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ReviewCountLabelStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ReviewCountLabelConfiguration) -> Body
}

struct AnyReviewCountLabelStyle: ReviewCountLabelStyle {
    let content: (ReviewCountLabelConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ReviewCountLabelConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ReviewCountLabelConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ReviewCountLabelConfiguration {
    public var componentIdentifier: String = "fiori_reviewcountlabel_component"
    public let reviewCountLabel: ReviewCountLabel

    public typealias ReviewCountLabel = ConfigurationViewWrapper
}

extension ReviewCountLabelConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
