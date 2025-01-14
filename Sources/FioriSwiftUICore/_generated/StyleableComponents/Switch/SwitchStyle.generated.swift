// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SwitchStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SwitchConfiguration) -> Body
}

struct AnySwitchStyle: SwitchStyle {
    let content: (SwitchConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SwitchConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SwitchConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SwitchConfiguration {
    public let switchIdentifier = "FioriSwitch_content"

    public var componentIdentifier: String = "fiori_switch_component"
    @Binding public var isOn: Bool
}

extension SwitchConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
