// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct InactiveTrack {
    let inactiveTrack: any View

    @Environment(\.inactiveTrackStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder inactiveTrack: () -> any View) {
        self.inactiveTrack = inactiveTrack()
    }
}

public extension InactiveTrack {
    init(inactiveTrack: any Shape = Capsule()) {
        self.init(inactiveTrack: { inactiveTrack })
    }
}

public extension InactiveTrack {
    init(_ configuration: InactiveTrackConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: InactiveTrackConfiguration, shouldApplyDefaultStyle: Bool) {
        self.inactiveTrack = configuration.inactiveTrack
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension InactiveTrack: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(inactiveTrack: .init(self.inactiveTrack))).typeErased
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
        InactiveTrack(.init(inactiveTrack: .init(self.inactiveTrack)))
            .shouldApplyDefaultStyle(false)
            .inactiveTrackStyle(.fiori)
            .typeErased
    }
}
