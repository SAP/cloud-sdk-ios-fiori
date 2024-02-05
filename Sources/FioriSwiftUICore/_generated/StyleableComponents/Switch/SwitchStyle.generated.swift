// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    @Binding public var isOn: Bool
}
