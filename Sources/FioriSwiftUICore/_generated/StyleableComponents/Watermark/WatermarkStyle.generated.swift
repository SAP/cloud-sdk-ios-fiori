// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol WatermarkStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: WatermarkConfiguration) -> Body
}

struct AnyWatermarkStyle: WatermarkStyle {
    let content: (WatermarkConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (WatermarkConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: WatermarkConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct WatermarkConfiguration {
    public var componentIdentifier: String = "fiori_watermark_component"
    public let watermark: Watermark

    public typealias Watermark = ConfigurationViewWrapper
}

extension WatermarkConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct WatermarkDefaultStyle: WatermarkStyle {
    nonisolated init() {}

    func makeBody(_ configuration: WatermarkConfiguration) -> some View {
        Watermark(configuration)
            .watermarkStyle(WatermarkBaseStyle())
    }
}
