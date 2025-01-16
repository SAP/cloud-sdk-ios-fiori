// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol MandatoryFieldIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> Body
}

struct AnyMandatoryFieldIndicatorStyle: MandatoryFieldIndicatorStyle {
    let content: (MandatoryFieldIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (MandatoryFieldIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct MandatoryFieldIndicatorConfiguration {
    public var componentIdentifier: String = "fiori_mandatoryfieldindicator_component"
    public let mandatoryFieldIndicator: MandatoryFieldIndicator

    public typealias MandatoryFieldIndicator = ConfigurationViewWrapper
}

public extension MandatoryFieldIndicatorConfiguration {
    var mandatoryFieldIndicatorIdentifier: String {
        self.componentIdentifier + "_mandatoryFieldIndicator"
    }
}

extension MandatoryFieldIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
