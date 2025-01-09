// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol KPIContentStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: KPIContentConfiguration) -> Body
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
    public let kPIContent: KPIContent

    public typealias KPIContent = ConfigurationViewWrapper
}
