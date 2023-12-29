import Foundation
import SwiftUI

// public protocol FioriStyle {
//    associatedtype Body: View
//    associatedtype Configuration
//    func makeBody(_ configuration: Configuration) -> Body
// }
//
// public protocol FioriStyleConfiguration {}
//
// public protocol DefaultFioriStyle: FioriStyle {
//    init()
// }
//
// protocol StyleableView: View {
//    associatedtype DefaultStyle: DefaultFioriStyle
//
//    var style: any FioriStyle { get }
//    var configuration: FioriStyleConfiguration { get }
//    var styleStackKeyPath: WritableKeyPath<EnvironmentValues, [any FioriStyle]> { get }
//    var _shouldApplyDefaultStyle: Bool { get set }
//
//    func copy(_ self: Self) -> Self
// }
//
// extension StyleableView {
//    func withDefaultStyle() -> some View {
//        self
//            .copy(self)
//            .shouldApplyDefaultStyle(false)
//            .transformEnvironment(styleStackKeyPath) { stack in
//                stack.append(DefaultStyle())
//            }
//    }
//
//    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
//        var s = self
//        s._shouldApplyDefaultStyle = bool
//        return s
//    }
// }
//
// extension StyleableView {
//    @ViewBuilder
//    var body: some View {
//        if _shouldApplyDefaultStyle {
//            self
//                .withDefaultStyle()
//        } else {
//            style.makeBody(configuration).typeErased
//                .transformEnvironment(styleStackKeyPath) { stack in
//                    if !stack.isEmpty {
//                        stack.removeLast()
//                    }
//                }
//        }
//    }
// }
