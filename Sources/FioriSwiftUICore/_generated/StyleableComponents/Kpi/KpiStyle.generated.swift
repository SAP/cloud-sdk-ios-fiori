// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    public let kpi: Kpi

    public typealias Kpi = ConfigurationViewWrapper
}
