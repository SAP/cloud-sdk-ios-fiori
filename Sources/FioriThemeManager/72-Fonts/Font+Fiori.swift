import Foundation
import SwiftUI
import UIKit

public extension Font {
    /// Fiori (72) fonts
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - Parameter fioriTextStyle: Text style.
    /// - Returns: A scaled font for this text style.
    static func fiori(forTextStyle fioriTextStyle: Font.FioriTextStyle, weight: Font.Weight = .regular, isItalic: Bool = false, isCondensed: Bool = false) -> Font {
        var font: Font
        if UIFont.familyNames.contains("72") {
            font = Font.custom("72", size: fioriTextStyle.size, relativeTo: fioriTextStyle.textStyle)
            font = font.weight(weight.getFioriWeight(isItalic: isItalic, isCondensed: isCondensed))
        } else {
            font = Font.system(fioriTextStyle.textStyle).weight(weight)
        }
        
        if isItalic {
            font = font.italic()
        } else if isCondensed {
            if #available(iOS 16.1, watchOS 9.0, *) {
                font = font.width(Font.Width.condensed)
            } else {
                font = Font.fioriCondensed(forTextStyle: fioriTextStyle, weight: weight)
            }
        }
        
        return font
    }
    
    /// Fiori (72) fonts
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - Parameter fioriTextStyle: Text style.
    /// - Returns: A font with fixed size.
    static func fiori(fixedSize: CGFloat, weight: Font.Weight = .regular, isItalic: Bool = false, isCondensed: Bool = false) -> Font {
        var font: Font
        if UIFont.familyNames.contains("72") {
            font = Font.custom("72", fixedSize: fixedSize)
            font = font.weight(weight.getFioriWeight(isItalic: isItalic, isCondensed: isCondensed))
        } else {
            font = Font.system(size: fixedSize).weight(weight)
        }
        
        if isItalic {
            font = font.italic()
        } else if isCondensed {
            if #available(iOS 16.1, watchOS 9.0, *) {
                font = font.width(Font.Width.condensed)
            } else {
                font = Font.fioriCondensed(fixedSize: fixedSize, weight: weight)
            }
        }
        
        return font
    }
    
    /// Fiori (72) condensed fonts
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - Parameter fioriTextStyle: Text style.
    /// - Returns: A scaled condensed font for this text style.
    @available(*, deprecated, message: "Use UIFont.fiori(forTextStyle:) with isCondensed parameter set to true")
    static func fioriCondensed(forTextStyle fioriTextStyle: Font.FioriTextStyle, weight: Font.Weight = .regular) -> Font {
        var font: Font
        if UIFont.familyNames.contains("72") {
            font = Font.custom("72-Condensed", size: fioriTextStyle.size, relativeTo: fioriTextStyle.textStyle)
            font = font.weight(weight.getFioriWeight(isItalic: false, isCondensed: true))
        } else {
            font = Font.system(fioriTextStyle.textStyle).weight(weight)
            if #available(iOS 16.1, watchOS 9.0, *) {
                font = font.width(Font.Width.condensed)
            }
        }
        
        return font
    }
    
    /// Fiori (72) condensed fonts
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - Parameter fioriTextStyle: Text style.
    /// - Returns: A condensed font with fixed size.
    @available(iOS 14.0, *)
    @available(*, deprecated, message: "Use UIFont.fiori(fixedSize:) with isCondensed parameter set to true")
    static func fioriCondensed(fixedSize: CGFloat, weight: Font.Weight = .regular) -> Font {
        var font: Font
        if UIFont.familyNames.contains("72") {
            font = Font.custom("72-Condensed", fixedSize: fixedSize)
            font = font.weight(weight.getFioriWeight(isItalic: false, isCondensed: true))
        } else {
            font = Font.system(size: fixedSize).weight(weight)
            if #available(iOS 16.1, watchOS 9.0, *) {
                font = font.width(Font.Width.condensed)
            }
        }
        
        return font
    }
}

public extension Font {
    /// Fiori text style.
    enum FioriTextStyle: CaseIterable {
        case largeTitle
        case title1, title2, title3
        case headline, subheadline
        case body
        case callout
        case footnote
        case caption1, caption2
        case KPI, largeKPI
    
        var textStyle: TextStyle {
            switch self {
            case .largeTitle:
                return .largeTitle
            case .title1:
                return .title
            case .title2:
                if #available(iOS 14.0, *) {
                    return .title2
                } else {
                    return .title
                }
            case .title3:
                if #available(iOS 14.0, *) {
                    return .title3
                } else {
                    return .title
                }
            case .headline:
                return .headline
            case .body:
                return .body
            case .callout:
                return .callout
            case .subheadline:
                return .subheadline
            case .footnote:
                return .footnote
            case .caption1:
                return .caption
            case .caption2:
                if #available(iOS 14.0, *) {
                    return .caption2
                } else {
                    return .caption
                }
            case .KPI, .largeKPI:
                return .largeTitle
            }
        }
        
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
            }
        }
    }
}

extension Font.FioriTextStyle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .largeTitle:
            return "largeTitle"
        case .title1:
            return "title1"
        case .title2:
            return "title2"
        case .title3:
            return "title3"
        case .headline:
            return "headline"
        case .body:
            return "body"
        case .callout:
            return "callout"
        case .subheadline:
            return "subheadline"
        case .footnote:
            return "footnote"
        case .caption1:
            return "caption1"
        case .caption2:
            return "caption2"
        case .KPI:
            return "KPI"
        case .largeKPI:
            return "largeKPI"
        }
    }
}

extension Font.Weight {
    func getFioriWeight(isItalic: Bool, isCondensed: Bool) -> Font.Weight {
        isItalic ? self.italicWeight : (isCondensed ? self.condensedWeight : self.fioriWeight)
    }
    
    private var fioriWeight: Font.Weight {
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
    
    private var italicWeight: Font.Weight {
        switch self.fioriWeight {
        case .black, .bold:
            return .bold
        default:
            return .regular
        }
    }
    
    private var condensedWeight: Font.Weight {
        switch self.fioriWeight {
        case .black, .bold:
            return .bold
        default:
            return .regular
        }
    }
}
