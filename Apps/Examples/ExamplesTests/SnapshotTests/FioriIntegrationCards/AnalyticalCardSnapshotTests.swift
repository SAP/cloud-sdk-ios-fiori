//
//  AnalyticalCardSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/30/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriIntegrationCards
@testable import Examples

class AnalyticalCardSnapshotTests: XCTestCase {

    func testAnalyticalCard() throws {
        let card = InlineTestCases.analytical.manifest()!.card
        if case .analytical(let analyticalCard) = card {
            assertSnapshot(AnalyticalCardView(model: analyticalCard), configs:  [SnapshotTestViewConfig(config: .iPhoneX(.portrait), identifier: "iPhoneX_portrait")], style: .light)
        } else {
            XCTFail("Not the correct card")
        }
    }
}
