import Foundation
import SwiftUI

struct ResolvedDemoViewStyle<Style: DemoViewStyle>: View {
    let style: Style
    let configuration: DemoViewConfiguration
    
    var body: some View {
        style.makeBody(configuration)
    }
}

extension DemoViewStyle {
    func resolve(configuration: DemoViewConfiguration) -> some View {
        ResolvedDemoViewStyle(style: self, configuration: configuration)
    }
}

struct ResolvedNewTitleStyle<Style: NewTitleStyle>: View {
    let style: Style
    let configuration: NewTitleConfiguration
    
    var body: some View {
        style.makeBody(configuration)
    }
}

extension NewTitleStyle {
    func resolve(configuration: NewTitleConfiguration) -> some View {
        ResolvedNewTitleStyle(style: self, configuration: configuration)
    }
}
