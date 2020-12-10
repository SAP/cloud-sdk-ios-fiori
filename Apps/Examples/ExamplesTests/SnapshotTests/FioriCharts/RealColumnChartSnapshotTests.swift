@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

class RealColumnChartSnapshotTests: XCTestCase {
    func testColumnChartPositiveValuesSingleSeries() throws {
        if let chart = Tests.lineModels[0].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testColumnChartPositiveValuesSecondaryYAxis() throws {
        if let chart = Tests.lineModels[1].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testColumnChart6SeriesLongCategoryLabels() throws {
        if let chart = Tests.lineModels[2].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testColumnChartNegativeValuesSingleSelection() throws {
        if let chart = Tests.lineModels[3].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testColumnChartMixedValuesRangeSelection() throws {
        if let chart = Tests.lineModels[4].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testColumnChartMixedValuesCustomSeriesAttributes() throws {
        if let chart = Tests.lineModels[5].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testColumnChartLongXAxisLabels() throws {
        if let chart = Tests.lineModels[6].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testColumnChartContinuousNilValues() throws {
        if let chart = Tests.lineModels[7].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testColumnChartDiscreteNilValues() throws {
        if let chart = Tests.lineModels[8].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testColumnChartDataArrayWithSingleNil() throws {
        if let chart = Tests.lineModels[10].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testColumnChartDataArrayEmpty() throws {
        if let chart = Tests.lineModels[11].copy() as? ChartModel {
            chart.chartType = .column
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
}
