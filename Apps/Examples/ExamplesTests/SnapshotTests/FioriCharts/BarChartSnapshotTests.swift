//
//  BarChartSnapshotTests.swift
//  ExamplesTests
//
//  Created by Xu, Sheng on 9/28/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class BarChartSnapshotTests: XCTestCase {

    func testBarChartPositiveValuesSingleSeries() throws {
        if let chart = Tests.lineModels[0].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testBarChartPositiveValuesSecondaryYAxis() throws {
        if let chart = Tests.lineModels[1].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testBarChart6SeriesLongCategoryLabels() throws{
        if let chart = Tests.lineModels[2].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

    func testBarChartNegativeValuesSingleSelection() throws {
        if let chart = Tests.lineModels[3].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testBarChartMixedValuesRangeSelection() throws {
        if let chart = Tests.lineModels[4].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testBarChartMixedValuesCustomSeriesAttributes() throws {
        if let chart = Tests.lineModels[5].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testBarChartLongXAxisLabels() throws {
        if let chart = Tests.lineModels[6].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testBarChartContinuousNilValues() throws {
        if let chart = Tests.lineModels[7].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testBarChartDiscreteNilValues() throws {
        if let chart = Tests.lineModels[8].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testBarChartDataArrayWithSingleNil() throws {
        if let chart = Tests.lineModels[10].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }
    
    func testBarChartDataArrayEmpty() throws {
        if let chart = Tests.lineModels[11].copy() as? ChartModel {
            chart.chartType = .bar
            
            assertSnapshot(ChartView(chart), for: referenceSize)
        }
    }

}
