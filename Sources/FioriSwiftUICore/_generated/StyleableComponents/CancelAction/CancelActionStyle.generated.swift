// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public var componentIdentifier: String = "fiori_cancelaction_component"
    public let cancelAction: CancelAction

    public typealias CancelAction = ConfigurationViewWrapper
}

public extension CancelActionConfiguration {
    var cancelActionIdentifier: String {
        self.componentIdentifier + "_cancelAction"
    }
}

extension CancelActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
