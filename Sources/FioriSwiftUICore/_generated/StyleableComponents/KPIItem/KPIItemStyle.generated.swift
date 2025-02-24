// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol KPIItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: KPIItemConfiguration) -> Body
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
    @Binding public var items: [any KPIViewSubItemModel]
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
