// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ActiveTrack {
    let activeTrack: any View

    @Environment(\.activeTrackStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder activeTrack: () -> any View) {
        self.activeTrack = activeTrack()
    }
}

public extension ActiveTrack {
    init(activeTrack: any Shape = Capsule()) {
        self.init(activeTrack: { activeTrack })
    }
}

public extension ActiveTrack {
    init(_ configuration: ActiveTrackConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ActiveTrackConfiguration, shouldApplyDefaultStyle: Bool) {
        self.activeTrack = configuration.activeTrack
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ActiveTrack: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(activeTrack: .init(self.activeTrack))).typeErased
                .transformEnvironment(\.activeTrackStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ActiveTrack {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ActiveTrack(.init(activeTrack: .init(self.activeTrack)))
            .shouldApplyDefaultStyle(false)
            .activeTrackStyle(.fiori)
            .typeErased
    }
}
