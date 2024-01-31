import FioriThemeManager
// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SubstatusStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SubstatusConfiguration) -> Body
}

struct AnySubstatusStyle: SubstatusStyle {
    let content: (SubstatusConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SubstatusConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SubstatusConfiguration {
    public let substatus: Substatus
	
    public typealias Substatus = ConfigurationViewWrapper
}

// MARK: SDK Developer implementations

// Base Layout style
public struct SubstatusBaseStyle: SubstatusStyle {
    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
        configuration.substatus
    }
}

// Default fiori styles
public struct SubstatusFioriStyle: SubstatusStyle {
    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
        Substatus(configuration)
            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            .font(.fiori(forTextStyle: .subheadline))
    }
}
