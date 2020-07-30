//
//  HarveyBallSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/27/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class HarveyBallSnapshotTests: XCTestCase {

    func testHarveyBallChartStandard() throws {
        assertSnapshot(ChartView(Tests.harveyBallModels[0]), for: referenceSize)
    }

    func testHarveyBallChartCloses() throws{
        assertSnapshot(ChartView(Tests.harveyBallModels[1]), for: referenceSize)
    }

    func testHarveyBallChartMoreThan100Percent() throws {
        assertSnapshot(ChartView(Tests.harveyBallModels[2]), for: referenceSize)
    }
}
