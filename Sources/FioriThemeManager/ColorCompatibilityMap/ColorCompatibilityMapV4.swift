import Foundation

@available(*, deprecated, message: "Intentionally used for backward compatibility.")
@available(watchOS, unavailable)
struct ColorCompatibilityMapV4: ColorStyleCompatibilityProvider {
    let uuid = UUID()
    
    static let `default` = ColorCompatibilityMap(ColorCompatibilityMapV4())
    
    let version: PaletteVersion = .v4
    
    private init() {}
    
    var compatibleColorDefinitions: [ColorStyle: ColorStyle] = [
        .primaryLabel: .primary1,
        .secondaryLabel: .primary2,
        .tertiaryLabel: .primary3,
        .secondaryFill: .primary4,
        .secondaryGroupedBackground: .primary6,
        .quaternaryLabel: .primary7,
        .barTransparent: .primary8,
        .separator: .primary9,
        .headerBlended: .backgroundGradientTop,
        .footer: .backgroundGradientBottom,
        .primaryGroupedBackground: .backgroundBase
    ]
    
    func compatibleStyle(from style: ColorStyle) -> ColorStyle? {
        self.compatibleColorDefinitions[style]
    }
}
