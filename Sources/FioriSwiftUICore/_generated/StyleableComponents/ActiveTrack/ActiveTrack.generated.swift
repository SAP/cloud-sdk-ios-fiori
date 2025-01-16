// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ActiveTrack {
    let activeTrack: any View

    @Environment(\.activeTrackStyle) var style

    var componentIdentifier: String = ActiveTrack.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder activeTrack: () -> any View,
                componentIdentifier: String? = ActiveTrack.identifier)
    {
        self.activeTrack = activeTrack()
        self.componentIdentifier = componentIdentifier ?? ActiveTrack.identifier
    }
}

public extension ActiveTrack {
    static let identifier = "fiori_activetrack_component"
}

public extension ActiveTrack {
    init(activeTrack: any Shape = Capsule(),
         componentIdentifier: String? = ActiveTrack.identifier)
    {
        self.init(activeTrack: { activeTrack }, componentIdentifier: componentIdentifier)
    }
}

public extension ActiveTrack {
    init(_ configuration: ActiveTrackConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ActiveTrackConfiguration, shouldApplyDefaultStyle: Bool) {
        self.activeTrack = configuration.activeTrack
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ActiveTrack: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, activeTrack: .init(self.activeTrack))).typeErased
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
        ActiveTrack(.init(componentIdentifier: self.componentIdentifier, activeTrack: .init(self.activeTrack)))
            .shouldApplyDefaultStyle(false)
            .activeTrackStyle(.fiori)
            .typeErased
    }
}
