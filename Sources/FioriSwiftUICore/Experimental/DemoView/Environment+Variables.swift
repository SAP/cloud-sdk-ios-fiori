import Foundation
import SwiftUI

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
struct TitleStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TitleStyle] = []
}

// TODO: macro
extension EnvironmentValues {
    var titleStyleStack: [any TitleStyle] {
        get { self[TitleStyleStackKey.self] }
        set { self[TitleStyleStackKey.self] = newValue }
    }
}

// TODO: macro
extension EnvironmentValues {
    var titleStyle: any TitleStyle {
        titleStyleStack.last ?? .base
    }
}
