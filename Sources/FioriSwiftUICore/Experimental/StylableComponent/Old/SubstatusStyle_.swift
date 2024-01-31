// import FioriMacro
// import FioriThemeManager
// import Foundation
// import SwiftUI
//
// @ComponentStyle
// public protocol SubstatusStyle: DynamicProperty {}
//
// public extension SubstatusStyle where Self == SubstatusBaseStyle {
//    static var base: SubstatusBaseStyle {
//        SubstatusBaseStyle()
//    }
// }
//
// public extension SubstatusStyle where Self == SubstatusFioriStyle {
//    static var fiori: SubstatusFioriStyle {
//        SubstatusFioriStyle()
//    }
// }
//
//// MARK: SDK Developer implementations
//
//// Base Layout style
// public struct SubstatusBaseStyle: SubstatusStyle {
//    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
//        configuration.substatus
//    }
// }
//
//// Default fiori styles
// public struct SubstatusFioriStyle: SubstatusStyle {
//    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
//        Substatus(configuration)
//            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
//            .font(.fiori(forTextStyle: .subheadline))
//    }
// }
