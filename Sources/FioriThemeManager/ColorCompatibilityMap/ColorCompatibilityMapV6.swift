import Foundation

struct ColorCompatibilityMapV6: ColorStyleCompatibilityProvider {
    let uuid = UUID()
    
    static let `default` = ColorCompatibilityMap(ColorCompatibilityMapV6())
    
    let version: PaletteVersion = .v6

    private init() {}
    
    var obsoletedColorDefinitions: [ColorStyle: ColorStyle] = [
        .shell: .header,
        .background1: .primaryGroupedBackground,
        .background2: .tertiaryGroupedBackground,
        .line: .separatorOpaque,
        .primary1: .primaryLabel,
        .primary2: .secondaryLabel,
        .primary3: .tertiaryLabel,
        .primary4: .secondaryFill,
        .primary5: .footer,
        .primary6: .secondaryGroupedBackground,
        .primary7: .quarternaryLabel,
        .primary8: .barTransparent,
        .primary9: .separator,
        .primary10: .contrastElement,
        .tintColorLight: .tintColor,
        .tintColorDark: .tintColor2,
        .tintColorTapStateLight: .tintColor,
        .tintColorTapStateDark: .tintColor2,
        .cellBackgroundTapState: .quarternaryFill,
        .shadow: .cardShadow,
        .negative: .negativeLabel,
        .positive: .positiveLabel,
        .critical: .criticalLabel,
        .accent1: .mango3,
        .accent1b: .mango4,
        .accent2: .red4,
        .accent2b: .red5,
        .accent3: .pink5,
        .accent4: .pink6,
        .accent5: .indigo6,
        .accent6: .blue6,
        .accent6b: .blue7,
        .accent7: .teal4,
        .accent7b: .teal5,
        .accent8: .green4,
        .accent9: .indigo5,
        .accent10: .grey5,
        .accent10b: .grey4,
        .navigationBar: .headerBlended,
        .backgroundGradientTop: .headerBlended,
        .backgroundGradientBottom: .footer,
        .backgroundBase: .primaryGroupedBackground
    ]
    
    func compatibleStyle(from style: ColorStyle) -> ColorStyle? {
        self.obsoletedColorDefinitions[style]
    }
}
