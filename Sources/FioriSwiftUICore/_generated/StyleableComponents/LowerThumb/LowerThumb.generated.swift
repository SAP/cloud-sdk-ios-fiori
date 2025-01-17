// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LowerThumb {
    let lowerThumb: any View

    @Environment(\.lowerThumbStyle) var style

    var componentIdentifier: String = LowerThumb.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder lowerThumb: () -> any View,
                componentIdentifier: String? = LowerThumb.identifier)
    {
        self.lowerThumb = lowerThumb()
        self.componentIdentifier = componentIdentifier ?? LowerThumb.identifier
    }
}

public extension LowerThumb {
    static let identifier = "fiori_lowerthumb_component"
}

public extension LowerThumb {
    init(lowerThumb: any Shape = Circle(),
         componentIdentifier: String? = LowerThumb.identifier)
    {
        self.init(lowerThumb: { lowerThumb }, componentIdentifier: componentIdentifier)
    }
}

public extension LowerThumb {
    init(_ configuration: LowerThumbConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LowerThumbConfiguration, shouldApplyDefaultStyle: Bool) {
        self.lowerThumb = configuration.lowerThumb
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension LowerThumb: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, lowerThumb: .init(self.lowerThumb))).typeErased
                .transformEnvironment(\.lowerThumbStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LowerThumb {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        LowerThumb(.init(componentIdentifier: self.componentIdentifier, lowerThumb: .init(self.lowerThumb)))
            .shouldApplyDefaultStyle(false)
            .lowerThumbStyle(.fiori)
            .typeErased
    }
}
