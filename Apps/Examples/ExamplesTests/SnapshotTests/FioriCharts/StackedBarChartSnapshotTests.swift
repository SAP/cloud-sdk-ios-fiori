@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

class StackedBarChartSnapshotTests: XCTestCase {
    func testStackedBarChartPositiveValuesSingleSeries() throws {
        if let chart = Tests.lineModels[0].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testStackedBarChartPositiveValuesSecondaryYAxis() throws {
        if let chart = Tests.lineModels[1].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testStackedBarChart6SeriesLongCategoryLabels() throws {
        if let chart = Tests.lineModels[2].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testStackedBarChartNegativeValuesSingleSelection() throws {
        if let chart = Tests.lineModels[3].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedBarChartMixedValuesRangeSelection() throws {
        if let chart = Tests.lineModels[4].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedBarChartMixedValuesCustomSeriesAttributes() throws {
        if let chart = Tests.lineModels[5].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedBarChartLongXAxisLabels() throws {
        if let chart = Tests.lineModels[6].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedBarChartContinuousNilValues() throws {
        if let chart = Tests.lineModels[7].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedBarChartDiscreteNilValues() throws {
        if let chart = Tests.lineModels[8].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedBarChartDataArrayWithSingleNil() throws {
        if let chart = Tests.lineModels[10].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedBarChartDataArrayEmpty() throws {
        if let chart = Tests.lineModels[11].copy() as? ChartModel {
            chart.chartType = .stackedBar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
}
