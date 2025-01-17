// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct InnerCircle {
    let innerCircle: any View

    @Environment(\.innerCircleStyle) var style

    var componentIdentifier: String = InnerCircle.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder innerCircle: () -> any View,
                componentIdentifier: String? = InnerCircle.identifier)
    {
        self.innerCircle = innerCircle()
        self.componentIdentifier = componentIdentifier ?? InnerCircle.identifier
    }
}

public extension InnerCircle {
    static let identifier = "fiori_innercircle_component"
}

public extension InnerCircle {
    init(innerCircle: any Shape = Circle(),
         componentIdentifier: String? = InnerCircle.identifier)
    {
        self.init(innerCircle: { innerCircle }, componentIdentifier: componentIdentifier)
    }
}

public extension InnerCircle {
    init(_ configuration: InnerCircleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: InnerCircleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.innerCircle = configuration.innerCircle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension InnerCircle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, innerCircle: .init(self.innerCircle))).typeErased
                .transformEnvironment(\.innerCircleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension InnerCircle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        InnerCircle(.init(componentIdentifier: self.componentIdentifier, innerCircle: .init(self.innerCircle)))
            .shouldApplyDefaultStyle(false)
            .innerCircleStyle(.fiori)
            .typeErased
    }
}
