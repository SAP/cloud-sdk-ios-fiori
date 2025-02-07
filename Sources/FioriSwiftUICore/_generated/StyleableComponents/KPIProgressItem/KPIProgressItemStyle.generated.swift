// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol KPIProgressItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: KPIProgressItemConfiguration) -> Body
}

struct AnyKPIProgressItemStyle: KPIProgressItemStyle {
    let content: (KPIProgressItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KPIProgressItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KPIProgressItemConfiguration {
    public var componentIdentifier: String = "fiori_kpiprogressitem_component"
    public let kPIContent: KPIContent
    public let kpiCaption: KpiCaption
    public let footnote: Footnote
    public let innerCircle: InnerCircle
    public let outerCircle: OuterCircle
    @Binding public var data: KPIItemData
    public let chartSize: KPIProgressItemSize

    public typealias KPIContent = ConfigurationViewWrapper
    public typealias KpiCaption = ConfigurationViewWrapper
    public typealias Footnote = ConfigurationViewWrapper
    public typealias InnerCircle = ConfigurationViewWrapper
    public typealias OuterCircle = ConfigurationViewWrapper
}

extension KPIProgressItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct KPIProgressItemFioriStyle: KPIProgressItemStyle {
    public func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
        KPIProgressItem(configuration)
            .kPIContentStyle(KPIContentFioriStyle(kPIProgressItemConfiguration: configuration))
            .kpiCaptionStyle(KpiCaptionFioriStyle(kPIProgressItemConfiguration: configuration))
            .footnoteStyle(FootnoteFioriStyle(kPIProgressItemConfiguration: configuration))
            .innerCircleStyle(InnerCircleFioriStyle(kPIProgressItemConfiguration: configuration))
            .outerCircleStyle(OuterCircleFioriStyle(kPIProgressItemConfiguration: configuration))
    }
}
