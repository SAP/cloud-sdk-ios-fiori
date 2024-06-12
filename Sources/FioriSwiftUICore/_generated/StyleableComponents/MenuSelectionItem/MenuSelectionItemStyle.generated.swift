// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol MenuSelectionItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: MenuSelectionItemConfiguration) -> Body
}

struct AnyMenuSelectionItemStyle: MenuSelectionItemStyle {
    let content: (MenuSelectionItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (MenuSelectionItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct MenuSelectionItemConfiguration {
    public let icon: Icon
    public let title: Title
    public let action: (() -> Void)?

    public typealias Icon = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
}

public struct MenuSelectionItemFioriStyle: MenuSelectionItemStyle {
    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        MenuSelectionItem(configuration)
            .iconStyle(IconFioriStyle(menuSelectionItemConfiguration: configuration))
            .titleStyle(TitleFioriStyle(menuSelectionItemConfiguration: configuration))
    }
}
