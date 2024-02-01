import FioriThemeManager
// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol NewActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: NewActionConfiguration) -> Body
}

struct AnyNewActionStyle: NewActionStyle {
    let content: (NewActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (NewActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct NewActionConfiguration {
    public let newAction: NewAction

    public typealias NewAction = ConfigurationViewWrapper
}

// MARK: SDK Developer implementations

// Base Layout style
public struct NewActionBaseStyle: NewActionStyle {
    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        // Add default layout here
        configuration.newAction
    }
}

// Default fiori styles
public struct NewActionFioriStyle: NewActionStyle {
    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        NewAction(configuration)
        // Add default style here
    }
}
