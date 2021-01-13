import SwiftUI

struct TitleStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct TitleModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct TitleStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct TitleStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SubtitleStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct SubtitleModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SubtitleStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct SubtitleStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct FootnoteStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct FootnoteModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct FootnoteStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct FootnoteStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct DescriptionTextStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct DescriptionTextModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct DescriptionTextStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct DescriptionTextStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct DetailImageStyleKey: EnvironmentKey {
    public static let defaultValue = ImageStyle()
}

struct DetailImageModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct DetailImageStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct DetailImageStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct AttributeStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct AttributeModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct AttributeStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct AttributeStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SecondaryAttributeStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct SecondaryAttributeModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SecondaryAttributeStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct SecondaryAttributeStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct TimestampStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct TimestampModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct TimestampStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct TimestampStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SecondaryTimestampStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct SecondaryTimestampModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SecondaryTimestampStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct SecondaryTimestampStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct TrendStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct TrendModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct TrendStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct TrendStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct StatusStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct StatusModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct StatusStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct StatusStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SubstatusStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct SubstatusModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SubstatusStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct SubstatusStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct BodyStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct BodyModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct BodyStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct BodyStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct IconStyleKey: EnvironmentKey {
    public static let defaultValue = ImageStyle()
}

struct IconModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct IconStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct IconStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct IconsStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct IconsModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct IconsStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct IconsStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct ActionTitleStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct ActionTitleModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct ActionTitleStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct ActionTitleStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SeriesTitlesStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct SeriesTitlesModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SeriesTitlesStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct SeriesTitlesStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct KeyStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct KeyModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct KeyStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct KeyStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct ValueStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct ValueModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct ValueStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct ValueStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct ValuesStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct ValuesModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct ValuesStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct ValuesStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct ValueAxisTitleStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct ValueAxisTitleModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct ValueAxisTitleStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct ValueAxisTitleStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SecondaryValuesAxisTitleStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct SecondaryValuesAxisTitleModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SecondaryValuesAxisTitleStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct SecondaryValuesAxisTitleStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct CategoryAxisTitleStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct CategoryAxisTitleModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct CategoryAxisTitleStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct CategoryAxisTitleStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct EmptyTextStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct EmptyTextModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct EmptyTextStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct EmptyTextStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct KpiStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct KpiModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct KpiStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct KpiStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct PlaceholderStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct PlaceholderModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct PlaceholderStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct PlaceholderStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct TagsStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct TagsModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct TagsStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct TagsStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct LowerBoundTitleStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct LowerBoundTitleModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct LowerBoundTitleStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct LowerBoundTitleStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct UpperBoundTitleStyleKey: EnvironmentKey {
    public static let defaultValue = TextStyle()
}

struct UpperBoundTitleModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct UpperBoundTitleStyleClassPathKey: EnvironmentKey {
    public static let defaultValue: [String] = []
}

struct UpperBoundTitleStyleClassModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}
