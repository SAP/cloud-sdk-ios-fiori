@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

class StockChartSnapshotTests: XCTestCase {
    func testStockChartSimple() throws {
        assertSnapshot(ChartView(Tests.stockModels[1]), for: referenceSize)
    }

    func testStockChartIntraday() throws {
        assertSnapshot(ChartView(Tests.stockModels[2]), for: referenceSize)
    }

    func testStockChart3DimensionData() throws {
        assertSnapshot(ChartView(Tests.stockModels[3]), for: referenceSize)
    }

    func testStockChartStandard() throws {
        assertSnapshot(ChartView(Tests.stockModels[4]), for: referenceSize)
    }
}
