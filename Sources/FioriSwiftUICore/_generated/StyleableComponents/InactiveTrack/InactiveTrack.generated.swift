// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct InactiveTrack {
    let inactiveTrack: any View

    @Environment(\.inactiveTrackStyle) var style

    var componentIdentifier: String = InactiveTrack.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder inactiveTrack: () -> any View,
                componentIdentifier: String? = InactiveTrack.identifier)
    {
        self.inactiveTrack = inactiveTrack()
        self.componentIdentifier = componentIdentifier ?? InactiveTrack.identifier
    }
}

public extension InactiveTrack {
    static let identifier = "fiori_inactivetrack_component"
}

public extension InactiveTrack {
    init(inactiveTrack: any Shape = Capsule(),
         componentIdentifier: String? = InactiveTrack.identifier)
    {
        self.init(inactiveTrack: { inactiveTrack }, componentIdentifier: componentIdentifier)
    }
}

public extension InactiveTrack {
    init(_ configuration: InactiveTrackConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: InactiveTrackConfiguration, shouldApplyDefaultStyle: Bool) {
        self.inactiveTrack = configuration.inactiveTrack
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension InactiveTrack: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, inactiveTrack: .init(self.inactiveTrack))).typeErased
                .transformEnvironment(\.inactiveTrackStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension InactiveTrack {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        InactiveTrack(.init(componentIdentifier: self.componentIdentifier, inactiveTrack: .init(self.inactiveTrack)))
            .shouldApplyDefaultStyle(false)
            .inactiveTrackStyle(.fiori)
            .typeErased
    }
}
