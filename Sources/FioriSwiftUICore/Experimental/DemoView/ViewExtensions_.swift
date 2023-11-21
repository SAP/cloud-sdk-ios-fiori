import Foundation
import SwiftUI

// TODO: macro
extension View {
    func demoViewStyle(_ style: some DemoViewStyle) -> some View {
        self.transformEnvironment(\.demoViewStyleStack) { stack in
            stack.append(style)
        }
    }
}

// TODO: macro
public extension View {
    func newTitleStyle(_ style: some TitleStyle) -> some View {
        self.transformEnvironment(\.titleStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func newTitleStyle(@ViewBuilder content: @escaping (NewTitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.titleStyleStack) { stack in
            let style = AnyNewTitleStyle(content)
            stack.append(style)
        }
    }
}
