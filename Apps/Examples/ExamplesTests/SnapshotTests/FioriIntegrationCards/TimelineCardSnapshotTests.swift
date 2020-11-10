@testable import Examples
@testable import FioriIntegrationCards
import SwiftUI
import XCTest

class TimelineCardSnapshotTests: XCTestCase {
    func testTimelineCard() throws {
        let card = InlineTestCases.timeLine.manifest()!.card
        if case .timeline(let timelineCard) = card {
            assertSnapshot(TimelineCardView(model: timelineCard), configs: [SnapshotTestViewConfig(config: .iPhoneX(.portrait), identifier: "iPhoneX_portrait")], style: .light)
        } else {
            XCTFail("Not the correct card")
        }
    }
}
