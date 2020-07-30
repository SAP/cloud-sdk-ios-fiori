//
//  ObjectCardSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 8/11/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import XCTest
import SwiftUI
@testable import FioriIntegrationCards
@testable import Examples

class ObjectCardSnapshotTests: XCTestCase {

    func testObjectCard() throws {
        let card = InlineTestCases.object.manifest()!.card
        if case .object(let objectCard) = card {
            assertSnapshot(ObjectCardView(model: objectCard), configs:  [SnapshotTestViewConfig(config: .iPhoneX(.portrait), identifier: "iPhoneX_portrait")], style: .light)
        } else {
            XCTFail("Not the correct card")
        }
    }
}
