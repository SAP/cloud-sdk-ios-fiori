// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CancelActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CancelActionConfiguration) -> Body
}

struct AnyCancelActionStyle: CancelActionStyle {
    let content: (CancelActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CancelActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CancelActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CancelActionConfiguration {
    public let cancelAction: CancelAction

    public typealias CancelAction = ConfigurationViewWrapper
}
