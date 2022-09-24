@testable import FioriThemeManager
import SwiftUI
import XCTest

class StyleSheetConverterTests: XCTestCase {
    func testToColorRemovingWhitespaces() throws {
        let color = StyleSheetConverter.toColor(value: "                  #FF6000")
        XCTAssertNotNil(color)
        XCTAssertEqual(color?.toHex(), "FF6000")
    }
}
