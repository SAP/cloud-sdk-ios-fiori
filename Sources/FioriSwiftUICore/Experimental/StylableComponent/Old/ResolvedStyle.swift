import Foundation
import SwiftUI

// struct ResolvedNewObjectItemStyle<Style: NewObjectItemStyle>: View {
//    let style: Style
//    let configuration: NewObjectItemConfiguration
//
//    var body: some View {
//        style.makeBody(configuration)
//    }
// }
//
// extension NewObjectItemStyle {
//    func resolve(configuration: NewObjectItemConfiguration) -> some View {
//        ResolvedNewObjectItemStyle(style: self, configuration: configuration)
//    }
// }

// struct ResolvedDemoViewStyle<Style: DemoViewStyle>: View {
//    let style: Style
//    let configuration: DemoViewConfiguration
//
//    var body: some View {
//        style.makeBody(configuration)
//    }
// }
//
// extension DemoViewStyle {
//    func resolve(configuration: DemoViewConfiguration) -> some View {
//        ResolvedDemoViewStyle(style: self, configuration: configuration)
//    }
// }

// struct ResolvedNewActionStyle<Style: NewActionStyle>: View {
//    let style: Style
//    let configuration: NewActionConfiguration
//
//    var body: some View {
//        style.makeBody(configuration)
//    }
// }
//
// extension NewActionStyle {
//    func resolve(configuration: NewActionConfiguration) -> some View {
//        ResolvedNewActionStyle(style: self, configuration: configuration)
//    }
// }

// struct ResolvedTitleStyle<Style: TitleStyle>: View {
//    let style: Style
//    let configuration: TitleConfiguration
//
//    var body: some View {
//        style.makeBody(configuration)
//    }
// }

// Bug: methods added by extension macro is not visible to other files.
// extension TitleStyle {
//    func resolve(configuration: TitleConfiguration) -> some View {
//        ResolvedTitleStyle(style: self, configuration: configuration)
//    }
// }

// struct ResolvedActionTitleStyle<Style: ActionTitleStyle>: View {
//    let style: Style
//    let configuration: ActionTitleConfiguration
//
//    var body: some View {
//        style.makeBody(configuration)
//    }
// }

// extension ActionTitleStyle {
//    func resolve(configuration: ActionTitleConfiguration) -> some View {
//        ResolvedActionTitleStyle(style: self, configuration: configuration)
//    }
// }

// struct ResolvedSubtitleStyle<Style: SubtitleStyle>: View {
//    let style: Style
//    let configuration: SubtitleConfiguration
//
//    var body: some View {
//        style.makeBody(configuration)
//    }
// }

// extension SubtitleStyle {
//    func resolve(configuration: SubtitleConfiguration) -> some View {
//        ResolvedSubtitleStyle(style: self, configuration: configuration)
//    }
// }
//
// extension FootnoteStyle {
//    func resolve(configuration: FootnoteConfiguration) -> some View {
//        ResolvedFootnoteStyle(style: self, configuration: configuration)
//    }
// }
//
// extension DescriptionStyle {
//    func resolve(configuration: DescriptionConfiguration) -> some View {
//        ResolvedDescriptionStyle(style: self, configuration: configuration)
//    }
// }
//
// extension StatusStyle {
//    func resolve(configuration: StatusConfiguration) -> some View {
//        ResolvedStatusStyle(style: self, configuration: configuration)
//    }
// }
//
// extension SubstatusStyle {
//    func resolve(configuration: SubstatusConfiguration) -> some View {
//        ResolvedSubstatusStyle(style: self, configuration: configuration)
//    }
// }
//
// extension DetailImageStyle {
//    func resolve(configuration: DetailImageConfiguration) -> some View {
//        ResolvedDetailImageStyle(style: self, configuration: configuration)
//    }
// }
//
// extension IconsStyle {
//    func resolve(configuration: IconsConfiguration) -> some View {
//        ResolvedIconsStyle(style: self, configuration: configuration)
//    }
// }
//
// extension TagsStyle {
//    func resolve(configuration: TagsConfiguration) -> some View {
//        ResolvedTagsStyle(style: self, configuration: configuration)
//    }
// }
//
// extension FootnoteIconsStyle {
//    func resolve(configuration: FootnoteIconsConfiguration) -> some View {
//        ResolvedFootnoteIconsStyle(style: self, configuration: configuration)
//    }
// }
//
// extension AvatarsStyle {
//    func resolve(configuration: AvatarsConfiguration) -> some View {
//        ResolvedAvatarsStyle(style: self, configuration: configuration)
//    }
// }
