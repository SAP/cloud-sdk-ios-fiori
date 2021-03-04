@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

class HarveyBallSnapshotTests: XCTestCase {
    func testHarveyBallChartStandard() throws {
        assertSnapshot(ChartView(Tests.harveyBallModels[0]), for: referenceSize)
    }

    func testHarveyBallChartCloses() throws {
        assertSnapshot(ChartView(Tests.harveyBallModels[1]), for: referenceSize)
    }

    func testHarveyBallChartMoreThan100Percent() throws {
        assertSnapshot(ChartView(Tests.harveyBallModels[2]), for: referenceSize)
    }
}
