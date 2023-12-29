import FioriMacro
import Foundation
import SwiftUI

public extension View {
    #StyleModifierViewExtension(["TitleStyle"])
    #StyleModifierViewExtension(["SubtitleStyle"])
    #StyleModifierViewExtension(["FootnoteStyle"])
    #StyleModifierViewExtension(["ActionTitleStyle"])
    #StyleModifierViewExtension(["DescriptionStyle"])
    #StyleModifierViewExtension(["StatusStyle"])
    #StyleModifierViewExtension(["SubstatusStyle"])
    #StyleModifierViewExtension(["DetailImageStyle"])
    #StyleModifierViewExtension(["IconsStyle"])
    #StyleModifierViewExtension(["DemoViewStyle"])
}

// extension View {
//    func demoViewStyle(_ style: some DemoViewStyle) -> some View {
//        self.transformEnvironment(\.demoViewStyleStack) { stack in
//            stack.append(style)
//        }
//    }
//
//    func demoViewStyle(@ViewBuilder content: @escaping (DemoViewConfiguration) -> some View) -> some View {
//        self.transformEnvironment(\.demoViewStyleStack) { stack in
//            let style = AnyDemoViewStyle(content)
//            stack.append(style)
//        }
//    }
// }

// TODO: macro
// public extension View {
//    func titleStyle(_ style: some TitleStyle) -> some View {
//        self.transformEnvironment(\.titleStyleStack) { stack in
//            stack.append(style)
//        }
//    }
//
//    func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> some View {
//        self.transformEnvironment(\.titleStyleStack) { stack in
//            let style = AnyTitleStyle(content)
//            stack.append(style)
//        }
//    }
// }

// TODO: macro
// public extension View {
//    func subtitleStyle(_ style: some SubtitleStyle) -> some View {
//        self.transformEnvironment(\.subtitleStyleStack) { stack in
//            stack.append(style)
//        }
//    }
//
//    func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> some View {
//        self.transformEnvironment(\.subtitleStyleStack) { stack in
//            let style = AnySubtitleStyle(content)
//            stack.append(style)
//        }
//    }
// }

// TODO: macro
// public extension View {
//    func actionTitleStyle(_ style: some ActionTitleStyle) -> some View {
//        self.transformEnvironment(\.actionTitleStyleStack) { stack in
//            stack.append(style)
//        }
//    }
//
//    func actionTitleStyle(@ViewBuilder content: @escaping (ActionTitleConfiguration) -> some View) -> some View {
//        self.transformEnvironment(\.actionTitleStyleStack) { stack in
//            let style = AnyActionTitleStyle(content)
//            stack.append(style)
//        }
//    }
// }

// TODO: macro
// public extension View {
//    func footnoteStyle(_ style: some FootnoteStyle) -> some View {
//        self.transformEnvironment(\.footnoteStyleStack) { stack in
//            stack.append(style)
//        }
//    }
//
//    func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> some View {
//        self.transformEnvironment(\.footnoteStyleStack) { stack in
//            let style = AnyFootnoteStyle(content)
//            stack.append(style)
//        }
//    }
// }
