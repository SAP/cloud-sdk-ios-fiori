// import FioriMacro
// import FioriThemeManager
// import Foundation
// import SwiftUI
//
// @ComponentStyle
// public protocol FootnoteIconsStyle: DynamicProperty {}
//
// public extension FootnoteIconsStyle where Self == FootnoteIconsBaseStyle {
//    static var base: FootnoteIconsBaseStyle {
//        FootnoteIconsBaseStyle()
//    }
// }
//
// public extension FootnoteIconsStyle where Self == FootnoteIconsFioriStyle {
//    static var fiori: FootnoteIconsFioriStyle {
//        FootnoteIconsFioriStyle()
//    }
// }
//
//// MARK: SDK Developer implementations
//
//// Base Layout style
// public struct FootnoteIconsBaseStyle: FootnoteIconsStyle {
//    public func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
//        configuration.footnoteIcons
//    }
// }
//
//// Default fiori styles
// public struct FootnoteIconsFioriStyle: FootnoteIconsStyle {
//    public func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
//        FootnoteIcons(configuration)
//    }
// }
