//
//  BulletChartSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/27/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class BulletChartSnapshotTests: XCTestCase {

    func testBulletChartStandard() throws {
        assertSnapshot(ChartView(Tests.bulletModles[0]), for: referenceSize)
    }

    func testBulletChartCustomizedColorsForCategory() throws{
        assertSnapshot(ChartView(Tests.bulletModles[1]), for: referenceSize)
    }
}
