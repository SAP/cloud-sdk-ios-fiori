@testable import FioriThemeManager
import XCTest

final class FioriIconTests: XCTestCase {
    func testGetName() throws {
        let image = FioriIcon.actions.accept
        XCTAssertEqual(image.name, "fiori.accept")
    }
    
    func testGetCGImage() throws {
        let image = FioriIcon.actions.accept
        XCTAssertNotNil(image.cgImage)
    }
}
