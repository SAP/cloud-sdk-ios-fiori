@testable import Examples
@testable import FioriIntegrationCards
import SwiftUI
import XCTest

class AnalyticalCardSnapshotTests: XCTestCase {
    func testAnalyticalCard() throws {
        let card = InlineTestCases.analytical.manifest()!.card
        if case .analytical(let analyticalCard) = card {
            assertSnapshot(AnalyticalCardView(model: analyticalCard), configs: [SnapshotTestViewConfig(config: .iPhoneX(.portrait), identifier: "iPhoneX_portrait")], style: .light)
        } else {
            XCTFail("Not the correct card")
        }
    }
}
