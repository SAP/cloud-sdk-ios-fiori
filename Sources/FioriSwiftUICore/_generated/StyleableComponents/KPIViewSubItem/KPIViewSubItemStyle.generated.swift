// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol KPIViewSubItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: KPIViewSubItemConfiguration) -> Body
}

struct AnyKPIViewSubItemStyle: KPIViewSubItemStyle {
    let content: (KPIViewSubItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KPIViewSubItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KPIViewSubItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KPIViewSubItemConfiguration {
    public var componentIdentifier: String = "fiori_kpiviewsubitem_component"
    public let kPIViewSubItemValue: KPIViewSubItemValue
    public let kPIViewSubItemType: KPISubitemType

    public typealias KPIViewSubItemValue = ConfigurationViewWrapper
}

extension KPIViewSubItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
