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
///  DimensionSelector(titles: segmentTitles, selectedIndex: $selectedIndex)
///     .onChange(of: selectedIndex) {
///            stockModel.indexOfStockSeries = selectedIndex ?? -1
///    }
///  ```
public struct DimensionSelector {
    let titles: [String]
    /// The optional selected index of the DimensionSelector
    @Binding var selectedIndex: Int?
    /// The spacing between two segments. The default value is `6`.
    let interItemSpacing: CGFloat
    /// The title insets for each segment.
    let titleInsets: EdgeInsets?
    /// A dictionary to store control state and the corresponding segment attributes.
    let segmentAttributes: [ControlState: SegmentAttributes]?
    /// Content inset for the segmented control.
    let contentInset: EdgeInsets?
    /// If set to false, previous selection will be removed.
    let isEnable: Bool
    /// Mode that determines the width of each segment. The default value is `.intrinsic`.
    let segmentWidthMode: SegmentWidthMode
    /// A Boolean value indicating if empty selection is allowed. The default value is `true`.
    let allowEmptySelection: Bool

    @Environment(\.dimensionSelectorStyle) var style

    var componentIdentifier: String = DimensionSelector.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(titles: [String] = [],
                selectedIndex: Binding<Int?>,
                interItemSpacing: CGFloat = 6,
                titleInsets: EdgeInsets? = nil,
                segmentAttributes: [ControlState: SegmentAttributes]? = nil,
                contentInset: EdgeInsets? = nil,
                isEnable: Bool = true,
                segmentWidthMode: SegmentWidthMode = .intrinsic,
                allowEmptySelection: Bool = true,
                componentIdentifier: String? = DimensionSelector.identifier)
    {
        self.titles = titles
        self._selectedIndex = selectedIndex
        self.interItemSpacing = interItemSpacing
        self.titleInsets = titleInsets
        self.segmentAttributes = segmentAttributes
        self.contentInset = contentInset
        self.isEnable = isEnable
        self.segmentWidthMode = segmentWidthMode
        self.allowEmptySelection = allowEmptySelection
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
        self.titleInsets = configuration.titleInsets
        self.segmentAttributes = configuration.segmentAttributes
        self.contentInset = configuration.contentInset
        self.isEnable = configuration.isEnable
        self.segmentWidthMode = configuration.segmentWidthMode
        self.allowEmptySelection = configuration.allowEmptySelection
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DimensionSelector: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, titles: self.titles, selectedIndex: self.$selectedIndex, interItemSpacing: self.interItemSpacing, titleInsets: self.titleInsets, segmentAttributes: self.segmentAttributes, contentInset: self.contentInset, isEnable: self.isEnable, segmentWidthMode: self.segmentWidthMode, allowEmptySelection: self.allowEmptySelection)).typeErased
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
        DimensionSelector(.init(componentIdentifier: self.componentIdentifier, titles: self.titles, selectedIndex: self.$selectedIndex, interItemSpacing: self.interItemSpacing, titleInsets: self.titleInsets, segmentAttributes: self.segmentAttributes, contentInset: self.contentInset, isEnable: self.isEnable, segmentWidthMode: self.segmentWidthMode, allowEmptySelection: self.allowEmptySelection))
            .shouldApplyDefaultStyle(false)
            .dimensionSelectorStyle(DimensionSelectorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
