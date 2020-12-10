@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

class BulletChartSnapshotTests: XCTestCase {
    func testBulletChartStandard() throws {
        assertSnapshot(ChartView(Tests.bulletModles[0]), for: referenceSize)
    }

    func testBulletChartCustomizedColorsForCategory() throws {
        assertSnapshot(ChartView(Tests.bulletModles[1]), for: referenceSize)
    }
}
