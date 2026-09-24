// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol KPIContentStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: KPIContentConfiguration) -> Body
}

struct AnyKPIContentStyle: KPIContentStyle {
    let content: (KPIContentConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KPIContentConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KPIContentConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KPIContentConfiguration {
    public var componentIdentifier: String = "fiori_kpicontent_component"
    public let kPIContent: KPIContent

    public typealias KPIContent = ConfigurationViewWrapper
}

extension KPIContentConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct KPIContentDefaultStyle: KPIContentStyle {
    nonisolated init() {}

    func makeBody(_ configuration: KPIContentConfiguration) -> some View {
        KPIContent(configuration)
            .kPIContentStyle(KPIContentBaseStyle())
    }
}
