@testable import FioriThemeManager
import SwiftUI
import UIKit
import XCTest

let sampleStyleSheetContent = """
@tintColor:#FF00F9;
@tintColor2:#FF00F9;
@tintColorTapState:#FF00F9;
@header:#fff;
@headerBlended:#fff;
@barTransparent:#fff;
@primaryBackground:#fff;
@tertiaryBackground:#fff;
@secondaryGroupedBackground:#fff;
@secondaryBackground:#f5f6f7;
@primaryGroupedBackground:#f5f6f7;
@tertiaryGroupedBackground:#f5f6f7;
@primaryLabel:#FF6000;
@tintColor_darkBackground:#FF0000;
@tintColor2_darkBackground:#FF0000;
@tintColorTapState_darkBackground:#FF0000;
@header_darkBackground:#1d232a;
@headerBlended_darkBackground:#1d232a;
@barTransparent_darkBackground:#1d232a;
@primaryBackground_darkBackground:#1d232a;
@tertiaryBackground_darkBackground:#1d232a;
@secondaryGroupedBackground_darkBackground:#1d232a;
@secondaryBackground_darkBackground:#12171c;
@primaryGroupedBackground_darkBackground:#12171c;
@tertiaryGroupedBackground_darkBackground:#12171c;
@primaryLabel_darkBackground:#00FFFF;

// NOT SUPPORTED ⬇️
Button {
background-color: @primaryBackgroundColor;
border-color: #A2A2A2;
border-width: @primaryBorderWidth;
font-color: @primaryFontColor;
font-color-highlighted: #999999;
font-name: @primaryFontName;
font-size: 18;
corner-radius: 7;
}
"""

class StyleSheetSettingsIntegrationTests: XCTestCase {
    override func setUp() {
        StyleSheetSettings.reset()
    }
    
    func testLoadStylesheetByString() {
        let originalColor = Color.preferredColor(.primaryLabel)
        
        XCTAssertNoThrow(try? StyleSheetSettings.loadStylesheetByString(content: sampleStyleSheetContent))
        
        XCTAssertNotEqual(originalColor.toHex(), Color.preferredColor(.primaryLabel).toHex(), "Color.preferredColor should return the color specified in the styleSheet")
        XCTAssertEqual(ThemeManager.shared.styleSheetOverrides.keys.count, 1)
    }
    
    func testLoadStylesheetByURL() {
        let originalColor = Color.preferredColor(.primaryLabel)
        
        XCTAssertNoThrow(try? StyleSheetSettings.loadStylesheetByURL(url: Bundle.module.url(forResource: "styleSheet", withExtension: "nss")!))
        
        XCTAssertNotEqual(originalColor.toHex(), Color.preferredColor(.primaryLabel).toHex(), "Color.preferredColor should return the color specified in the styleSheet")
        XCTAssertEqual(ThemeManager.shared.styleSheetOverrides.keys.count, 1)
    }
    
    func testReset() {
        let originalColor = Color.preferredColor(.primaryLabel)
        
        XCTAssertNoThrow(try? StyleSheetSettings.loadStylesheetByString(content: sampleStyleSheetContent))
        StyleSheetSettings.reset()
        
        XCTAssertEqual(ThemeManager.shared.styleSheetOverrides.keys.count, 0)
        XCTAssertEqual(originalColor.toHex(), Color.preferredColor(.primaryLabel).toHex(), "Color.preferredColor should return original color because loaded stylesheet settings shall be discared after `reset`")
    }
}
