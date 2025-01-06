// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `KPIProgressItem` enables a developer to present "KPI" information in a formatted manner consistent with the Fiori Design Language
///
/// ## Usage
/// ```swift
/// let percentData = KPIItemData.percent(0.65)
/// let fractionData = KPIItemData.fraction(76, 90, numberFormatterProvider.numberFormatter)
///
/// KPIProgressItem(kpiCaption: "Completed", data: .constant(percentData))
/// KPIProgressItem(kpiCaption: "In progress", data: .constant(fractionData), chartSize: .small)
/// ```
public struct KPIProgressItem {
    let kPIContent: any View
    let kpiCaption: any View
    let footnote: any View
    let innerCircle: any View
    let outerCircle: any View
    @Binding var data: KPIItemData
    let chartSize: KPIProgressItemSize

    @Environment(\.kPIProgressItemStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder kPIContent: () -> any View = { EmptyView() },
                @ViewBuilder kpiCaption: () -> any View = { EmptyView() },
                @ViewBuilder footnote: () -> any View = { EmptyView() },
                @ViewBuilder innerCircle: () -> any View,
                @ViewBuilder outerCircle: () -> any View,
                data: Binding<KPIItemData>,
                chartSize: KPIProgressItemSize = .large)
    {
        self.kPIContent = KPIContent(kPIContent: kPIContent)
        self.kpiCaption = KpiCaption(kpiCaption: kpiCaption)
        self.footnote = Footnote(footnote: footnote)
        self.innerCircle = InnerCircle(innerCircle: innerCircle)
        self.outerCircle = OuterCircle(outerCircle: outerCircle)
        self._data = data
        self.chartSize = chartSize
    }
}

public extension KPIProgressItem {
    init(@ViewBuilder kPIContent: () -> any View = { EmptyView() },
         kpiCaption: AttributedString? = nil,
         footnote: AttributedString? = nil,
         innerCircle: any Shape = Circle(),
         outerCircle: any Shape = Circle(),
         data: Binding<KPIItemData>,
         chartSize: KPIProgressItemSize = .large)
    {
        self.init(kPIContent: kPIContent, kpiCaption: { OptionalText(kpiCaption) }, footnote: { OptionalText(footnote) }, innerCircle: { innerCircle }, outerCircle: { outerCircle }, data: data, chartSize: chartSize)
    }
}

public extension KPIProgressItem {
    init(_ configuration: KPIProgressItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KPIProgressItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.kPIContent = configuration.kPIContent
        self.kpiCaption = configuration.kpiCaption
        self.footnote = configuration.footnote
        self.innerCircle = configuration.innerCircle
        self.outerCircle = configuration.outerCircle
        self._data = configuration.$data
        self.chartSize = configuration.chartSize
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension KPIProgressItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(kPIContent: .init(self.kPIContent), kpiCaption: .init(self.kpiCaption), footnote: .init(self.footnote), innerCircle: .init(self.innerCircle), outerCircle: .init(self.outerCircle), data: self.$data, chartSize: self.chartSize)).typeErased
                .transformEnvironment(\.kPIProgressItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension KPIProgressItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        KPIProgressItem(.init(kPIContent: .init(self.kPIContent), kpiCaption: .init(self.kpiCaption), footnote: .init(self.footnote), innerCircle: .init(self.innerCircle), outerCircle: .init(self.outerCircle), data: self.$data, chartSize: self.chartSize))
            .shouldApplyDefaultStyle(false)
            .kPIProgressItemStyle(KPIProgressItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
