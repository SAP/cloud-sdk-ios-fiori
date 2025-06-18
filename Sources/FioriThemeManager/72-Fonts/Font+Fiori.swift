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
    static func fiori(forTextStyle fioriTextStyle: Font.FioriTextStyle, weight: Font.FioriWeight = .regular, isItalic: Bool = false, isCondensed: Bool = false) -> Font {
        var font: Font
        if UIFont.familyNames.contains("72") {
            switch weight {
            case .semiboldDuplex:
                font = Font.custom("72-SemiboldDuplex", size: fioriTextStyle.size, relativeTo: fioriTextStyle.textStyle)
            default:
                font = Font.custom("72", size: fioriTextStyle.size, relativeTo: fioriTextStyle.textStyle)
                    .weight(weight.resolveWeight(isItalic: isItalic, isCondensed: isCondensed))
            }
        } else {
            font = Font.system(fioriTextStyle.textStyle).weight(weight.fontWeight)
        }
        
        if isItalic {
            font = font.italic()
        } else if isCondensed {
            #if swift(>=5.7.1)
                if #available(iOS 16.0, watchOS 9.0, *) {
                    font = font.width(Font.Width.condensed)
                } else {
                    font = Font.fioriCondensed(forTextStyle: fioriTextStyle, weight: weight)
                }
            #else
                font = Font.fioriCondensed(forTextStyle: fioriTextStyle, weight: weight)
            #endif
        }
        
        return font
    }
    
    /// Fiori (72) fonts
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - Parameter fioriTextStyle: Text style.
    /// - Returns: A font with fixed size.
    static func fiori(fixedSize: CGFloat, weight: Font.FioriWeight = .regular, isItalic: Bool = false, isCondensed: Bool = false) -> Font {
        var font: Font
        if UIFont.familyNames.contains("72") {
            switch weight {
            case .semiboldDuplex:
                font = Font.custom("72-SemiboldDuplex", fixedSize: fixedSize)
            default:
                font = Font.custom("72", fixedSize: fixedSize)
                    .weight(weight.resolveWeight(isItalic: isItalic, isCondensed: isCondensed))
            }
        } else {
            font = Font.system(size: fixedSize).weight(weight.fontWeight)
        }
        
        if isItalic {
            font = font.italic()
        } else if isCondensed {
            #if swift(>=5.7.1)
                if #available(iOS 16.0, watchOS 9.0, *) {
                    font = font.width(Font.Width.condensed)
                } else {
                    font = Font.fioriCondensed(fixedSize: fixedSize, weight: weight)
                }
            #else
                font = Font.fioriCondensed(fixedSize: fixedSize, weight: weight)
            #endif
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
    static func fioriCondensed(forTextStyle fioriTextStyle: Font.FioriTextStyle, weight: Font.FioriWeight = .regular) -> Font {
        var font: Font
        if UIFont.familyNames.contains("72") {
            font = Font.custom("72-Condensed", size: fioriTextStyle.size, relativeTo: fioriTextStyle.textStyle)
            font = font.weight(weight.resolveWeight(isItalic: false, isCondensed: true))
        } else {
            font = Font.system(fioriTextStyle.textStyle).weight(weight.fontWeight)
            #if swift(>=5.7.1)
                if #available(iOS 16.0, watchOS 9.0, *) {
                    font = font.width(Font.Width.condensed)
                }
            #endif
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
    static func fioriCondensed(fixedSize: CGFloat, weight: Font.FioriWeight = .regular) -> Font {
        var font: Font
        if UIFont.familyNames.contains("72") {
            font = Font.custom("72-Condensed", fixedSize: fixedSize)
            font = font.weight(weight.resolveWeight(isItalic: false, isCondensed: true))
        } else {
            font = Font.system(size: fixedSize).weight(weight.fontWeight)
            #if swift(>=5.7.1)
                if #available(iOS 16.0, watchOS 9.0, *) {
                    font = font.width(Font.Width.condensed)
                }
            #endif
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
        case extraLargeTitle, extraLargeTitle2
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
            case .KPI, .largeKPI, .extraLargeTitle, .extraLargeTitle2:
                return .largeTitle
            }
        }
        
        var size: CGFloat {
            switch self {
            case .extraLargeTitle:
                return 52
            case .extraLargeTitle2:
                return 48
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
        case .extraLargeTitle:
            return "extraLargeTitle"
        case .extraLargeTitle2:
            return "extraLargeTitle2"
        }
    }
}
