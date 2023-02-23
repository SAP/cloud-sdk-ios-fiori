import Foundation
import UIKit

public extension UIFont {
    /// Get `Fiori` preferred font with a given size. Not a scaled font.
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - parameter textStyle: The `UIFontTextStyle` text style
    /// - parameter weight: The weight of the font.
    /// - parameter isItalic: The italic version of the font.
    /// - parameter isConsensed: The condensed version of the font.
    ///
    /// - returns: The font object with fixed size.
    class func preferredFioriFont(fixedSize size: CGFloat, weight: UIFont.Weight = .regular, isItalic: Bool = false, isCondensed: Bool = false) -> UIFont {
        guard var font = UIFont(name: get72FontName(weight: weight.fioriWeight), size: size) else {
            var font = UIFont.systemFont(ofSize: size, weight: weight)
            
            if isItalic {
                font = font.italic
            }
            if isCondensed {
                font = font.with(.traitCondensed)
            }
            
            return font
        }
        
        if isItalic {
            font = font.italic
        }
        if isCondensed {
            font = font.with(.traitCondensed)
        }
        
        return font
    }
    
    /// :nodoc:
    static func get72FontName(weight: UIFont.Weight) -> String {
        let description = weight.description
        return "72-\(description)"
    }
}

extension UIFont.Weight: CaseIterable, CustomStringConvertible {
    /// :nodoc:
    public static var allCases: [UIFont.Weight] {
        [.black, .heavy, .bold, .semibold, .medium, .regular, .light, .thin, .ultraLight]
    }
    
    /// :nodoc:
    public var description: String {
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

extension UIFont.Weight {
    // Available 72 weights
    var fioriWeight: UIFont.Weight {
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
}

extension UIFont {
    var bold: UIFont {
        self.with(.traitBold)
    }

    var italic: UIFont {
        self.with(.traitItalic)
    }

    var boldItalic: UIFont {
        self.with([.traitBold, .traitItalic])
    }

    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }

    func without(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits))) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
    
    func withWeight(_ weight: UIFont.Weight) -> UIFont {
        let newDescriptor = fontDescriptor.addingAttributes([.traits: [UIFontDescriptor.TraitKey.weight: weight]])
        return UIFont(descriptor: newDescriptor, size: 0)
    }
}
