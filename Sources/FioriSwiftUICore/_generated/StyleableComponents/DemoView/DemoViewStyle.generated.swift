// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DemoViewStyle: DynamicProperty {
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
    
public struct DemoViewConfiguration {
    public let title: Title
    public let subtitle: Subtitle
    public let status: Status
    public let newAction: NewAction
    @Binding public var isOn: Bool

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Status = ConfigurationViewWrapper
    public typealias NewAction = ConfigurationViewWrapper
}
    
public struct DemoViewFioriStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .newActionStyle(NewActionFioriStyle())
            .statusStyle(StatusFioriStyle())
            .subtitleStyle(SubtitleFioriStyle())
            .switchStyle(SwitchFioriStyle())
            .titleStyle(TitleFioriStyle())
    }
}
