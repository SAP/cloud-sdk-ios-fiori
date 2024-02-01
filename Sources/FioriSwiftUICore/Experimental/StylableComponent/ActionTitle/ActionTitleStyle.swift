// import FioriThemeManager
//// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
//// DO NOT EDIT
// import Foundation
// import SwiftUI
//
// public protocol ActionTitleStyle: DynamicProperty {
//    associatedtype Body: View
//
//    func makeBody(_ configuration: ActionTitleConfiguration) -> Body
// }
//
// struct AnyActionTitleStyle: ActionTitleStyle {
//    let content: (ActionTitleConfiguration) -> any View
//
//    init(@ViewBuilder _ content: @escaping (ActionTitleConfiguration) -> any View) {
//        self.content = content
//    }
//
//    public func makeBody(_ configuration: ActionTitleConfiguration) -> some View {
//        self.content(configuration).typeErased
//    }
// }
//
// public struct ActionTitleConfiguration {
//    public let actionTitle: ActionTitle
//
//    public typealias ActionTitle = ConfigurationViewWrapper
// }
//
//// MARK: SDK Developer implementations
//
//// Base Layout style
// public struct ActionTitleBaseStyle: ActionTitleStyle {
//    public func makeBody(_ configuration: ActionTitleConfiguration) -> some View {
//        configuration.actionTitle
//    }
// }
//
//// Default fiori styles
// public struct ActionTitleFioriStyle: ActionTitleStyle {
//    public func makeBody(_ configuration: ActionTitleConfiguration) -> some View {
//        ActionTitle(configuration)
//            .foregroundStyle(Color.preferredColor(.tintColor))
//            .font(.fiori(forTextStyle: .callout))
//    }
// }
