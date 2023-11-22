// import Foundation
// import SwiftUI
//
// public struct Action<_ActionTitle: View>: _ActionComponent {
//    var actionTitle: _ActionTitle
//    var action: (() -> Void)?
//
//    @Environment(\.actionViewStyle) var style
//
//    init(actionTitle: () -> _ActionTitle, action: (@escaping () -> Void)? = nil) {
//        self.actionTitle = actionTitle()
//        self.action = action
//    }
// }
//
// extension Action: View {
//    public var body: some View {
//        primaryButton
//            .buttonStyle(MyButtonStyle())
//    }
// }
//
// struct MyButtonStyle: PrimitiveButtonStyle {
////    let actionViewStyle: any ActionViewStyle
//    @Environment(\.actionViewStyle) var style
//
//    func makeBody(configuration: Configuration) -> some View {
//        style.makeBody(configuration).typeErased
//            .transformEnvironment(\.actionViewStyleStack) { stack in
//                if stack.isEmpty {
//                    return
//                }
//                stack.removeLast()
//            }
//    }
// }
//
//// TODO: macro
// public protocol ActionViewStyle: DynamicProperty {
//    associatedtype Body: View
//    func makeBody(_ configuration: PrimitiveButtonStyleConfiguration) -> Body
// }
//
//// TODO: macro
// public struct ActionViewConfiguration {
//    let actionTitle: ActionTitle
//
//    public struct ActionTitle: View {
//        /// Check if this type-erased view is empty.
//        ///
//        /// There are two situations that will cause the view to become empty.
//        ///
//        /// 1. Pass `EmptyView` to view-builder arguments in the init.
//        /// 2. Pass `nil` value to the data arguments in the init.
//        public let isEmpty: Bool
//        var title: any View
//
//        init(_ title: some View) {
//            self.isEmpty = title.isEmpty
//            self.title = title
//        }
//
//        public var body: some View {
//            title.typeErased
//        }
//    }
// }
//
//// MARK: Style implementations
//
//// TODO: macro
//// Layout style
// public struct ActionViewBaseStyle: ActionViewStyle {
//    public func makeBody(_ configuration: PrimitiveButtonStyleConfiguration) -> some View {
//        configuration.label
//            .onTapGesture {
//                configuration.trigger()
//            }
//    }
// }
//
//// TODO: macro
// struct ActionViewStyleStackKey: EnvironmentKey {
//    static let defaultValue: [any ActionViewStyle] = []
// }
//
//// TODO: macro
// extension EnvironmentValues {
//    var actionViewStyleStack: [any ActionViewStyle] {
//        get { self[ActionViewStyleStackKey.self] }
//        set { self[ActionViewStyleStackKey.self] = newValue }
//    }
// }
//
//// TODO: macro
// extension EnvironmentValues {
//    var actionViewStyle: any ActionViewStyle {
//        actionViewStyleStack.last ?? .base
//    }
// }
//
// extension ActionViewStyle where Self == ActionViewBaseStyle {
//    static var base: ActionViewBaseStyle {
//        ActionViewBaseStyle()
//    }
// }
//
// #Preview(body: {
//    Action(primaryButton: Button(action: {
//        print("tapped")
//    }, label: {
//        Text("Button12")
//            .foregroundStyle(.red)
//    }))
// })
//
////struct _Preview: PreviewProvider {
////    static var previews: some View {
////        ActionView(primaryButton: Button(action: {
////            print("tapped")
////        }, label: {
////            Text("Button")
////        }))
////    }
////}
