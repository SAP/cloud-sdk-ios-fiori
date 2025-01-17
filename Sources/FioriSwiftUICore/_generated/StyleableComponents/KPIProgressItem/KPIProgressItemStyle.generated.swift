// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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

public extension KPIProgressItemConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var kPIContentIdentifier: String {
        self.componentIdentifier + "_kPIContent"
    }

    var kpiCaptionIdentifier: String {
        self.componentIdentifier + "_kpiCaption"
    }

    var footnoteIdentifier: String {
        self.componentIdentifier + "_footnote"
    }

    var innerCircleIdentifier: String {
        self.componentIdentifier + "_innerCircle"
    }

    var outerCircleIdentifier: String {
        self.componentIdentifier + "_outerCircle"
    }
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

public struct KPIProgressItemNSSStyle: KPIProgressItemStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
        KPIProgressItem(configuration)
            .kPIContentStyle(KPIContentNSSStyle(kPIProgressItemConfiguration: configuration, nssData: self.data.value(configuration.kPIContentIdentifier)))
            .kpiCaptionStyle(KpiCaptionNSSStyle(kPIProgressItemConfiguration: configuration, nssData: self.data.value(configuration.kpiCaptionIdentifier)))
            .footnoteStyle(FootnoteNSSStyle(kPIProgressItemConfiguration: configuration, nssData: self.data.value(configuration.footnoteIdentifier)))
            .innerCircleStyle(InnerCircleNSSStyle(kPIProgressItemConfiguration: configuration, nssData: self.data.value(configuration.innerCircleIdentifier)))
            .outerCircleStyle(OuterCircleNSSStyle(kPIProgressItemConfiguration: configuration, nssData: self.data.value(configuration.outerCircleIdentifier)))
            .kPIProgressItemStyle(ContentNSSStyle(kPIProgressItemConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
