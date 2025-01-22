// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DimensionSegmentStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DimensionSegmentConfiguration) -> Body
}

struct AnyDimensionSegmentStyle: DimensionSegmentStyle {
    let content: (DimensionSegmentConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DimensionSegmentConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DimensionSegmentConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DimensionSegmentConfiguration {
    public var componentIdentifier: String = "fiori_dimensionsegment_component"
    public let isSelected: Bool
}

extension DimensionSegmentConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct DimensionSegmentFioriStyle: DimensionSegmentStyle {
    public func makeBody(_ configuration: DimensionSegmentConfiguration) -> some View {
        DimensionSegment(configuration)
    }
}
