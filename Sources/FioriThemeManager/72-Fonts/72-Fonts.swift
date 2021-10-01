import Foundation
import SwiftUI
import UIKit

extension Font {
    /// Register Fiori fonts in the app.
    ///
    /// Call `Font.registerFioriFonts()` in AppDelegate to load all the fiori fonts into your app. If it is not called, `Font.fiori(forTextStyle:)` will return system font instead.
    public static func registerFioriFonts() {
        self.registerFont("72-Black", fileExtension: "ttf")
        self.registerFont("72-Bold", fileExtension: "ttf")
        self.registerFont("72-BoldItalic", fileExtension: "ttf")
        self.registerFont("72-Condensed", fileExtension: "ttf")
        self.registerFont("72-CondensedBold", fileExtension: "ttf")
        self.registerFont("72-Italic", fileExtension: "ttf")
        self.registerFont("72-Light", fileExtension: "ttf")
        self.registerFont("72-Regular", fileExtension: "ttf")
        print("All 72 font names: \(UIFont.fontNames(forFamilyName: "72"))")
    }
    
    // stackoverflow: https://stackoverflow.com/questions/62681206/xcode-12b1-swift-packages-custom-fonts
    static func registerFont(_ name: String, fileExtension: String, bundle: Bundle = Bundle.module) {
        guard let fontURL = bundle.url(forResource: name, withExtension: fileExtension) else {
            print("No font named \(name).\(fileExtension) was found in the module bundle")
            return
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)
        print(error ?? "Successfully registered font: \(name)")
    }
}

public extension Font {
    /// Fiori (72) fonts
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - Parameter fioriTextStyle: Text style.
    /// - Returns: A scaled font for this text style.
    static func fiori(forTextStyle fioriTextStyle: Font.FioriTextStyle) -> Font {
        if #available(iOS 14.0, *) {
            return .custom("72", size: fioriTextStyle.size, relativeTo: fioriTextStyle.textStyle)
        } else {
            return .custom("72", size: fioriTextStyle.size)
        }
    }
    
    /// Fiori (72) fonts
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - Parameter fioriTextStyle: Text style.
    /// - Returns: A font with fixed size.
    @available(iOS 14.0, *)
    static func fiori(fixedSize: CGFloat) -> Font {
        .custom("72", fixedSize: fixedSize)
    }
    
    /// Fiori (72) condensed fonts
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - Parameter fioriTextStyle: Text style.
    /// - Returns: A scaled condensed font for this text style.
    static func fioriCondensed(forTextStyle fioriTextStyle: Font.FioriTextStyle) -> Font {
        if #available(iOS 14.0, *) {
            return .custom("72-Condensed", size: fioriTextStyle.size, relativeTo: fioriTextStyle.textStyle)
        } else {
            return .custom("72-Condensed", size: fioriTextStyle.size)
        }
    }
    
    /// Fiori (72) condensed fonts
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - Parameter fioriTextStyle: Text style.
    /// - Returns: A condensed font with fixed size.
    @available(iOS 14.0, *)
    static func fioriCondensed(fixedSize: CGFloat) -> Font {
        .custom("72-Condensed", fixedSize: fixedSize)
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
                return 36
            case .title1:
                return 30
            case .title2:
                return 24
            case .title3:
                return 22
            case .headline:
                return 19
            case .body:
                return 19
            case .callout:
                return 18
            case .subheadline:
                return 17
            case .footnote:
                return 15
            case .caption1:
                return 14
            case .caption2:
                return 13
            case .largeKPI:
                return 50
            case .KPI:
                return 38
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
