import Foundation
import SwiftUI

// TODO: macro
public protocol DemoViewStyle: DynamicProperty {
    associatedtype Body: View
    func makeBody(_ configuration: DemoViewConfiguration) -> Body
}

// TODO: macro
public struct DemoViewConfiguration {
    let title: Label
    let subtitle: Label
    let status: Label
    let actionTitle: Label
    let action: (() -> Void)?
    
    public struct Label: View {
        /// Check if this type-erased view is empty.
        ///
        /// There are two situations that will cause the view to become empty.
        ///
        /// 1. Pass `EmptyView` to view-builder arguments in the init.
        /// 2. Pass `nil` value to the data arguments in the init.
        public let isEmpty: Bool
        var label: any View
        
        init(_ label: some View) {
            self.isEmpty = label.isEmpty
            self.label = label
        }
        
        public var body: some View {
            label.typeErased
        }
    }
}

// MARK: Style implementations

/// The style that only defines the default layout of DemoView without providing any styling attributes.
public struct DemoViewBaseStyle: DemoViewStyle {
    @State var isPresented = true
    
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        VStack(spacing: 10) {
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

/// The style that provides styling attributes for this component (i.e. font, color, etc)
public struct DemoViewFioriStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .titleStyle {
                Title($0).modifier(NewTitleFioriStyleModifier())
            }
    }
}

public struct DemoViewNewTitleStyle: DemoViewStyle {
    let style: any TitleStyle
    
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

// MARK: Style extensions

// TODO: macro
public extension DemoViewStyle where Self == DemoViewBaseStyle {
    static var base: Self {
        DemoViewBaseStyle()
    }
}

// TODO: macro
public extension DemoViewStyle where Self == DemoViewFioriStyle {
    static var fiori: Self {
        DemoViewFioriStyle()
    }
}

extension DemoViewStyle where Self == DemoViewNewTitleStyle {
    static func newTitleStyle<Style: TitleStyle>(_ style: Style) -> DemoViewNewTitleStyle {
        DemoViewNewTitleStyle(style: style)
    }
    
    static func newTitleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> DemoViewNewTitleStyle {
        let style = AnyNewTitleStyle(content)
        return DemoViewNewTitleStyle(style: style)
    }
}

// SDK developer
extension DemoViewFioriStyle {
    struct NewTitleFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.title)
                .foregroundStyle(.blue)
        }
    }
}

// MARK: Modifier

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
