import FioriThemeManager
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
            .titleStyle(TitleFioriStyle())
            .subtitleStyle(SubtitleFioriStyle())
            .statusStyle(StatusFioriStyle())
            .newActionStyle(NewActionFioriStyle())
    }
}
    
// MARK: SDK Developer implementations

// Base Layout style
public struct DemoViewBaseStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        // Add default layout here
        VStack(spacing: 10) {
            configuration.title
            configuration.subtitle
            configuration.status
            configuration.newAction
            Toggle(isOn: configuration.$isOn, label: {})
        }
        .padding()
    }
}
    
// Default fiori styles
private extension DemoViewFioriStyle {
    struct TitleFioriStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
            // Add default style here
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
            // Add default style here
        }
    }

    struct StatusFioriStyle: StatusStyle {
        func makeBody(_ configuration: StatusConfiguration) -> some View {
            Status(configuration)
            // Add default style here
        }
    }

    struct NewActionFioriStyle: NewActionStyle {
        func makeBody(_ configuration: NewActionConfiguration) -> some View {
            NewAction(configuration)
            // Add default style here
        }
    }
}

/// Show contents in a scrollable horizontal stack
public struct DemoViewHorizontalStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        HStack(spacing: 10) {
            configuration.title
            configuration.subtitle
            configuration.status
            configuration.newAction
            Toggle(isOn: configuration.$isOn, label: {})
        }
        .padding()
    }
}

/// Card style
public struct DemoViewCardStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(.secondary)
            }
    }
}

public extension DemoViewStyle where Self == DemoViewHorizontalStyle {
    static var horizontal: Self {
        DemoViewHorizontalStyle()
    }
}

public extension DemoViewStyle where Self == DemoViewCardStyle {
    static var card: Self {
        DemoViewCardStyle()
    }
}
