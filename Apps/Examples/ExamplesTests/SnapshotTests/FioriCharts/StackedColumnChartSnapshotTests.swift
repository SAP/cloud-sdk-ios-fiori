//
//  StackedColumnChartSnapshotTests.swift
//  ExamplesTests
//
//  Created by Xu, Sheng on 9/28/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class StackedColumnChartSnapshotTests: XCTestCase {

    func testStackedColumnChartPositiveValuesSingleSeries() throws {
        if let chart = Tests.lineModels[0].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testStackedColumnChartPositiveValuesSecondaryYAxis() throws {
        if let chart = Tests.lineModels[1].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testStackedColumnChart6SeriesLongCategoryLabels() throws{
        if let chart = Tests.lineModels[2].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testStackedColumnChartNegativeValuesSingleSelection() throws {
        if let chart = Tests.lineModels[3].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedColumnChartMixedValuesRangeSelection() throws {
        if let chart = Tests.lineModels[4].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedColumnChartMixedValuesCustomSeriesAttributes() throws {
        if let chart = Tests.lineModels[5].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedColumnChartLongXAxisLabels() throws {
        if let chart = Tests.lineModels[6].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedColumnChartContinuousNilValues() throws {
        if let chart = Tests.lineModels[7].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedColumnChartDiscreteNilValues() throws {
        if let chart = Tests.lineModels[8].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedColumnChartDataArrayWithSingleNil() throws {
        if let chart = Tests.lineModels[10].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testStackedColumnChartDataArrayEmpty() throws {
        if let chart = Tests.lineModels[11].copy() as? ChartModel {
            chart.chartType = .stackedColumn
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

}
