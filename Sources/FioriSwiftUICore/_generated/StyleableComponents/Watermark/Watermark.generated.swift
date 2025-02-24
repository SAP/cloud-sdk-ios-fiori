// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Watermark {
    let watermark: any View

    @Environment(\.watermarkStyle) var style

    var componentIdentifier: String = Watermark.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder watermark: () -> any View = { EmptyView() },
                componentIdentifier: String? = Watermark.identifier)
    {
        self.watermark = watermark()
        self.componentIdentifier = componentIdentifier ?? Watermark.identifier
    }
}

public extension Watermark {
    static let identifier = "fiori_watermark_component"
}

public extension Watermark {
    init(watermark: AttributedString? = nil) {
        self.init(watermark: { OptionalText(watermark) })
    }
}

public extension Watermark {
    init(_ configuration: WatermarkConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: WatermarkConfiguration, shouldApplyDefaultStyle: Bool) {
        self.watermark = configuration.watermark
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Watermark: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, watermark: .init(self.watermark))).typeErased
                .transformEnvironment(\.watermarkStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Watermark {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Watermark(.init(componentIdentifier: self.componentIdentifier, watermark: .init(self.watermark)))
            .shouldApplyDefaultStyle(false)
            .watermarkStyle(.fiori)
            .typeErased
    }
}
