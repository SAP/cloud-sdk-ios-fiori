// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol KPIItemStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: KPIItemConfiguration) -> Body
}

struct AnyKPIItemStyle: KPIItemStyle {
    let content: (KPIItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KPIItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KPIItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KPIItemConfiguration {
    public var componentIdentifier: String = "fiori_kpiitem_component"
    public let kpiCaption: KpiCaption
    public let items: [any KPISubItemModel]
    public let proposedViewSize: KPIItemSize
    public let alignment: Alignment

    public typealias KpiCaption = ConfigurationViewWrapper
}

extension KPIItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct KPIItemFioriStyle: KPIItemStyle {
    public func makeBody(_ configuration: KPIItemConfiguration) -> some View {
        KPIItem(configuration)
            .kpiCaptionStyle(KpiCaptionFioriStyle(kPIItemConfiguration: configuration))
    }
}

struct KPIItemDefaultStyle: KPIItemStyle {
    nonisolated init() {}

    func makeBody(_ configuration: KPIItemConfiguration) -> some View {
        KPIItem(configuration)
            .kPIItemStyle(KPIItemFioriStyle())
            .modifier(KPIItemStyleModifier(style: KPIItemBaseStyle()))
    }
}
