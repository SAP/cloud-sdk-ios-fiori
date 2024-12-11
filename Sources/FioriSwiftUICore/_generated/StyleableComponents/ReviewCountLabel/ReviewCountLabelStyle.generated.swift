// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let reviewCountLabelIdentifier = "FioriReviewCountLabel_reviewCountLabel"

    public let reviewCountLabel: ReviewCountLabel

    public typealias ReviewCountLabel = ConfigurationViewWrapper
}
