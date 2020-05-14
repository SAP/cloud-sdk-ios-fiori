//
//  ChartModelTests.swift
//  FioriSwiftUITests
//
//  Created by Xu, Sheng on 4/30/20.
//

import XCTest

@testable import FioriCharts
class ChartModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let model = ChartModel(chartType: .line, data: [[nil]])
        XCTAssertEqual(model.chartType, .line)
        XCTAssertEqual(model.data, [[ChartModel.DimensionData.single(nil)]])
        
        let modelCopy = model.copy() as! ChartModel
        
        XCTAssertTrue(model.data == modelCopy.data)
        XCTAssertTrue(model.titlesForCategory == modelCopy.titlesForCategory)
        XCTAssertTrue(model.colorsForCategory == modelCopy.colorsForCategory)
        XCTAssertTrue(model.titlesForAxis == modelCopy.titlesForAxis)
        XCTAssertTrue(model.labelsForDimension == modelCopy.labelsForDimension)
        XCTAssertTrue(model.selectedSeriesIndex == modelCopy.selectedSeriesIndex)
        XCTAssertTrue(model.userInteractionEnabled == modelCopy.userInteractionEnabled)
        XCTAssertTrue(model.seriesAttributes == modelCopy.seriesAttributes)
        XCTAssertTrue(model.categoryAxis == modelCopy.categoryAxis)
        XCTAssertTrue(model.numericAxis == modelCopy.numericAxis)
        XCTAssertTrue(model.secondaryNumericAxis == modelCopy.secondaryNumericAxis)
        XCTAssertTrue(model.indexesOfSecondaryValueAxis == modelCopy.indexesOfSecondaryValueAxis)
        XCTAssertTrue(model.indexesOfColumnSeries == modelCopy.indexesOfColumnSeries)
        XCTAssertTrue(model.indexesOfTotalsCategories == modelCopy.indexesOfTotalsCategories)
    
        XCTAssertEqual(model, modelCopy)
        
        modelCopy.chartType = .area
        XCTAssertTrue(model != modelCopy)
        
        //print(String(describing: modelCopy))
    }
    
    func testInit2() throws {
        let model = ChartModel(chartType: .line,
                               data: [[200, 170, 165, 143, 166, 82, 110],
                                      [45, 20, 50, 40, 60, 45, 55].map { $0 / 100.0 }],
                               titlesForCategory: [["Jan", nil, "Mar", "Apr", "May", "Jun", "Jul"]],
                               titlesForAxis: [ChartAxisId.category: "Month", ChartAxisId.y : "Sales"],
                               numericAxis: ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: NumberFormatter(style: .currency), abbreviatedFormatter: NumberFormatter(style: .currency)),
                               secondaryNumericAxis: ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: NumberFormatter(style: .percent), abbreviatedFormatter: NumberFormatter(style: .percent)),
                               indexesOfSecondaryValueAxis: [1])
        
        let modelCopy = model.copy() as! ChartModel
        XCTAssertTrue(model.data == modelCopy.data)
        XCTAssertTrue(model.titlesForCategory == modelCopy.titlesForCategory)
        XCTAssertTrue(model.colorsForCategory == modelCopy.colorsForCategory)
        XCTAssertTrue(model.titlesForAxis == modelCopy.titlesForAxis)
        XCTAssertTrue(model.labelsForDimension == modelCopy.labelsForDimension)
        XCTAssertTrue(model.selectedSeriesIndex == modelCopy.selectedSeriesIndex)
        XCTAssertTrue(model.userInteractionEnabled == modelCopy.userInteractionEnabled)
        XCTAssertTrue(model.seriesAttributes == modelCopy.seriesAttributes)
        XCTAssertTrue(model.categoryAxis == modelCopy.categoryAxis)
        XCTAssertTrue(model.numericAxis == modelCopy.numericAxis)
        XCTAssertTrue(model.secondaryNumericAxis == modelCopy.secondaryNumericAxis)
        XCTAssertTrue(model.indexesOfSecondaryValueAxis == modelCopy.indexesOfSecondaryValueAxis)
        XCTAssertTrue(model.indexesOfColumnSeries == modelCopy.indexesOfColumnSeries)
        XCTAssertTrue(model.indexesOfTotalsCategories == modelCopy.indexesOfTotalsCategories)
        
        XCTAssertEqual(model, modelCopy)
    }
    
    func testBulletModel() throws {
        let model = ChartModel(chartType: .micro_bullet,
                               data: [[35, nil, 70], [0, 20, 50, 100]],
                               colorsForCategory: [0: [0: Palette.hexColor(for: .chart1), 1: Palette.hexColor(for: .chart2), 2: Palette.hexColor(for: .chart2), 3: Palette.hexColor(for: .chart3)]])
        
        let modelCopy = model.copy() as! ChartModel
        XCTAssertTrue(model.data == modelCopy.data)
        XCTAssertEqual(model, modelCopy)
        //print(String(describing: model))
    }
    
    func testColumnModel() throws {
        let model = ChartModel(chartType: .micro_column,
                               data: [[200, 170, -165, 143, 166, 112, 110]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                               colorsForCategory: [0: [2: Palette.hexColor(for: .negative)]],
                               labelsForDimension: [["$200K", "avg", "-165K", nil, "$166K", "$112K", "$110K"]])
        
        let modelCopy = model.copy() as! ChartModel
        XCTAssertTrue(model.data == modelCopy.data)
        XCTAssertEqual(model, modelCopy)
        //print(String(describing: model))
    }
    
    
    
    func test3DData() throws {
        let model = ChartModel(chartType: .stock,
                               data3d: [[[16.52, 18.48, 19.21, 20.00, 20000], [22.80, 17.20, 17.48, 22.21, 60000], [18.50, 17.20, 17.48, 22.21, 60000], [24.50, 17.20, 17.48, 22.21, 60000]]],
                               titlesForCategory: [["2020-01-06 09:30:00", "2020-01-06 10:00:00", "2020-01-06 10:30:00", "2020-01-06 11:00:00"]])
        
        let modelCopy = model.copy() as! ChartModel
        XCTAssertTrue(model.data == modelCopy.data)
        XCTAssertTrue(model.titlesForCategory == modelCopy.titlesForCategory)
        XCTAssertTrue(model.colorsForCategory == modelCopy.colorsForCategory)
        XCTAssertTrue(model.titlesForAxis == modelCopy.titlesForAxis)
        XCTAssertTrue(model.labelsForDimension == modelCopy.labelsForDimension)
        XCTAssertTrue(model.selectedSeriesIndex == modelCopy.selectedSeriesIndex)
        XCTAssertTrue(model.userInteractionEnabled == modelCopy.userInteractionEnabled)
        XCTAssertTrue(model.seriesAttributes == modelCopy.seriesAttributes)
        XCTAssertTrue(model.categoryAxis == modelCopy.categoryAxis)
        XCTAssertTrue(model.numericAxis == modelCopy.numericAxis)
        XCTAssertTrue(model.secondaryNumericAxis == modelCopy.secondaryNumericAxis)
        XCTAssertTrue(model.indexesOfSecondaryValueAxis == modelCopy.indexesOfSecondaryValueAxis)
        XCTAssertTrue(model.indexesOfColumnSeries == modelCopy.indexesOfColumnSeries)
        XCTAssertTrue(model.indexesOfTotalsCategories == modelCopy.indexesOfTotalsCategories)
        
        XCTAssertEqual(model, modelCopy)
//        print(String(describing: model))
    }
    
    func testCopy() throws {
        let model = ChartModel(chartType: .line,
                               data: [[nil, 220, nil, 250, 200, nil, 230],
                                      [160, nil, 130, 170, nil, 190, 180]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]]
        )
        
        let modelCopy = model.copy() as! ChartModel
        XCTAssertEqual(model, modelCopy)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
