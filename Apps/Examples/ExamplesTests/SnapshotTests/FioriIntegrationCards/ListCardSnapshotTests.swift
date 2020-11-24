@testable import Examples
@testable import FioriIntegrationCards
import SwiftUI
import XCTest

class ListCardSnapshotTests: XCTestCase {
    func testListCard() throws {
        let card = InlineTestCases.list.manifest()!.card
        if case .list(let listCard) = card {
            assertSnapshot(ListCardView(model: listCard), configs: [SnapshotTestViewConfig(config: .iPhoneX(.portrait), identifier: "iPhoneX_portrait")], style: .light)
        } else {
            XCTFail("Not the correct card")
        }
    }

    func testListCardIcons() throws {
        let card = InlineTestCases.listicon.manifest()!.card
        if case .list(let listCard) = card {
            assertSnapshot(ListCardView(model: listCard), configs: [SnapshotTestViewConfig(config: .iPhoneX(.portrait), identifier: "iPhoneX_portrait")], style: .light)
        } else {
            XCTFail("Not the correct card")
        }
    }
}
