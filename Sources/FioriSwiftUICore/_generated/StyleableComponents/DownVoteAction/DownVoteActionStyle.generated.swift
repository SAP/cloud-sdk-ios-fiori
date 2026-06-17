// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol DownVoteActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: DownVoteActionConfiguration) -> Body
}

struct AnyDownVoteActionStyle: DownVoteActionStyle {
    let content: (DownVoteActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DownVoteActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DownVoteActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DownVoteActionConfiguration {
    public var componentIdentifier: String = "fiori_downvoteaction_component"
    public let downVoteAction: DownVoteAction

    public typealias DownVoteAction = ConfigurationViewWrapper
}

extension DownVoteActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
