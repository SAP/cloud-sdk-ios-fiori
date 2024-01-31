// import FioriMacro
// import FioriThemeManager
// import Foundation
// import SwiftUI
//
// @ComponentStyle
// public protocol TagsStyle: DynamicProperty {}
//
// public extension TagsStyle where Self == TagsBaseStyle {
//    static var base: TagsBaseStyle {
//        TagsBaseStyle()
//    }
// }
//
// public extension TagsStyle where Self == TagsFioriStyle {
//    static var fiori: TagsFioriStyle {
//        TagsFioriStyle()
//    }
// }
//
//// MARK: SDK Developer implementations
//
//// Base Layout style
// public struct TagsBaseStyle: TagsStyle {
//    public func makeBody(_ configuration: TagsConfiguration) -> some View {
//        configuration.tags
//    }
// }
//
//// Default fiori styles
// public struct TagsFioriStyle: TagsStyle {
//    public func makeBody(_ configuration: TagsConfiguration) -> some View {
//        Tags(configuration)
//    }
// }
