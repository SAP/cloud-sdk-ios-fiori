@testable import FioriThemeManager
import SwiftUI
import UIKit
import XCTest

class ThemeManagerTests: XCTestCase {
    func testPaletteLatest() throws {
        let tm = ThemeManager.shared
        let newStyle_grey1 = tm.hexColor(for: .grey1)
        XCTAssertEqual(newStyle_grey1, HexColor(lightColor: "111D29FF", darkColor: "F5F6F7FF"))
        let newStyle_primaryLabel = tm.hexColor(for: .primaryLabel)
        XCTAssertEqual(newStyle_primaryLabel, HexColor(lightColor: "F5F6F7FF", darkColor: "223548FF"))
        let obsoletedStyle_line = tm.hexColor(for: .line)
        XCTAssertEqual(obsoletedStyle_line, HexColor(lightColor: "8396A8D4", darkColor: "5B738BD4"))
        let obsoletedStyle_negative = tm.hexColor(for: .negative)
        XCTAssertEqual(obsoletedStyle_negative, HexColor(lightColor: "FF5C77FF", darkColor: "D20A0AFF"))
    }
    
    func testPaletteV4() throws {
        let tm = ThemeManager.shared
        tm.setPaletteVersion(.v4)
        let v4Style_primary1 = tm.hexColor(for: .primary1)
        XCTAssertEqual(v4Style_primary1, HexColor(lightColor: "FFFFFF", darkColor: "32363A"))
        let v4Style_tintColor = tm.hexColor(for: .tintColor)
        XCTAssertEqual(v4Style_tintColor, HexColor(lightColor: "D1E8FF", darkColor: "0A6ED1"))
        let v4Style_line = tm.hexColor(for: .line)
        XCTAssertEqual(v4Style_line, HexColor(lightColor: "38383A", darkColor: "F3F3F3"))
        let v4Style_negative = tm.hexColor(for: .negative)
        XCTAssertEqual(v4Style_negative, HexColor(lightColor: "FF453A", darkColor: "BB0000"))
    }
}
