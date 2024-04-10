// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

protocol DemoViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DemoViewConfiguration) -> Body
}

struct AnyDemoViewStyle: DemoViewStyle {
    let content: (DemoViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DemoViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

struct DemoViewConfiguration {
    public let title: Title
    public let subtitle: Subtitle
    public let status: Status
    public let action: Action
    @Binding public var isOn: Bool

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Status = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
}

struct DemoViewFioriStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .titleStyle(TitleFioriStyle(demoViewConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(demoViewConfiguration: configuration))
            .statusStyle(StatusFioriStyle(demoViewConfiguration: configuration))
            .actionStyle(ActionFioriStyle(demoViewConfiguration: configuration))
            .switchStyle(SwitchFioriStyle(demoViewConfiguration: configuration))
    }
}
