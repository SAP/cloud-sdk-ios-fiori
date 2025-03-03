// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DimensionSelectorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DimensionSelectorConfiguration) -> Body
}

struct AnyDimensionSelectorStyle: DimensionSelectorStyle {
    let content: (DimensionSelectorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DimensionSelectorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DimensionSelectorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DimensionSelectorConfiguration {
    public var componentIdentifier: String = "fiori_dimensionselector_component"
    public let titles: [String]
    @Binding public var selectedIndex: Int?
    public let interItemSpacing: CGFloat
    public let contentInset: EdgeInsets?
    public let segmentWidthMode: SegmentWidthMode
    public let allowEmptySelection: Bool
    public let segment: (String) -> any View
}

extension DimensionSelectorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct DimensionSelectorFioriStyle: DimensionSelectorStyle {
    public func makeBody(_ configuration: DimensionSelectorConfiguration) -> some View {
        DimensionSelector(configuration)
    }
}
