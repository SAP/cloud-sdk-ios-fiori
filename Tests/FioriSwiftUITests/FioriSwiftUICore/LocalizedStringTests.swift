@testable import FioriSwiftUICore
import SwiftUI
import UIKit
import XCTest

class LocalizedStringTests: XCTestCase {
    func testLocalizedText() {
        var locale = Locale(identifier: "en_US")
        XCTAssertEqual(locale.text("Save"), "Save")
        
        locale = Locale(identifier: "de_DE")
        XCTAssertEqual(locale.text("Save"), "Sichern")
    }
    
    func testLocalizedAttributedString() {
        var locale = Locale(identifier: "en_US")
        XCTAssertEqual(AttributedString("View All (%d)", args: 3, locale: locale), "View All (3)")
        
        locale = Locale(identifier: "de_DE")
        XCTAssertEqual(AttributedString("View All (%d)", args: 3, locale: locale), "Alle anzeigen (3)")
    }
}
