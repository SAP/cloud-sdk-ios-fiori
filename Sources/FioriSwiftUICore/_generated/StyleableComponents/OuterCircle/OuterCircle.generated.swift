// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct OuterCircle {
    let outerCircle: any View

    @Environment(\.outerCircleStyle) var style

    var componentIdentifier: String = OuterCircle.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder outerCircle: () -> any View,
                componentIdentifier: String? = OuterCircle.identifier)
    {
        self.outerCircle = outerCircle()
        self.componentIdentifier = componentIdentifier ?? OuterCircle.identifier
    }
}

public extension OuterCircle {
    static let identifier = "fiori_outercircle_component"
}

public extension OuterCircle {
    init(outerCircle: any Shape = Circle(),
         componentIdentifier: String? = OuterCircle.identifier)
    {
        self.init(outerCircle: { outerCircle }, componentIdentifier: componentIdentifier)
    }
}

public extension OuterCircle {
    init(_ configuration: OuterCircleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: OuterCircleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.outerCircle = configuration.outerCircle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension OuterCircle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, outerCircle: .init(self.outerCircle))).typeErased
                .transformEnvironment(\.outerCircleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension OuterCircle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        OuterCircle(.init(componentIdentifier: self.componentIdentifier, outerCircle: .init(self.outerCircle)))
            .shouldApplyDefaultStyle(false)
            .outerCircleStyle(.fiori)
            .typeErased
    }
}
