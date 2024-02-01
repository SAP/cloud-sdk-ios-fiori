//// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
//// DO NOT EDIT
// import Foundation
// import SwiftUI
//
// public struct ActionTitle {
//    let actionTitle: any View
//
//    @Environment(\.actionTitleStyle) var style
//
//    fileprivate var _shouldApplyDefaultStyle = true
//
//    public init(@ViewBuilder actionTitle: () -> any View = { EmptyView() }) {
//        self.actionTitle = actionTitle()
//    }
// }
//
// public extension ActionTitle {
//    init(actionTitle: AttributedString? = nil) {
//        self.init(actionTitle: { OptionalText(actionTitle) })
//    }
// }
//
// public extension ActionTitle {
//    init(_ configuration: ActionTitleConfiguration) {
//        self.actionTitle = configuration.actionTitle
//        self._shouldApplyDefaultStyle = false
//    }
// }
//
// extension ActionTitle: View {
//    public var body: some View {
//        if _shouldApplyDefaultStyle {
//            self.defaultStyle()
//        } else {
//            style.resolve(configuration: .init(actionTitle: .init(self.actionTitle))).typeErased
//                .transformEnvironment(\.actionTitleStyleStack) { stack in
//                    if !stack.isEmpty {
//                        stack.removeLast()
//                    }
//                }
//        }
//    }
// }
//
// private extension ActionTitle {
//    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
//        var s = self
//        s._shouldApplyDefaultStyle = bool
//        return s
//    }
//
//    func defaultStyle() -> some View {
//        ActionTitle(actionTitle: { self.actionTitle })
//            .shouldApplyDefaultStyle(false)
//            .actionTitleStyle(.fiori)
//    }
// }
