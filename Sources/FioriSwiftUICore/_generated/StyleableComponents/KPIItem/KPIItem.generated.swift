// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `KPIItem` enables a developer to present "KPI" information in a formatted manner consistent with the Fiori Design Language.
///
/// ## Usage
/// ```swift
/// struct KPISubItemModelImplementation: KPISubItemModel {
///     let id: UUID
///     let kPISubItemValue: TextOrIcon
///     let kPISubItemType: KPISubitemType
///
///     init(id: UUID = UUID(), kPISubItemValue: TextOrIcon, kPISubItemType: KPISubitemType) {
///         self.id = id
///         self.kPISubItemValue = kPISubItemValue
///         self.kPISubItemType = kPISubItemType
///     }
/// }
///
/// private var item: [KPISubItemModelImplementation] = [
///     KPISubItemModelImplementation(kPISubItemValue: .icon(Image(systemName: "triangleshape.fill")), kPISubItemType: KPISubitemType.icon),
///     KPISubItemModelImplementation(kPISubItemValue: .text("123"), kPISubItemType: KPISubitemType.metric),
///     KPISubItemModelImplementation(kPISubItemValue: .text("USD"), kPISubItemType: KPISubitemType.unit)
/// ]
///
/// KPIItem(kpiCaption: "abc", items: item, proposedViewSize: .small, alignment: .leading)
/// ```
public struct KPIItem {
    let kpiCaption: any View
    /// The data for KPI item
    let items: [any KPISubItemModel]
    let proposedViewSize: KPIItemSize
    let alignment: Alignment

    @Environment(\.kPIItemStyle) var style

    var componentIdentifier: String = KPIItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder kpiCaption: () -> any View = { EmptyView() },
                items: [any KPISubItemModel] = [],
                proposedViewSize: KPIItemSize = .small,
                alignment: Alignment = .center,
                componentIdentifier: String? = KPIItem.identifier)
    {
        self.kpiCaption = KpiCaption(kpiCaption: kpiCaption, componentIdentifier: componentIdentifier)
        self.items = items
        self.proposedViewSize = proposedViewSize
        self.alignment = alignment
        self.componentIdentifier = componentIdentifier ?? KPIItem.identifier
    }
}

public extension KPIItem {
    static let identifier = "fiori_kpiitem_component"
}

public extension KPIItem {
    init(kpiCaption: AttributedString? = nil,
         items: [any KPISubItemModel] = [],
         proposedViewSize: KPIItemSize = .small,
         alignment: Alignment = .center)
    {
        self.init(kpiCaption: { OptionalText(kpiCaption) }, items: items, proposedViewSize: proposedViewSize, alignment: alignment)
    }
}

public extension KPIItem {
    init(_ configuration: KPIItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KPIItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.kpiCaption = configuration.kpiCaption
        self.items = configuration.items
        self.proposedViewSize = configuration.proposedViewSize
        self.alignment = configuration.alignment
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension KPIItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, kpiCaption: .init(self.kpiCaption), items: self.items, proposedViewSize: self.proposedViewSize, alignment: self.alignment)).typeErased
                .transformEnvironment(\.kPIItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension KPIItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        KPIItem(.init(componentIdentifier: self.componentIdentifier, kpiCaption: .init(self.kpiCaption), items: self.items, proposedViewSize: self.proposedViewSize, alignment: self.alignment))
            .shouldApplyDefaultStyle(false)
            .kPIItemStyle(KPIItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
