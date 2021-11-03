import Foundation

struct ColorCompatibilityMapV6: ColorStyleCompatibilityProvider {
    let uuid = UUID()
    
    static let `default` = ColorCompatibilityMap(ColorCompatibilityMapV6())
    
    let version: PaletteVersion = .v6

    private init() {}
    
    func newColorStyle(for obsoletedStyle: ColorStyle) -> ColorStyle? {
        switch obsoletedStyle {
        case .shell:
            return .header
        case .background1:
            return .primaryGroupedBackground
        case .background2:
            return .tertiaryGroupedBackground
        case .line:
            return .separatorOpaque
        case .primary1:
            return .primaryLabel
        case .primary2:
            return .secondaryLabel
        case .primary3:
            return .tertiaryLabel
        case .primary4:
            return .secondaryFill
        case .primary5:
            return .footer
        case .primary6:
            return .secondaryGroupedBackground
        case .primary7:
            return .quarternaryLabel
        case .primary8:
            return .barTransparent
        case .primary9:
            return .separator
        case .primary10:
            return .contrastElement
        case .tintColorLight:
            return .tintColor
        case .tintColorDark:
            return .tintColor2
        case .tintColorTapStateLight:
            return .tintColor
        case .tintColorTapStateDark:
            return .tintColor2
        case .cellBackgroundTapState:
            return .quarternaryFill
        case .shadow:
            return .cardShadow
        case .negative:
            return .negativeLabel
        case .positive:
            return .positiveLabel
        case .critical:
            return .criticalLabel
        case .accent1:
            return .mango3
        case .accent1b:
            return .mango4
        case .accent2:
            return .red4
        case .accent2b:
            return .red5
        case .accent3:
            return .pink5
        case .accent4:
            return .pink6
        case .accent5:
            return .indigo6
        case .accent6:
            return .blue6
        case .accent6b:
            return .blue7
        case .accent7:
            return .teal4
        case .accent7b:
            return .teal5
        case .accent8:
            return .green4
        case .accent9:
            return .indigo5
        case .accent10:
            return .grey5
        case .accent10b:
            return .grey4
        case .navigationBar:
            return .headerBlended
        case .backgroundGradientTop:
            return .headerBlended
        case .backgroundGradientBottom:
            return .footer
        case .backgroundBase:
            return .primaryGroupedBackground
        default:
            return nil
        }
    }
}
