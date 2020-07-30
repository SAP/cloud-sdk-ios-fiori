//
//  TimelineCardSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/30/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriIntegrationCards
@testable import Examples

class TimelineCardSnapshotTests: XCTestCase {

    func testTimelineCard() throws {
        let card = InlineTestCases.timeLine.manifest()!.card
        if case .timeline(let timelineCard) = card {
            assertSnapshot(TimelineCardView(model: timelineCard), configs:  [SnapshotTestViewConfig(config: .iPhoneX(.portrait), identifier: "iPhoneX_portrait")], style: .light)
        } else {
            XCTFail("Not the correct card")
        }
    }
}
