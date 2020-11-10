@testable import Examples
@testable import FioriIntegrationCards
import Foundation
import SwiftUI
import XCTest

class ObjectCardSnapshotTests: XCTestCase {
    func testObjectCard() throws {
        let card = InlineTestCases.object.manifest()!.card
        if case .object(let objectCard) = card {
            assertSnapshot(ObjectCardView(model: objectCard), configs: [SnapshotTestViewConfig(config: .iPhoneX(.portrait), identifier: "iPhoneX_portrait")], style: .light)
        } else {
            XCTFail("Not the correct card")
        }
    }
}
