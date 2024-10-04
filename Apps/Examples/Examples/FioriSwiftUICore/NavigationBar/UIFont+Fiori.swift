import UIKit

extension UIFont {
    /// Get `Fiori` preferred font based on a given `UIFontTextStyle`. This is a scaled font.
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - parameter textStyle: The `UIFontTextStyle` text style
    /// - parameter weight: The weight of the font.
    /// - parameter isItalic: The italic version of the font.
    /// - parameter isConsensed: The condensed version of the font.
    ///
    /// - returns: The font object with specified attributes.
    class func preferredFioriFont(forTextStyle textStyle: UIFont.TextStyle, weight: UIFont.Weight = .regular, isItalic: Bool = false, isCondensed: Bool = false) -> UIFont {
        var symbolicTraits: UIFontDescriptor.SymbolicTraits = []
        if isItalic {
            symbolicTraits.formUnion(.traitItalic)
        } else if isCondensed {
            symbolicTraits.formUnion(.traitCondensed)
        }

        var traits: [UIFontDescriptor.TraitKey: Any] = [.symbolic: symbolicTraits.rawValue]
        var fontAttributes: [UIFontDescriptor.AttributeName: Any] = [:]
        if UIFont.is72FontsAvailable {
            traits[.weight] = weight.getFioriWeight(isItalic: isItalic, isCondensed: isCondensed)
            fontAttributes[.family] = "72"
            fontAttributes[.size] = textStyle.size
        } else {
            traits[.weight] = weight
            fontAttributes = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle).fontAttributes
        }
        fontAttributes[.traits] = traits

        let font = UIFont(descriptor: UIFontDescriptor(fontAttributes: fontAttributes), size: 0)
        if !UIFont.is72FontsAvailable {
            return font
        }
        
        let metrics: UIFontMetrics
        if textStyle == .KPI || textStyle == .largeKPI {
            metrics = UIFontMetrics(forTextStyle: .largeTitle)
        } else {
            metrics = UIFontMetrics(forTextStyle: textStyle)
        }

        let scaledFont = metrics.scaledFont(for: font)
        return scaledFont
    }
}
 
extension UIFont {
    // Check if 72 fonts are registered.
    static var is72FontsAvailable: Bool {
        UIFont.familyNames.contains("72")
    }
}

extension UIFont.TextStyle {
    /// KPI text style.
    static let KPI = UIFont.TextStyle(rawValue: "com.sap.sdk.ios.SAPFiori.TextStyle.KPI")
    
    /// Large KPI text style.
    static let largeKPI = UIFont.TextStyle(rawValue: "com.sap.sdk.ios.SAPFiori.TextStyle.largeKPI")
}

extension UIFont.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle:
            return 34
        case .title1:
            return 28
        case .title2:
            return 22
        case .title3:
            return 20
        case .headline:
            return 17
        case .body:
            return 17
        case .callout:
            return 16
        case .subheadline:
            return 15
        case .footnote:
            return 13
        case .caption1:
            return 12
        case .caption2:
            return 11
        case .largeKPI:
            return 48
        case .KPI:
            return 36
        default:
            return 17
        }
    }
}

extension UIFont.Weight {
    func getFioriWeight(isItalic: Bool, isCondensed: Bool) -> UIFont.Weight {
        isItalic ? self.italicWeight : (isCondensed ? self.condensedWeight : self.fioriWeight)
    }
    
    // Available 72 weights
    private var fioriWeight: UIFont.Weight {
        switch self {
        case .heavy, .black:
            return .black
        case .medium, .semibold, .bold:
            return .bold
        case .regular:
            return .regular
        case .ultraLight, .thin, .light:
            return .light
        default:
            return .regular
        }
    }
    
    private var italicWeight: UIFont.Weight {
        switch self.fioriWeight {
        case .black, .bold:
            return .bold
        default:
            return .regular
        }
    }
    
    private var condensedWeight: UIFont.Weight {
        switch self.fioriWeight {
        case .black, .bold:
            return .bold
        default:
            return .regular
        }
    }
    
    // Available 72 weights
    var fiori72Weight: UIFont.Weight {
        if rawValue >= 0.56 { // heavy & black; use black
            return .black
        } else if rawValue >= 0.23 { // .medium, .semibold, .bold; use bold
            return .bold
        } else if rawValue < 0 { // .ultraLight, .thin, .light; use light
            return .light
        } else { // regular
            return .regular
        }
    }
    
    var fioriDescription: String {
        let name: String
        
        switch self {
        case .black:
            name = "black"
        case .heavy:
            name = "heavy"
        case .bold:
            name = "bold"
        case .semibold:
            name = "semibold"
        case .medium:
            name = "medium"
        case .regular:
            name = "regular"
        case .light:
            name = "light"
        case .thin:
            name = "thin"
        case .ultraLight:
            name = "ultraLight"
        default:
            name = "Unknown"
        }
        
        return name
    }
}
