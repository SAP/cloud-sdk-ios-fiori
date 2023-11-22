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
    func titleStyle(_ style: some TitleStyle) -> some View {
        self.transformEnvironment(\.titleStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.titleStyleStack) { stack in
            let style = AnyNewTitleStyle(content)
            stack.append(style)
        }
    }
}
