// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol KpiStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: KpiConfiguration) -> Body
}

struct AnyKpiStyle: KpiStyle {
    let content: (KpiConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KpiConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KpiConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KpiConfiguration {
    public var componentIdentifier: String = "fiori_kpi_component"
    public let kpi: Kpi

    public typealias Kpi = ConfigurationViewWrapper
}

extension KpiConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct KpiDefaultStyle: KpiStyle {
    nonisolated init() {}

    func makeBody(_ configuration: KpiConfiguration) -> some View {
        Kpi(configuration)
            .kpiStyle(KpiBaseStyle())
    }
}
