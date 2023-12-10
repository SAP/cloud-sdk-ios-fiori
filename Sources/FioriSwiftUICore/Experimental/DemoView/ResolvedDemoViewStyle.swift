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

struct ResolvedNewActionStyle<Style: NewActionStyle>: View {
    let style: Style
    let configuration: NewActionConfiguration
    
    var body: some View {
        style.makeBody(configuration)
    }
}

extension NewActionStyle {
    func resolve(configuration: NewActionConfiguration) -> some View {
        ResolvedNewActionStyle(style: self, configuration: configuration)
    }
}

struct ResolvedTitleStyle<Style: TitleStyle>: View {
    let style: Style
    let configuration: TitleConfiguration
    
    var body: some View {
        style.makeBody(configuration)
    }
}

extension TitleStyle {
    func resolve(configuration: TitleConfiguration) -> some View {
        ResolvedTitleStyle(style: self, configuration: configuration)
    }
}

struct ResolvedActionTitleStyle<Style: ActionTitleStyle>: View {
    let style: Style
    let configuration: ActionTitleConfiguration
    
    var body: some View {
        style.makeBody(configuration)
    }
}

extension ActionTitleStyle {
    func resolve(configuration: ActionTitleConfiguration) -> some View {
        ResolvedActionTitleStyle(style: self, configuration: configuration)
    }
}
