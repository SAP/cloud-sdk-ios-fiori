// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol LinearProgressIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> Body
}

struct AnyLinearProgressIndicatorStyle: LinearProgressIndicatorStyle {
    let content: (LinearProgressIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (LinearProgressIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct LinearProgressIndicatorConfiguration {
    public var componentIdentifier: String = "fiori_linearprogressindicator_component"
    @Binding public var indicatorProgress: Double
}

public extension LinearProgressIndicatorConfiguration {
    var linearProgressIndicatorIdentifier: String {
        self.componentIdentifier + "_content"
    }
}

extension LinearProgressIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
