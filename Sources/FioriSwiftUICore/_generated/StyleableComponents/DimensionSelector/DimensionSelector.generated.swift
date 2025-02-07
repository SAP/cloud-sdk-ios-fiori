// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `DimensionSelector` is a horizontal control containing multiple segments, each segment functioning as a discrete button. Selection is mutually exclusive.
///
///  ## Usage:
///  ```swift
///  let titles = ["intraday: 1min", "one day: 1min", "1year:1day", "3years:1week"]
///  @State var selectedIndex: Int? = 0
///  @ObservedObject var stockModel = Tests.stockModels[0]
///
///  DimensionSelector(titles: titles, selectedIndex: $selectedIndex)
///     .onChange(of: selectedIndex) {
///            stockModel.indexOfStockSeries = selectedIndex ?? -1
///    }
///  ```
public struct DimensionSelector {
    /// The array for segment titles
    let titles: [String]
    /// The optional selected index of the DimensionSelector
    @Binding var selectedIndex: Int?
    /// The spacing between two segments. The default value is `6`.
    let interItemSpacing: CGFloat
    /// Content inset for the segmented control.
    let contentInset: EdgeInsets?
    /// Mode that determines the width of each segment. The default value is `.intrinsic`.
    let segmentWidthMode: SegmentWidthMode
    /// A Boolean value indicating if empty selection is allowed. The default value is `true`.
    let allowEmptySelection: Bool
    ///  ViewBuilder for customizing the segments
    let segment: (String) -> any View

    @Environment(\.dimensionSelectorStyle) var style

    var componentIdentifier: String = DimensionSelector.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(titles: [String] = [],
                selectedIndex: Binding<Int?>,
                interItemSpacing: CGFloat = 6,
                contentInset: EdgeInsets? = nil,
                segmentWidthMode: SegmentWidthMode = .intrinsic,
                allowEmptySelection: Bool = true,
                @ViewBuilder segment: @escaping (String) -> any View = { _ in EmptyView() },
                componentIdentifier: String? = DimensionSelector.identifier)
    {
        self.titles = titles
        self._selectedIndex = selectedIndex
        self.interItemSpacing = interItemSpacing
        self.contentInset = contentInset
        self.segmentWidthMode = segmentWidthMode
        self.allowEmptySelection = allowEmptySelection
        self.segment = segment
        self.componentIdentifier = componentIdentifier ?? DimensionSelector.identifier
    }
}

public extension DimensionSelector {
    static let identifier = "fiori_dimensionselector_component"
}

public extension DimensionSelector {
    init(_ configuration: DimensionSelectorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DimensionSelectorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.titles = configuration.titles
        self._selectedIndex = configuration.$selectedIndex
        self.interItemSpacing = configuration.interItemSpacing
        self.contentInset = configuration.contentInset
        self.segmentWidthMode = configuration.segmentWidthMode
        self.allowEmptySelection = configuration.allowEmptySelection
        self.segment = configuration.segment
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DimensionSelector: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, titles: self.titles, selectedIndex: self.$selectedIndex, interItemSpacing: self.interItemSpacing, contentInset: self.contentInset, segmentWidthMode: self.segmentWidthMode, allowEmptySelection: self.allowEmptySelection, segment: self.segment)).typeErased
                .transformEnvironment(\.dimensionSelectorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DimensionSelector {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DimensionSelector(.init(componentIdentifier: self.componentIdentifier, titles: self.titles, selectedIndex: self.$selectedIndex, interItemSpacing: self.interItemSpacing, contentInset: self.contentInset, segmentWidthMode: self.segmentWidthMode, allowEmptySelection: self.allowEmptySelection, segment: self.segment))
            .shouldApplyDefaultStyle(false)
            .dimensionSelectorStyle(DimensionSelectorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
