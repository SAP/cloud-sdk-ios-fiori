import FioriThemeManager
import Foundation
import SwiftUI

// MARK: Macro generated

// public protocol TitleStyle: DynamicProperty {
//    associatedtype Body: View
//    func makeBody(_ configuration: TitleConfiguration) -> Body
// }

// public struct TitleConfiguration {
//    let title: Title
//
//    public typealias Title = ConfigurationViewWrapper
// }

// struct TitleStyleBox: TitleStyle {
//    let content: (TitleConfiguration) -> any View
//
//    init(@ViewBuilder _ content: @escaping (TitleConfiguration) -> any View) {
//        self.content = content
//    }
//
//    public func makeBody(_ configuration: TitleConfiguration) -> some View {
//        self.content(configuration).typeErased
//    }
// }

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

// MARK: SDK Developer implementations

// Base Layout style
public struct TitleBaseStyle: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        configuration.title
    }
}

// Default fiori styles
public struct TitleFioriStyle: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        Title(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.title)
    }
}
