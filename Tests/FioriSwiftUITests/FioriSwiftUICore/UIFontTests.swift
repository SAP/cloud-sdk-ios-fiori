@testable import FioriSwiftUICore
import SwiftUI
import XCTest

enum AppleSystemUIFont {
    static var familyName: String { ".AppleSystemUIFont" }
    static var fontName: String {
        #if os(xrOS)
            return ".SFUI-Bold"
        #else
            return ".SFUI-Semibold"
        #endif
    }

    static var pointSize: CGFloat {
        #if os(xrOS)
            return 12.0
        #else
            return 17.0
        #endif
    }
}

final class UIFontTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Font.registerFioriFonts()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $116455f38).FontBox<SwiftUI.Font.(unknown context at $116490d68).TextStyleProvider> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $116490d68).TextStyleProvider
           - style: SwiftUI.Font.TextStyle.headline
           - design: nil
           - weight: nil
     provider = TextStyleProvider
     */
    @available(xrOS, unavailable)
    func testSystemStyleFont() throws {
        #if os(xrOS)
            let font = Font.headline
            let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
            let fd = resolvedFont.fontDescriptor

            XCTAssertEqual(resolvedFont.familyName, ".AppleSystemUIFont")
            XCTAssertEqual(resolvedFont.fontName, ".SFUI-Bold")
            XCTAssertEqual(resolvedFont.pointSize, 12.0)
            if let style = fd.fontAttributes[.textStyle] as? NSString {
                XCTAssertEqual(style, "UICTFontTextStyleHeadline")
            }
            if let fontSize = fd.fontAttributes[.size] as? NSNumber {
                XCTAssertEqual(fontSize, 12)
            }
        #else
            let font = Font.headline
            let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
            let fd = resolvedFont.fontDescriptor

            XCTAssertEqual(resolvedFont.familyName, ".AppleSystemUIFont")
            XCTAssertEqual(resolvedFont.fontName, ".SFUI-Semibold")
            XCTAssertEqual(resolvedFont.pointSize, 17.0)
            if let style = fd.fontAttributes[.textStyle] as? NSString {
                XCTAssertEqual(style, "UICTFontTextStyleHeadline")
            }
            if let fontSize = fd.fontAttributes[.size] as? NSNumber {
                XCTAssertEqual(fontSize, 17)
            }
        #endif
    }

    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $11a086f38).FontBox<SwiftUI.Font.(unknown context at $11a12ac28).StaticModifierProvider<SwiftUI.Font.ItalicModifier>> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $11a12ac28).StaticModifierProvider<SwiftUI.Font.ItalicModifier>
           ▿ base: SwiftUI.Font
             ▿ provider: SwiftUI.(unknown context at $11a086f38).FontBox<SwiftUI.Font.(unknown context at $11a0c1d68).TextStyleProvider> #1
               - super: SwiftUI.AnyFontBox
               ▿ base: SwiftUI.Font.(unknown context at $11a0c1d68).TextStyleProvider
                 - style: SwiftUI.Font.TextStyle.headline
                 - design: nil
                 - weight: nil
     provider = StaticModifierProvider<ItalicModifier>
     provider = TextStyleProvider
     */
    func testSystemStyleItalicFont() throws {
        #if os(xrOS)
            let font = Font.headline.italic()
            let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
            let fd = resolvedFont.fontDescriptor
        
            XCTAssertEqual(resolvedFont.familyName, ".AppleSystemUIFont")
            XCTAssertEqual(resolvedFont.fontName, ".SFUI-BoldItalic")
            XCTAssertEqual(resolvedFont.pointSize, 12.0)
            if let style = fd.fontAttributes[.textStyle] as? NSString {
                XCTAssertEqual(style, "UICTFontTextStyleItalicHeadline")
            }
            if let fontSize = fd.fontAttributes[.size] as? NSNumber {
                XCTAssertEqual(fontSize, 12)
            }
        #else
            let font = Font.headline.italic()
            let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
            let fd = resolvedFont.fontDescriptor
        
            XCTAssertEqual(resolvedFont.familyName, ".AppleSystemUIFont")
            XCTAssertEqual(resolvedFont.fontName, ".SFUI-SemiboldItalic")
            XCTAssertEqual(resolvedFont.pointSize, 17.0)
            if let style = fd.fontAttributes[.textStyle] as? NSString {
                XCTAssertEqual(style, "UICTFontTextStyleItalicHeadline")
            }
            if let fontSize = fd.fontAttributes[.size] as? NSNumber {
                XCTAssertEqual(fontSize, 17)
            }
        #endif
    }
    
    func testSystemStyleItalicFontOnVisionOS() throws {
        #if os(xrOS)
            let font = Font.headline.italic()
            let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
            let fd = resolvedFont.fontDescriptor
        
            XCTAssertEqual(resolvedFont.familyName, ".AppleSystemUIFont")
            XCTAssertEqual(resolvedFont.fontName, ".SFUI-BoldItalic")
            XCTAssertEqual(resolvedFont.pointSize, 12.0)
            if let style = fd.fontAttributes[.textStyle] as? NSString {
                XCTAssertEqual(style, "UICTFontTextStyleItalicHeadline")
            }
            if let fontSize = fd.fontAttributes[.size] as? NSNumber {
                XCTAssertEqual(fontSize, 12)
            }
        #else
            let font = Font.headline.italic()
            let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
            let fd = resolvedFont.fontDescriptor
        
            XCTAssertEqual(resolvedFont.familyName, ".AppleSystemUIFont")
            XCTAssertEqual(resolvedFont.fontName, ".SFUI-SemiboldItalic")
            XCTAssertEqual(resolvedFont.pointSize, 17.0)
            if let style = fd.fontAttributes[.textStyle] as? NSString {
                XCTAssertEqual(style, "UICTFontTextStyleItalicHeadline")
            }
            if let fontSize = fd.fontAttributes[.size] as? NSNumber {
                XCTAssertEqual(fontSize, 17)
            }
        #endif
    }
    
    func testSystemStyleItalicBoldFont() throws {
        #if os(xrOS)
            let font = Font.headline.italic().bold()
            let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
            let fd = resolvedFont.fontDescriptor
        
            XCTAssertEqual(resolvedFont.familyName, ".AppleSystemUIFont")
            XCTAssertEqual(resolvedFont.fontName, ".SFUI-Black")
            if let fontSize = fd.fontAttributes[.size] as? NSNumber {
                XCTAssertEqual(fontSize, 12)
            }
        #else
            let font = Font.headline.italic().bold()
            let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
            let fd = resolvedFont.fontDescriptor
        
            XCTAssertEqual(resolvedFont.familyName, ".AppleSystemUIFont")
            XCTAssertEqual(resolvedFont.fontName, ".SFUI-Semibold")
            if let fontSize = fd.fontAttributes[.size] as? NSNumber {
                XCTAssertEqual(fontSize, 17)
            }
        #endif
    }
    
    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $10d86df38).FontBox<SwiftUI.Font.(unknown context at $10d911b64).ModifierProvider<SwiftUI.Font.WeightModifier>> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $10d911b64).ModifierProvider<SwiftUI.Font.WeightModifier>
           ▿ base: SwiftUI.Font
             ▿ provider: SwiftUI.(unknown context at $10d86df38).FontBox<SwiftUI.Font.(unknown context at $10d911c28).StaticModifierProvider<SwiftUI.Font.ItalicModifier>> #1
               - super: SwiftUI.AnyFontBox
               ▿ base: SwiftUI.Font.(unknown context at $10d911c28).StaticModifierProvider<SwiftUI.Font.ItalicModifier>
                 ▿ base: SwiftUI.Font
                   ▿ provider: SwiftUI.(unknown context at $10d86df38).FontBox<SwiftUI.Font.(unknown context at $10d8a8d68).TextStyleProvider> #2
                     - super: SwiftUI.AnyFontBox
                     ▿ base: SwiftUI.Font.(unknown context at $10d8a8d68).TextStyleProvider
                       - style: SwiftUI.Font.TextStyle.title3
                       - design: nil
                       - weight: nil
           ▿ modifier: SwiftUI.Font.WeightModifier
             ▿ weight: SwiftUI.Font.Weight
               - value: 0.62
     provider = ModifierProvider<WeightModifier>
     weight = UIFontWeight(rawValue: 0.0), UIFontWeight(rawValue: 0.6200000047683716)
     provider = StaticModifierProvider<ItalicModifier>
     provider = TextStyleProvider
     */
    func testSystemStyleItalicWeightFont() throws {
        let font = Font.title3.italic().weight(.black)
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
        let fd = resolvedFont.fontDescriptor
        
        XCTAssertEqual(resolvedFont.familyName, ".AppleSystemUIFont")
        XCTAssertEqual(resolvedFont.fontName, ".SFUI-BlackItalic")
        #if os(xrOS)
            XCTAssertEqual(resolvedFont.pointSize, 14.0)
        #else
            XCTAssertEqual(resolvedFont.pointSize, 14.0)
        #endif
        if let style = fd.fontAttributes[.textStyle] as? NSString {
            XCTAssertEqual(style, "UICTFontTextStyleItalicTitle3")
        }
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            #if os(xrOS)
                XCTAssertEqual(fontSize, 14)
            #else
                XCTAssertEqual(fontSize, 20)
            #endif
        }
    }
    
    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $124985f38).FontBox<SwiftUI.Font.(unknown context at $124a3c728).SystemProvider> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $124a3c728).SystemProvider
           - size: 48.0
           ▿ weight: Optional(SwiftUI.Font.Weight(value: 0.3))
             ▿ some: SwiftUI.Font.Weight
               - value: 0.3
           ▿ design: Optional(SwiftUI.Font.Design.serif)
             - some: SwiftUI.Font.Design.serif
     provider = SystemProvider
     */
    func testSystemSizeWeightDesignFont() throws {
        let font = Font.system(size: 48, weight: .semibold, design: .serif)
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
        let fd = resolvedFont.fontDescriptor
    
        XCTAssertEqual(resolvedFont.familyName, ".AppleSystemUIFontSerif")
        XCTAssertEqual(resolvedFont.fontName, ".NewYork-Semibold")
        XCTAssertEqual(resolvedFont.pointSize, 48.0)
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            XCTAssertEqual(fontSize, 48)
        }
    }
    
    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $121a6ef38).FontBox<SwiftUI.Font.(unknown context at $121b27890).NamedProvider> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $121b27890).NamedProvider
           - name: "72"
           - size: 48.0
           ▿ textStyle: Optional(SwiftUI.Font.TextStyle.largeTitle)
             - some: SwiftUI.Font.TextStyle.largeTitle
     provider = NamedProvider
     */
    func testFioriStyle() throws {
        let font = Font.fiori(forTextStyle: .largeKPI)
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
        let fd = resolvedFont.fontDescriptor
        XCTAssertEqual(resolvedFont.familyName, "72")
        XCTAssertEqual(resolvedFont.fontName, "72-Regular")
        XCTAssertEqual(resolvedFont.pointSize, 48.0)
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            XCTAssertEqual(fontSize, 48)
        }
    }
    
    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $115708f38).FontBox<SwiftUI.Font.(unknown context at $1157acc28).StaticModifierProvider<SwiftUI.Font.ItalicModifier>> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $1157acc28).StaticModifierProvider<SwiftUI.Font.ItalicModifier>
           ▿ base: SwiftUI.Font
             ▿ provider: SwiftUI.(unknown context at $115708f38).FontBox<SwiftUI.Font.(unknown context at $1157c1890).NamedProvider> #1
               - super: SwiftUI.AnyFontBox
               ▿ base: SwiftUI.Font.(unknown context at $1157c1890).NamedProvider
                 - name: "72"
                 - size: 22.0
                 ▿ textStyle: Optional(SwiftUI.Font.TextStyle.title2)
                   - some: SwiftUI.Font.TextStyle.title2
     provider = StaticModifierProvider<ItalicModifier>
     provider = NamedProvider
     */
    func testFioriStyleItalic() throws {
        let font = Font.fiori(forTextStyle: .title2).italic()
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
        let fd = resolvedFont.fontDescriptor
        XCTAssertEqual(resolvedFont.familyName, "72")
        XCTAssertEqual(resolvedFont.fontName, "72-Italic")
        XCTAssertEqual(resolvedFont.pointSize, 22.0)
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            XCTAssertEqual(fontSize, 22)
        }
    }
    
    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $117699f38).FontBox<SwiftUI.Font.(unknown context at $11773dc28).StaticModifierProvider<SwiftUI.Font.BoldModifier>> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $11773dc28).StaticModifierProvider<SwiftUI.Font.BoldModifier>
           ▿ base: SwiftUI.Font
             ▿ provider: SwiftUI.(unknown context at $117699f38).FontBox<SwiftUI.Font.(unknown context at $117752890).NamedProvider> #1
               - super: SwiftUI.AnyFontBox
               ▿ base: SwiftUI.Font.(unknown context at $117752890).NamedProvider
                 - name: "72"
                 - size: 15.0
                 ▿ textStyle: Optional(SwiftUI.Font.TextStyle.subheadline)
                   - some: SwiftUI.Font.TextStyle.subheadline
     provider = StaticModifierProvider<BoldModifier>
     provider = NamedProvider
     */
    func testFioriStyleBold() throws {
        let font = Font.fiori(forTextStyle: .subheadline).bold()
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
        let fd = resolvedFont.fontDescriptor

        XCTAssertEqual(resolvedFont.familyName, "72")
        XCTAssertEqual(resolvedFont.fontName, "72-Bold")
        XCTAssertEqual(resolvedFont.pointSize, 15.0)
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            XCTAssertEqual(fontSize, 15)
        }
    }
    
    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $1108e5f38).FontBox<SwiftUI.Font.(unknown context at $110989c28).StaticModifierProvider<SwiftUI.Font.BoldModifier>> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $110989c28).StaticModifierProvider<SwiftUI.Font.BoldModifier>
           ▿ base: SwiftUI.Font
             ▿ provider: SwiftUI.(unknown context at $1108e5f38).FontBox<SwiftUI.Font.(unknown context at $110989c28).StaticModifierProvider<SwiftUI.Font.ItalicModifier>> #1
               - super: SwiftUI.AnyFontBox
               ▿ base: SwiftUI.Font.(unknown context at $110989c28).StaticModifierProvider<SwiftUI.Font.ItalicModifier>
                 ▿ base: SwiftUI.Font
                   ▿ provider: SwiftUI.(unknown context at $1108e5f38).FontBox<SwiftUI.Font.(unknown context at $11099e890).NamedProvider> #2
                     - super: SwiftUI.AnyFontBox
                     ▿ base: SwiftUI.Font.(unknown context at $11099e890).NamedProvider
                       - name: "72"
                       - size: 15.0
                       ▿ textStyle: Optional(SwiftUI.Font.TextStyle.subheadline)
                         - some: SwiftUI.Font.TextStyle.subheadline
     provider = StaticModifierProvider<BoldModifier>
     provider = StaticModifierProvider<ItalicModifier>
     provider = NamedProvider
     */
    func testFioriItalicBoldStyle() throws {
        let font = Font.fiori(forTextStyle: .subheadline).italic().bold()
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
        let fd = resolvedFont.fontDescriptor
        
        XCTAssertEqual(resolvedFont.familyName, "72")
        XCTAssertEqual(resolvedFont.fontName, "72-BoldItalic")
        XCTAssertEqual(resolvedFont.pointSize, 15.0)
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            XCTAssertEqual(fontSize, 15)
        }
    }
    
    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $120b00f38).FontBox<SwiftUI.Font.(unknown context at $120ba4b64).ModifierProvider<SwiftUI.Font.WeightModifier>> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $120ba4b64).ModifierProvider<SwiftUI.Font.WeightModifier>
           ▿ base: SwiftUI.Font
             ▿ provider: SwiftUI.(unknown context at $120b00f38).FontBox<SwiftUI.Font.(unknown context at $120bb9890).NamedProvider> #1
               - super: SwiftUI.AnyFontBox
               ▿ base: SwiftUI.Font.(unknown context at $120bb9890).NamedProvider
                 - name: "72"
                 - size: 13.0
                 ▿ textStyle: Optional(SwiftUI.Font.TextStyle.footnote)
                   - some: SwiftUI.Font.TextStyle.footnote
           ▿ modifier: SwiftUI.Font.WeightModifier
             ▿ weight: SwiftUI.Font.Weight
               - value: -0.4
     provider = ModifierProvider<WeightModifier>
     provider = NamedProvider
     */
    func testFioriStyleItalicWeight() throws {
        let font = Font.fiori(forTextStyle: .footnote).weight(.black)
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .body)
        let fd = resolvedFont.fontDescriptor
        
        XCTAssertEqual(resolvedFont.familyName, "72")
        XCTAssertEqual(resolvedFont.fontName, "72Black")
        XCTAssertEqual(resolvedFont.pointSize, 13)
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            XCTAssertEqual(fontSize, 13)
        }
    }
    
    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $11d9baf38).FontBox<SwiftUI.Font.(unknown context at $11da5eb64).ModifierProvider<SwiftUI.Font.WidthModifier>> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $11da5eb64).ModifierProvider<SwiftUI.Font.WidthModifier>
           ▿ base: SwiftUI.Font
             ▿ provider: SwiftUI.(unknown context at $11d9baf38).FontBox<SwiftUI.Font.(unknown context at $11da5eb64).ModifierProvider<SwiftUI.Font.WeightModifier>> #1
               - super: SwiftUI.AnyFontBox
               ▿ base: SwiftUI.Font.(unknown context at $11da5eb64).ModifierProvider<SwiftUI.Font.WeightModifier>
                 ▿ base: SwiftUI.Font
                   ▿ provider: SwiftUI.(unknown context at $11d9baf38).FontBox<SwiftUI.Font.(unknown context at $11da73890).NamedProvider> #2
                     - super: SwiftUI.AnyFontBox
                     ▿ base: SwiftUI.Font.(unknown context at $11da73890).NamedProvider
                       - name: "72"
                       - size: 13.0
                       ▿ textStyle: Optional(SwiftUI.Font.TextStyle.footnote)
                         - some: SwiftUI.Font.TextStyle.footnote
                 ▿ modifier: SwiftUI.Font.WeightModifier
                   ▿ weight: SwiftUI.Font.Weight
                     - value: 0.0
           ▿ modifier: SwiftUI.Font.WidthModifier
             - width: -0.2
     ModifierProvider<WidthModifier>
     ModifierProvider<WeightModifier>
     NamedProvider
     */
    func testFioriCondensedStyle() throws {
        let font = Font.fiori(forTextStyle: .footnote, isCondensed: true)
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .body)
        let fd = resolvedFont.fontDescriptor

        XCTAssertEqual(resolvedFont.familyName, "72")
        XCTAssertEqual(resolvedFont.fontName, "72-Condensed")
        XCTAssertEqual(resolvedFont.pointSize, 13)
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            XCTAssertEqual(fontSize, 13)
        }
    }

    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $117508f38).FontBox<SwiftUI.Font.(unknown context at $1175acc28).StaticModifierProvider<SwiftUI.Font.ItalicModifier>> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $1175acc28).StaticModifierProvider<SwiftUI.Font.ItalicModifier>
           ▿ base: SwiftUI.Font
             ▿ provider: SwiftUI.(unknown context at $117508f38).FontBox<SwiftUI.Font.(unknown context at $1175acb64).ModifierProvider<SwiftUI.Font.WeightModifier>> #1
               - super: SwiftUI.AnyFontBox
               ▿ base: SwiftUI.Font.(unknown context at $1175acb64).ModifierProvider<SwiftUI.Font.WeightModifier>
                 ▿ base: SwiftUI.Font
                   ▿ provider: SwiftUI.(unknown context at $117508f38).FontBox<SwiftUI.Font.(unknown context at $1175c1890).NamedProvider> #2
                     - super: SwiftUI.AnyFontBox
                     ▿ base: SwiftUI.Font.(unknown context at $1175c1890).NamedProvider
                       - name: "72"
                       - size: 13.0
                       ▿ textStyle: Optional(SwiftUI.Font.TextStyle.footnote)
                         - some: SwiftUI.Font.TextStyle.footnote
                 ▿ modifier: SwiftUI.Font.WeightModifier
                   ▿ weight: SwiftUI.Font.Weight
                     - value: 0.0
     StaticModifierProvider<ItalicModifier>
     ModifierProvider<WeightModifier>
     NamedProvider
     */
    func testFioriCondensedStyleItalic() throws {
        let font = Font.fiori(forTextStyle: .footnote, isItalic: true, isCondensed: true)
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .body)
        let fd = resolvedFont.fontDescriptor

        XCTAssertEqual(resolvedFont.familyName, "72")
        XCTAssertEqual(resolvedFont.fontName, "72-Italic")
        XCTAssertEqual(resolvedFont.pointSize, 13)
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            XCTAssertEqual(fontSize, 13)
        }
    }
    
    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $111c00f38).FontBox<SwiftUI.Font.(unknown context at $111cb9890).NamedProvider> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $111cb9890).NamedProvider
           - name: "72"
           - size: 25.0
           - textStyle: nil
     provider = NamedProvider
     */
    func testFioriSize() throws {
        let font = Font.fiori(fixedSize: 25)
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .footnote)
        let fd = resolvedFont.fontDescriptor

        XCTAssertEqual(resolvedFont.familyName, "72")
        XCTAssertEqual(resolvedFont.fontName, "72-Regular")
        XCTAssertEqual(resolvedFont.pointSize, 25)
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            XCTAssertEqual(fontSize, 25)
        }
    }
    
    /**
     ▿ SwiftUI.Font
       ▿ provider: SwiftUI.(unknown context at $119ce9f38).FontBox<SwiftUI.Font.(unknown context at $119da2890).NamedProvider> #0
         - super: SwiftUI.AnyFontBox
         ▿ base: SwiftUI.Font.(unknown context at $119da2890).NamedProvider
           - name: "Helvetica"
           - size: 17.0
           ▿ textStyle: Optional(SwiftUI.Font.TextStyle.body)
             - some: SwiftUI.Font.TextStyle.body
     provider = NamedProvider
     */
    func testCustomFont() throws {
        let font = Font.custom("Helvetica", size: 17, relativeTo: .body)
        let resolvedFont = UIFont.resolveFont(font)?.font(with: nil) ?? UIFont.preferredFont(forTextStyle: .body)
        let fd = resolvedFont.fontDescriptor
    
        XCTAssertEqual(resolvedFont.familyName, "Helvetica")
        XCTAssertEqual(resolvedFont.fontName, "Helvetica")
        XCTAssertEqual(resolvedFont.pointSize, 17)
        if let fontSize = fd.fontAttributes[.size] as? NSNumber {
            XCTAssertEqual(fontSize, 17)
        }
    }
}
