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
            return nil
        case .accent1b:
            return nil
        case .accent2:
            return nil
        case .accent2b:
            return nil
        case .accent3:
            return nil
        case .accent4:
            return nil
        case .accent5:
            return nil
        case .accent6:
            return nil
        case .accent6b:
            return nil
        case .accent7:
            return nil
        case .accent7b:
            return nil
        case .accent8:
            return nil
        case .accent9:
            return nil
        case .accent10:
            return nil
        case .accent10b:
            return nil
        case .navigationBar:
            return nil
        case .backgroundGradientTop:
            return nil
        case .backgroundGradientBottom:
            return nil
        case .backgroundBase:
            return nil
        default:
            return nil
        }
    }
}
