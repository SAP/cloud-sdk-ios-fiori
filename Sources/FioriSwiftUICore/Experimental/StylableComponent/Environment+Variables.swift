import FioriMacro
import Foundation
import SwiftUI

@ComponentStyleEnvironmentValues
extension EnvironmentValues {
    private enum Style {
        case titleStyle
        case subtitleStyle
        case actionTitleStyle
        case footnoteStyle
        case descriptionStyle
        case statusStyle
        case substatusStyle
        case detailImageStyle
        case iconsStyle
    }
}

// TODO: macro
struct DemoViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any DemoViewStyle] = []
}

// TODO: macro
extension EnvironmentValues {
    var demoViewStyleStack: [any DemoViewStyle] {
        get { self[DemoViewStyleStackKey.self] }
        set { self[DemoViewStyleStackKey.self] = newValue }
    }
}

// TODO: macro
extension EnvironmentValues {
    var demoViewStyle: any DemoViewStyle {
        demoViewStyleStack.last ?? .base.concat(.fiori)
    }
}

// TODO: macro
// struct TitleStyleStackKey: EnvironmentKey {
//    static let defaultValue: [any TitleStyle] = []
// }

//// TODO: macro
// extension EnvironmentValues {
//    var titleStyleStack: [any TitleStyle] {
//        get { self[TitleStyleStackKey.self] }
//        set { self[TitleStyleStackKey.self] = newValue }
//    }
// }
//
//// TODO: macro
// extension EnvironmentValues {
//    var titleStyle: any TitleStyle {
//        titleStyleStack.last ?? .base
//    }
// }

// TODO: macro
// struct SubtitleStyleStackKey: EnvironmentKey {
//    static let defaultValue: [any SubtitleStyle] = []
// }

// TODO: macro
// extension EnvironmentValues {
//    var subtitleStyleStack: [any SubtitleStyle] {
//        get { self[SubtitleStyleStackKey.self] }
//        set { self[SubtitleStyleStackKey.self] = newValue }
//    }
// }
//
//// TODO: macro
// extension EnvironmentValues {
//    var subtitleStyle: any SubtitleStyle {
//        subtitleStyleStack.last ?? .base
//    }
// }

// TODO: macro
// struct ActionTitleStyleStackKey: EnvironmentKey {
//    static let defaultValue: [any ActionTitleStyle] = []
// }

// TODO: macro
// extension EnvironmentValues {
//    var actionTitleStyleStack: [any ActionTitleStyle] {
//        get { self[ActionTitleStyleStackKey.self] }
//        set { self[ActionTitleStyleStackKey.self] = newValue }
//    }
// }
//
//// TODO: macro
// extension EnvironmentValues {
//    var actionTitleStyle: any ActionTitleStyle {
//        actionTitleStyleStack.last ?? .base
//    }
// }
