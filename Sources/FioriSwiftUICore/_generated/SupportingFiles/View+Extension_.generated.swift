// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: AvatarsStyle

public extension View {
    func avatarsStyle(_ style: some AvatarsStyle) -> some View {
        self.transformEnvironment(\.avatarsStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func avatarsStyle(@ViewBuilder content: @escaping (AvatarsConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.avatarsStyleStack) { stack in
            let style = AnyAvatarsStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DemoViewStyle

public extension View {
    func demoViewStyle(_ style: some DemoViewStyle) -> some View {
        self.transformEnvironment(\.demoViewStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func demoViewStyle(@ViewBuilder content: @escaping (DemoViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.demoViewStyleStack) { stack in
            let style = AnyDemoViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DescriptionStyle

public extension View {
    func descriptionStyle(_ style: some DescriptionStyle) -> some View {
        self.transformEnvironment(\.descriptionStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.descriptionStyleStack) { stack in
            let style = AnyDescriptionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DetailImageStyle

public extension View {
    func detailImageStyle(_ style: some DetailImageStyle) -> some View {
        self.transformEnvironment(\.detailImageStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.detailImageStyleStack) { stack in
            let style = AnyDetailImageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FootnoteStyle

public extension View {
    func footnoteStyle(_ style: some FootnoteStyle) -> some View {
        self.transformEnvironment(\.footnoteStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.footnoteStyleStack) { stack in
            let style = AnyFootnoteStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FootnoteIconsStyle

public extension View {
    func footnoteIconsStyle(_ style: some FootnoteIconsStyle) -> some View {
        self.transformEnvironment(\.footnoteIconsStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func footnoteIconsStyle(@ViewBuilder content: @escaping (FootnoteIconsConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.footnoteIconsStyleStack) { stack in
            let style = AnyFootnoteIconsStyle(content)
            stack.append(style)
        }
    }
}

// MARK: IconsStyle

public extension View {
    func iconsStyle(_ style: some IconsStyle) -> some View {
        self.transformEnvironment(\.iconsStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.iconsStyleStack) { stack in
            let style = AnyIconsStyle(content)
            stack.append(style)
        }
    }
}

// MARK: NewActionStyle

public extension View {
    func newActionStyle(_ style: some NewActionStyle) -> some View {
        self.transformEnvironment(\.newActionStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func newActionStyle(@ViewBuilder content: @escaping (NewActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.newActionStyleStack) { stack in
            let style = AnyNewActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: NewObjectItemStyle

public extension View {
    func newObjectItemStyle(_ style: some NewObjectItemStyle) -> some View {
        self.transformEnvironment(\.newObjectItemStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func newObjectItemStyle(@ViewBuilder content: @escaping (NewObjectItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.newObjectItemStyleStack) { stack in
            let style = AnyNewObjectItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: StatusStyle

public extension View {
    func statusStyle(_ style: some StatusStyle) -> some View {
        self.transformEnvironment(\.statusStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.statusStyleStack) { stack in
            let style = AnyStatusStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SubstatusStyle

public extension View {
    func substatusStyle(_ style: some SubstatusStyle) -> some View {
        self.transformEnvironment(\.substatusStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func substatusStyle(@ViewBuilder content: @escaping (SubstatusConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.substatusStyleStack) { stack in
            let style = AnySubstatusStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SubtitleStyle

public extension View {
    func subtitleStyle(_ style: some SubtitleStyle) -> some View {
        self.transformEnvironment(\.subtitleStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.subtitleStyleStack) { stack in
            let style = AnySubtitleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SwitchStyle

public extension View {
    func switchStyle(_ style: some SwitchStyle) -> some View {
        self.transformEnvironment(\.switchStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func switchStyle(@ViewBuilder content: @escaping (SwitchConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.switchStyleStack) { stack in
            let style = AnySwitchStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TagsStyle

public extension View {
    func tagsStyle(_ style: some TagsStyle) -> some View {
        self.transformEnvironment(\.tagsStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func tagsStyle(@ViewBuilder content: @escaping (TagsConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.tagsStyleStack) { stack in
            let style = AnyTagsStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TitleStyle

public extension View {
    func titleStyle(_ style: some TitleStyle) -> some View {
        self.transformEnvironment(\.titleStyleStack) { stack in
            stack.append(style)
        }
    }
    
    func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.titleStyleStack) { stack in
            let style = AnyTitleStyle(content)
            stack.append(style)
        }
    }
}
