// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SwitchViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SwitchViewConfiguration) -> Body
}

struct AnySwitchViewStyle: SwitchViewStyle {
    let content: (SwitchViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SwitchViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SwitchViewConfiguration {
    public let contentIdentifier = "FioriSwitchView_content"
    public let titleIdentifier = "FioriSwitchView_title"
    public let switchIdentifier = "FioriSwitchView_switch"

    public let title: Title
    @Binding public var isOn: Bool

    public typealias Title = ConfigurationViewWrapper
}

public struct SwitchViewFioriStyle: SwitchViewStyle {
    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        SwitchView(configuration)
            .titleStyle(TitleFioriStyle(switchViewConfiguration: configuration))
            .switchStyle(SwitchFioriStyle(switchViewConfiguration: configuration))
    }
}

public struct SwitchViewNSSStyle: SwitchViewStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        SwitchView(configuration)
            .titleStyle(TitleNSSStyle(switchViewConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .switchStyle(SwitchNSSStyle(switchViewConfiguration: configuration, nssData: self.data.value(configuration.switchIdentifier)))
            .switchViewStyle(ContentNSSStyle(switchViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
