// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ActiveTrackStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ActiveTrackConfiguration) -> Body
}

struct AnyActiveTrackStyle: ActiveTrackStyle {
    let content: (ActiveTrackConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ActiveTrackConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ActiveTrackConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ActiveTrackConfiguration {
    public var componentIdentifier: String = "fiori_activetrack_component"
    public let activeTrack: ActiveTrack

    public typealias ActiveTrack = ConfigurationViewWrapper
}

extension ActiveTrackConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
