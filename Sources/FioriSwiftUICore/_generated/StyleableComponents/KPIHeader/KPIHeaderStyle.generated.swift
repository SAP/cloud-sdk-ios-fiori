// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol KPIHeaderStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: KPIHeaderConfiguration) -> Body
}

struct AnyKPIHeaderStyle: KPIHeaderStyle {
    let content: (KPIHeaderConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KPIHeaderConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KPIHeaderConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KPIHeaderConfiguration {
    public var componentIdentifier: String = "fiori_kpiheader_component"
    public let separator: Separator
    public let items: Items
    public let bannerMessage: BannerMessage
    public let isItemOrderForced: Bool
    public let interItemSpacing: CGFloat?
    @Binding public var isPresented: Bool
    public let isSeparatorHidden: Bool

    public typealias Separator = ConfigurationViewWrapper
    public typealias Items = ConfigurationViewWrapper
    public typealias BannerMessage = ConfigurationViewWrapper
}

extension KPIHeaderConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct KPIHeaderFioriStyle: KPIHeaderStyle {
    public func makeBody(_ configuration: KPIHeaderConfiguration) -> some View {
        KPIHeader(configuration)
            .separatorStyle(SeparatorFioriStyle(kPIHeaderConfiguration: configuration))
    }
}
