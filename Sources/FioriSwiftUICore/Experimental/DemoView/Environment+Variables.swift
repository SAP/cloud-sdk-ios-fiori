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
struct NewTitleStyleStackKey: EnvironmentKey {
    static let defaultValue: [any NewTitleStyle] = []
}

// TODO: macro
extension EnvironmentValues {
    var newTitleStyleStack: [any NewTitleStyle] {
        get { self[NewTitleStyleStackKey.self] }
        set { self[NewTitleStyleStackKey.self] = newValue }
    }
}

// TODO: macro
extension EnvironmentValues {
    var newTitleStyle: any NewTitleStyle {
        newTitleStyleStack.last ?? .base
    }
}
