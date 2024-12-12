// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriDemoView_content"
    public let titleIdentifier = "FioriDemoView_title"
    public let subtitleIdentifier = "FioriDemoView_subtitle"
    public let statusIdentifier = "FioriDemoView_status"
    public let actionIdentifier = "FioriDemoView_action"
    public let switchIdentifier = "FioriDemoView_switch"

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

struct DemoViewNSSStyle: DemoViewStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .titleStyle(TitleNSSStyle(demoViewConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(demoViewConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .statusStyle(StatusNSSStyle(demoViewConfiguration: configuration, nssData: self.data.value(configuration.statusIdentifier)))
            .actionStyle(ActionNSSStyle(demoViewConfiguration: configuration, nssData: self.data.value(configuration.actionIdentifier)))
            .switchStyle(SwitchNSSStyle(demoViewConfiguration: configuration, nssData: self.data.value(configuration.switchIdentifier)))
            .demoViewStyle(ContentNSSStyle(demoViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
