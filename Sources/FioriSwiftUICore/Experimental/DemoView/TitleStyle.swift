import Foundation
import SwiftUI

// TODO: macro
public protocol TitleStyle: DynamicProperty {
    associatedtype Body: View
    func makeBody(_ configuration: TitleConfiguration) -> Body
}

// TODO: macro
public struct TitleConfiguration {
    let title: Title
    
    public typealias Title = ConfigurationViewWrapper
}

// MARK: Style implementations

// TODO: macro
// Layout style
public struct TitleBaseStyle: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        configuration.title
    }
}

// For SDK developer to implement default fiori styles
public struct TitleFioriStyle: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        Title(configuration)
            .foregroundStyle(.red)
            .font(.title)
    }
}

public struct AnyNewTitleStyle: TitleStyle {
    let content: (TitleConfiguration) -> any View
    
    init(@ViewBuilder _ content: @escaping (TitleConfiguration) -> any View) {
        self.content = content
    }
    
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

// MARK: Style extensions

extension TitleStyle where Self == TitleBaseStyle {
    static var base: TitleBaseStyle {
        TitleBaseStyle()
    }
}

extension TitleStyle where Self == TitleFioriStyle {
    static var fiori: some TitleStyle {
        TitleFioriStyle()
    }
}
