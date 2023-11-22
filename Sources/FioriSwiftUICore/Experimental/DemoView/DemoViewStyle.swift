import Foundation
import SwiftUI

// MARK: Macro generated

public protocol DemoViewStyle: DynamicProperty {
    associatedtype Body: View
    func makeBody(_ configuration: DemoViewConfiguration) -> Body
}

public struct DemoViewConfiguration {
    let title: Title
    let subtitle: Subtitle
    let status: Status
    let actionTitle: ActionTitle
    let action: (() -> Void)?
    
    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Status = ConfigurationViewWrapper
    public typealias ActionTitle = ConfigurationViewWrapper
}

/// The style that provides styling attributes for this component (i.e. font, color, etc)
public struct DemoViewFioriStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .titleStyle {
                Title($0).modifier(TitleFioriStyleModifier())
            }
        // .subtitleStyle()
        // ...
    }
}

public struct DemoViewTitleStyle: DemoViewStyle {
    let style: any TitleStyle
    
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public struct DemoViewActionStyle: DemoViewStyle {
    let style: any ButtonStyle
    
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .buttonStyle(self.style)
            .typeErased
    }
}

public extension DemoViewStyle where Self == DemoViewBaseStyle {
    static var base: Self {
        DemoViewBaseStyle()
    }
}

public extension DemoViewStyle where Self == DemoViewFioriStyle {
    static var fiori: Self {
        DemoViewFioriStyle()
    }
}

extension DemoViewStyle where Self == DemoViewTitleStyle {
    static func titleStyle<Style: TitleStyle>(_ style: Style) -> DemoViewTitleStyle {
        DemoViewTitleStyle(style: style)
    }
    
    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> DemoViewTitleStyle {
        let style = AnyNewTitleStyle(content)
        return DemoViewTitleStyle(style: style)
    }
}

// Modifier

public struct DemoViewStyleModifier<Style: DemoViewStyle>: ViewModifier {
    let style: Style
    
    public func body(content: Content) -> some View {
        content
            .demoViewStyle(self.style)
    }
}

extension DemoViewStyle {
    // Modify the current style.
    func modifier(_ modifier: some ViewModifier) -> some DemoViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }
    
    // Concatenate a new style on current style. The current style is the base style so it will take the precedence.
    func concat(_ style: some DemoViewStyle) -> some DemoViewStyle {
        style.modifier(DemoViewStyleModifier(style: self))
    }
}

// MARK: Style implementations by SDK developers

/// The style that only defines the default layout of DemoView without providing any styling attributes.
public struct DemoViewBaseStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        VStack(spacing: 10) {
            configuration.title
            configuration.subtitle
            configuration.status
            Button(action: configuration.action ?? {}, label: {
                configuration.actionTitle
            })
        }
        .padding()
    }
}

/// Define default fiori styles for each sub-component in DemoView
extension DemoViewFioriStyle {
    struct TitleFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
//                .font(.title)
//                .foregroundStyle(.blue)
        }
    }
    
    struct SubTitleFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
        }
    }
    
    // ...
}

/// Show contents in a scrollable horizontal stack
public struct DemoViewHorizontalStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        ScrollView {
            HStack(spacing: 10) {
                configuration.title
                configuration.subtitle
                configuration.status
                if !configuration.actionTitle.isEmpty {
                    Button(action: configuration.action ?? {}, label: {
                        configuration.actionTitle
                    })
                }
            }
            .padding()
        }
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