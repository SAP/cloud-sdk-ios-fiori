// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol KPISubItemStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: KPISubItemConfiguration) -> Body
}

struct AnyKPISubItemStyle: KPISubItemStyle {
    let content: (KPISubItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KPISubItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KPISubItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KPISubItemConfiguration {
    public var componentIdentifier: String = "fiori_kpisubitem_component"
    public let kPISubItemValue: KPISubItemValue
    public let kPISubItemType: KPISubitemType

    public typealias KPISubItemValue = ConfigurationViewWrapper
}

extension KPISubItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
