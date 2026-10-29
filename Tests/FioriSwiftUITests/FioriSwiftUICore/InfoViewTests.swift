@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class InfoViewTests: XCTestCase {
    func testInfoViewLeftPaddingDefaultValue() {
        let view = InfoView(
            title: { Text("Title") },
            descriptionText: { Text("Desc") }
        )
        XCTAssertNotNil(view)
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
