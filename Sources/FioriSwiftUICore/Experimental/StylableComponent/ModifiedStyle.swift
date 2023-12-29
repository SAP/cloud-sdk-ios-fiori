import FioriMacro
import Foundation
import SwiftUI

public struct ModifiedStyle<Style, Modifier: ViewModifier>: DynamicProperty {
    var style: Style
    var modifier: Modifier
}

extension ModifiedStyle: DemoViewStyle where Style: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .demoViewStyle(self.style)
            .modifier(self.modifier)
    }
}

extension ModifiedStyle: ActionTitleStyle where Style: ActionTitleStyle {
    public func makeBody(_ configuration: ActionTitleConfiguration) -> some View {
        ActionTitle(configuration)
            .actionTitleStyle(self.style)
            .modifier(self.modifier)
    }
}

extension ModifiedStyle: TitleStyle where Style: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        Title(configuration)
            .titleStyle(self.style)
            .modifier(self.modifier)
    }
}

extension ModifiedStyle: SubtitleStyle where Style: SubtitleStyle {
    public func makeBody(_ configuration: SubtitleConfiguration) -> some View {
        Subtitle(configuration)
            .subtitleStyle(self.style)
            .modifier(self.modifier)
    }
}

extension ModifiedStyle: FootnoteStyle where Style: FootnoteStyle {
    public func makeBody(_ configuration: FootnoteConfiguration) -> some View {
        Footnote(configuration)
            .footnoteStyle(self.style)
            .modifier(self.modifier)
    }
}

extension ModifiedStyle: DescriptionStyle where Style: DescriptionStyle {
    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        Description(configuration)
            .descriptionStyle(self.style)
            .modifier(self.modifier)
    }
}

extension ModifiedStyle: StatusStyle where Style: StatusStyle {
    public func makeBody(_ configuration: StatusConfiguration) -> some View {
        Status(configuration)
            .statusStyle(self.style)
            .modifier(self.modifier)
    }
}

extension ModifiedStyle: SubstatusStyle where Style: SubstatusStyle {
    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
        Substatus(configuration)
            .substatusStyle(self.style)
            .modifier(self.modifier)
    }
}

extension ModifiedStyle: DetailImageStyle where Style: DetailImageStyle {
    public func makeBody(_ configuration: DetailImageConfiguration) -> some View {
        DetailImage(configuration)
            .detailImageStyle(self.style)
            .modifier(self.modifier)
    }
}

extension ModifiedStyle: IconsStyle where Style: IconsStyle {
    public func makeBody(_ configuration: IconsConfiguration) -> some View {
        Icons(configuration)
            .iconsStyle(self.style)
            .modifier(self.modifier)
    }
}
