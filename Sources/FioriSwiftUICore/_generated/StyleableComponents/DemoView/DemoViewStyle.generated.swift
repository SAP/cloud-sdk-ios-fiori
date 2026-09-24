// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency protocol DemoViewStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: DemoViewConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_demoview_component"
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

extension DemoViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
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

struct DemoViewDefaultStyle: DemoViewStyle {
    nonisolated init() {}

    func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .demoViewStyle(DemoViewFioriStyle())
            .modifier(DemoViewStyleModifier(style: DemoViewBaseStyle()))
    }
}
