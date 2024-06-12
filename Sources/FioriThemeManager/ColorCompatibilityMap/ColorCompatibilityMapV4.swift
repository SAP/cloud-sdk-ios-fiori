import Foundation

@available(watchOS, unavailable)
struct ColorCompatibilityMapV4: ColorStyleCompatibilityProvider {
    let uuid = UUID()
    
    static let `default` = ColorCompatibilityMap(ColorCompatibilityMapV4())
    
    let version: PaletteVersion = .v4
    
    private init() {}
    
    var compatibleColorDefinitions: [ColorStyle: ColorStyle] = [
        .primaryLabel: .primaryLabel,
        .secondaryLabel: .secondaryLabel,
        .tertiaryLabel: .tertiaryLabel,
        .secondaryFill: .secondaryFill,
        .secondaryGroupedBackground: .secondaryGroupedBackground,
        .quaternaryLabel: .quaternaryLabel,
        .barTransparent: .barTransparent,
        .separator: .separator,
        .headerBlended: .header,
        .footer: .header,
        .primaryGroupedBackground: .primaryBackground
    ]
    
    func compatibleStyle(from style: ColorStyle) -> ColorStyle? {
        self.compatibleColorDefinitions[style]
    }
}
