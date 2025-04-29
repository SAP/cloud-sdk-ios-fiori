@testable import FioriSwiftUICore
import SwiftUI
import SwiftUICore
import XCTest

final class InfoViewTests: XCTestCase {
    func testInfoViewLeftPadding() {
        XCTAssertEqual(getInfoViewLeftPadding(), 35.0)
    }
    
    func testViewConfiguration() throws {
        let view = InfoView(
            title: { Text("Initial Title") },
            descriptionText: { Text("Initial Description") },
            action: { Button("Action") {} },
            secondaryAction: { Button("Secondary") {} }
        )
        
        XCTAssertTrue(type(of: view.title) == FioriSwiftUICore.Title.self, "type error")
        XCTAssertTrue(type(of: view.action) == FioriSwiftUICore.Action.self, "type error")
    }
}
