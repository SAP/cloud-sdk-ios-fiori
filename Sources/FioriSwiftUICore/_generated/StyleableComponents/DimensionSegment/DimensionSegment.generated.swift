// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `DimensionSegment` provides a customizable segment for `DimensionSelector`.
///
public struct DimensionSegment {
    let title: any View
    /// Whether the item is selected or not
    let isSelected: Bool

    @Environment(\.dimensionSegmentStyle) var style

    var componentIdentifier: String = DimensionSegment.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                isSelected: Bool,
                componentIdentifier: String? = DimensionSegment.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.isSelected = isSelected
        self.componentIdentifier = componentIdentifier ?? DimensionSegment.identifier
    }
}

public extension DimensionSegment {
    static let identifier = "fiori_dimensionsegment_component"
}

public extension DimensionSegment {
    init(title: AttributedString,
         isSelected: Bool)
    {
        self.init(title: { Text(title) }, isSelected: isSelected)
    }
}

public extension DimensionSegment {
    init(_ configuration: DimensionSegmentConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DimensionSegmentConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.isSelected = configuration.isSelected
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DimensionSegment: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), isSelected: self.isSelected)).typeErased
                .transformEnvironment(\.dimensionSegmentStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DimensionSegment {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DimensionSegment(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), isSelected: self.isSelected))
            .shouldApplyDefaultStyle(false)
            .dimensionSegmentStyle(DimensionSegmentFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
