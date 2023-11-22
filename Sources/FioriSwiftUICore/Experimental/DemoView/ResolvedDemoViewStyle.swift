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

struct ResolvedNewTitleStyle<Style: TitleStyle>: View {
    let style: Style
    let configuration: TitleConfiguration
    
    var body: some View {
        style.makeBody(configuration)
    }
}

extension TitleStyle {
    func resolve(configuration: TitleConfiguration) -> some View {
        ResolvedNewTitleStyle(style: self, configuration: configuration)
    }
}
