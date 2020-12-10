import SwiftUI
import XCTest

@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class AreaChartSnapshotTests: XCTestCase {
    func testAreaChartPositiveValuesSingleSeries() throws {
        if let chart = Tests.lineModels[0].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testAreaChartPositiveValuesSecondaryYAxis() throws {
        if let chart = Tests.lineModels[1].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testAreaChart6SeriesLongCategoryLabels() throws {
        if let chart = Tests.lineModels[2].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testAreaChartNegativeValuesSingleSelection() throws {
        if let chart = Tests.lineModels[3].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testAreaChartMixedValuesRangeSelection() throws {
        if let chart = Tests.lineModels[4].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testAreaChartMixedValuesCustomSeriesAttributes() throws {
        if let chart = Tests.lineModels[5].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testAreaChartLongXAxisLabels() throws {
        if let chart = Tests.lineModels[6].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testAreaChartContinuousNilValues() throws {
        if let chart = Tests.lineModels[7].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testAreaChartDiscreteNilValues() throws {
        if let chart = Tests.lineModels[8].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testAreaChartDataArrayWithSingleNil() throws {
        if let chart = Tests.lineModels[10].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testAreaChartDataArrayEmpty() throws {
        if let chart = Tests.lineModels[11].copy() as? ChartModel {
            chart.chartType = .area
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
}
