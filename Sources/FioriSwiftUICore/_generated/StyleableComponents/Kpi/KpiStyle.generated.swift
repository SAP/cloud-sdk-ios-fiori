// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol KpiStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: KpiConfiguration) -> Body
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
    public let kpiIdentifier = "FioriKpi_kpi"

    public var componentIdentifier: String = "fiori_kpi_component"
    public let kpi: Kpi

    public typealias Kpi = ConfigurationViewWrapper
}

extension KpiConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
