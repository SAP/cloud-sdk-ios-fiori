//
//  ListCardSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/30/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriIntegrationCards
@testable import Examples

class ListCardSnapshotTests: XCTestCase {

    func testListCard() throws {
        let card = InlineTestCases.list.manifest()!.card
        if case .list(let listCard) = card {
            assertSnapshot(ListCardView(model: listCard), configs:  [SnapshotTestViewConfig(config: .iPhoneX(.portrait), identifier: "iPhoneX_portrait")], style: .light)
        } else {
            XCTFail("Not the correct card")
        }
    }
}
