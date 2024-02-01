// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: AvatarsStyle

struct AvatarsStyleStackKey: EnvironmentKey {
    static let defaultValue: [any AvatarsStyle] = []
}

extension EnvironmentValues {
    var avatarsStyle: any AvatarsStyle {
        avatarsStyleStack.last ?? .base
    }

    var avatarsStyleStack: [any AvatarsStyle] {
        get {
            self[AvatarsStyleStackKey.self]
        }
        set {
            self[AvatarsStyleStackKey.self] = newValue
        }
    }
}

// MARK: DemoViewStyle

struct DemoViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any DemoViewStyle] = []
}

extension EnvironmentValues {
    var demoViewStyle: any DemoViewStyle {
        demoViewStyleStack.last ?? .base.concat(.fiori)
    }

    var demoViewStyleStack: [any DemoViewStyle] {
        get {
            self[DemoViewStyleStackKey.self]
        }
        set {
            self[DemoViewStyleStackKey.self] = newValue
        }
    }
}

// MARK: DescriptionStyle

struct DescriptionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any DescriptionStyle] = []
}

extension EnvironmentValues {
    var descriptionStyle: any DescriptionStyle {
        descriptionStyleStack.last ?? .base
    }

    var descriptionStyleStack: [any DescriptionStyle] {
        get {
            self[DescriptionStyleStackKey.self]
        }
        set {
            self[DescriptionStyleStackKey.self] = newValue
        }
    }
}

// MARK: DetailImageStyle

struct DetailImageStyleStackKey: EnvironmentKey {
    static let defaultValue: [any DetailImageStyle] = []
}

extension EnvironmentValues {
    var detailImageStyle: any DetailImageStyle {
        detailImageStyleStack.last ?? .base
    }

    var detailImageStyleStack: [any DetailImageStyle] {
        get {
            self[DetailImageStyleStackKey.self]
        }
        set {
            self[DetailImageStyleStackKey.self] = newValue
        }
    }
}

// MARK: FootnoteStyle

struct FootnoteStyleStackKey: EnvironmentKey {
    static let defaultValue: [any FootnoteStyle] = []
}

extension EnvironmentValues {
    var footnoteStyle: any FootnoteStyle {
        footnoteStyleStack.last ?? .base
    }

    var footnoteStyleStack: [any FootnoteStyle] {
        get {
            self[FootnoteStyleStackKey.self]
        }
        set {
            self[FootnoteStyleStackKey.self] = newValue
        }
    }
}

// MARK: FootnoteIconsStyle

struct FootnoteIconsStyleStackKey: EnvironmentKey {
    static let defaultValue: [any FootnoteIconsStyle] = []
}

extension EnvironmentValues {
    var footnoteIconsStyle: any FootnoteIconsStyle {
        footnoteIconsStyleStack.last ?? .base
    }

    var footnoteIconsStyleStack: [any FootnoteIconsStyle] {
        get {
            self[FootnoteIconsStyleStackKey.self]
        }
        set {
            self[FootnoteIconsStyleStackKey.self] = newValue
        }
    }
}

// MARK: IconsStyle

struct IconsStyleStackKey: EnvironmentKey {
    static let defaultValue: [any IconsStyle] = []
}

extension EnvironmentValues {
    var iconsStyle: any IconsStyle {
        iconsStyleStack.last ?? .base
    }

    var iconsStyleStack: [any IconsStyle] {
        get {
            self[IconsStyleStackKey.self]
        }
        set {
            self[IconsStyleStackKey.self] = newValue
        }
    }
}

// MARK: NewActionStyle

struct NewActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any NewActionStyle] = []
}

extension EnvironmentValues {
    var newActionStyle: any NewActionStyle {
        newActionStyleStack.last ?? .base
    }

    var newActionStyleStack: [any NewActionStyle] {
        get {
            self[NewActionStyleStackKey.self]
        }
        set {
            self[NewActionStyleStackKey.self] = newValue
        }
    }
}

// MARK: NewObjectItemStyle

struct NewObjectItemStyleStackKey: EnvironmentKey {
    static let defaultValue: [any NewObjectItemStyle] = []
}

extension EnvironmentValues {
    var newObjectItemStyle: any NewObjectItemStyle {
        newObjectItemStyleStack.last ?? .base.concat(.fiori)
    }

    var newObjectItemStyleStack: [any NewObjectItemStyle] {
        get {
            self[NewObjectItemStyleStackKey.self]
        }
        set {
            self[NewObjectItemStyleStackKey.self] = newValue
        }
    }
}

// MARK: StatusStyle

struct StatusStyleStackKey: EnvironmentKey {
    static let defaultValue: [any StatusStyle] = []
}

extension EnvironmentValues {
    var statusStyle: any StatusStyle {
        statusStyleStack.last ?? .base
    }

    var statusStyleStack: [any StatusStyle] {
        get {
            self[StatusStyleStackKey.self]
        }
        set {
            self[StatusStyleStackKey.self] = newValue
        }
    }
}

// MARK: SubstatusStyle

struct SubstatusStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SubstatusStyle] = []
}

extension EnvironmentValues {
    var substatusStyle: any SubstatusStyle {
        substatusStyleStack.last ?? .base
    }

    var substatusStyleStack: [any SubstatusStyle] {
        get {
            self[SubstatusStyleStackKey.self]
        }
        set {
            self[SubstatusStyleStackKey.self] = newValue
        }
    }
}

// MARK: SubtitleStyle

struct SubtitleStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SubtitleStyle] = []
}

extension EnvironmentValues {
    var subtitleStyle: any SubtitleStyle {
        subtitleStyleStack.last ?? .base
    }

    var subtitleStyleStack: [any SubtitleStyle] {
        get {
            self[SubtitleStyleStackKey.self]
        }
        set {
            self[SubtitleStyleStackKey.self] = newValue
        }
    }
}

// MARK: TagsStyle

struct TagsStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TagsStyle] = []
}

extension EnvironmentValues {
    var tagsStyle: any TagsStyle {
        tagsStyleStack.last ?? .base
    }

    var tagsStyleStack: [any TagsStyle] {
        get {
            self[TagsStyleStackKey.self]
        }
        set {
            self[TagsStyleStackKey.self] = newValue
        }
    }
}

// MARK: TitleStyle

struct TitleStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TitleStyle] = []
}

extension EnvironmentValues {
    var titleStyle: any TitleStyle {
        titleStyleStack.last ?? .base
    }

    var titleStyleStack: [any TitleStyle] {
        get {
            self[TitleStyleStackKey.self]
        }
        set {
            self[TitleStyleStackKey.self] = newValue
        }
    }
}
