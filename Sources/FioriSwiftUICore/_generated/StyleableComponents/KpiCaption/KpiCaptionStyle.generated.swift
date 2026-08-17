// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol KpiCaptionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: KpiCaptionConfiguration) -> Body
}

struct AnyKpiCaptionStyle: KpiCaptionStyle {
    let content: (KpiCaptionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KpiCaptionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KpiCaptionConfiguration {
    public var componentIdentifier: String = "fiori_kpicaption_component"
    public let kpiCaption: KpiCaption

    public typealias KpiCaption = ConfigurationViewWrapper
}

extension KpiCaptionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct KpiCaptionDefaultStyle: KpiCaptionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
        KpiCaption(configuration)
            .kpiCaptionStyle(KpiCaptionBaseStyle())
    }
}
