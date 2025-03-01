// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol InactiveTrackStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: InactiveTrackConfiguration) -> Body
}

struct AnyInactiveTrackStyle: InactiveTrackStyle {
    let content: (InactiveTrackConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (InactiveTrackConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: InactiveTrackConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct InactiveTrackConfiguration {
    public var componentIdentifier: String = "fiori_inactivetrack_component"
    public let inactiveTrack: InactiveTrack

    public typealias InactiveTrack = ConfigurationViewWrapper
}

extension InactiveTrackConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
