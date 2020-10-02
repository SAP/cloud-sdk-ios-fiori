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
        XCTAssertTrue(model.numberOfGridlines == modelCopy.numberOfGridlines)
        XCTAssertTrue(model.selectionRequired == modelCopy.selectionRequired)
        XCTAssertTrue(model.snapToPoint == modelCopy.snapToPoint)
        XCTAssertTrue(model.indexOfStockSeries == modelCopy.indexOfStockSeries)
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
        XCTAssertTrue(model.numberOfGridlines == modelCopy.numberOfGridlines)
        XCTAssertTrue(model.selectionRequired == modelCopy.selectionRequired)
        XCTAssertTrue(model.snapToPoint == modelCopy.snapToPoint)
        XCTAssertTrue(model.indexOfStockSeries == modelCopy.indexOfStockSeries)
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
    
    func testConstrainedMaxValues() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let model = ChartModel(chartType: .line, data: [[nil]], numberOfGridlines: 200)
        
        XCTAssertEqual(model.numberOfGridlines, 20)
    }
    
    func testConstrainedMinValues() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let model = ChartModel(chartType: .line, data: [[nil]], numberOfGridlines: -200)
        
        XCTAssertEqual(model.numberOfGridlines, 1)
    }
    
    func testSeriesAttributesOneValue() throws {
        let model = ChartModel(chartType: .line,
                               data: [[200, 170, 165, 143, 166, 112, 110],
                                      [150, 120, 130, 135, 120, 138, 137]])
        
        model.seriesAttributes = [ChartSeriesAttributes()]
        
        XCTAssertTrue(model.seriesAttributes.count == 2)
    }
    
    func testSeriesAttributesEmptyArray() throws {
        let model = ChartModel(chartType: .line,
                               data: [[200, 170, 165, 143, 166, 112, 110],
                                      [150, 120, 130, 135, 120, 138, 137]])
        
        model.seriesAttributes = [ChartSeriesAttributes]()
        
        XCTAssertTrue(model.seriesAttributes.count == 2)
    }
    
    func testSeriesAttributesMoreItemsThanDataCount() throws {
        let model = ChartModel(chartType: .line,
                               data: [[200, 170, 165, 143, 166, 112, 110],
                                      [150, 120, 130, 135, 120, 138, 137]])
        
        model.seriesAttributes = Array(repeating: ChartSeriesAttributes(), count: 5)
        
        XCTAssertTrue(model.seriesAttributes.count == 5)
    }
    
    func testSelections1() throws {
        let model = ChartModel(chartType: .line,
                               data: [[200, 170, 165, 143, 166, 112, 110],
                                      [150, 120, 130, 135, 120, 138, 137]])
        
        let selectionsTriedToSet = [0: [1, 2, 3], 1: [0]]
        model.selections = selectionsTriedToSet
        
        XCTAssertEqual(selectionsTriedToSet, model.selections)
    }
    
    func testSelections2() throws {
        let model = ChartModel(chartType: .line,
                               data: [[200, 170, 165, 143, 166, 112, 110],
                                      [150, 120, 130, 135, 120, 138, 137]])
        
        let selectionsTriedToSet = [2: [1, 2, 3]]
        model.selections = selectionsTriedToSet
        
        XCTAssertEqual(model.selections, nil)
    }
    
    func testSelections3() throws {
        let model = ChartModel(chartType: .line,
                               data: [[200, 170, 165, 143, 166, 112, 110],
                                      [150, 120, 130, 135, 120, 138, 137]])
        
        let selectionsTriedToSet = [0: [1, 2, 2, 3]]
        model.selections = selectionsTriedToSet
        
        XCTAssertEqual(model.selections, nil)
    }
    
    func testSelections4() throws {
        let model = ChartModel(chartType: .line,
                               data: [[200, 170, 165, 143, 166, 112, 110],
                                      [150, 120, 130, 135, 120, 138, 137]])
        
        let selectionsTriedToSet = [1: [1, 2, 3, 20]]
        model.selections = selectionsTriedToSet
        
        XCTAssertEqual(model.selections, nil)
    }
    
    func testBulletModel() throws {
        let model = ChartModel(chartType: .micro_bullet,
                               data: [[35, nil, 70], [0, 20, 50, 100]],
                               colorsForCategory: [0: [0: .preferredColor(.chart1), 1: .preferredColor(.chart2), 2: .preferredColor(.chart2), 3: .preferredColor(.chart3)]])
        
        let modelCopy = model.copy() as! ChartModel
        XCTAssertTrue(model.data == modelCopy.data)
        XCTAssertEqual(model, modelCopy)
        //print(String(describing: model))
    }
    
    func testColumnModel() throws {
        let model = ChartModel(chartType: .micro_column,
                               data: [[200, 170, -165, 143, 166, 112, 110]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                               colorsForCategory: [0: [2: .preferredColor(.negative)]],
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
        XCTAssertTrue(model.numberOfGridlines == modelCopy.numberOfGridlines)
        XCTAssertTrue(model.selectionRequired == modelCopy.selectionRequired)
        XCTAssertTrue(model.snapToPoint == modelCopy.snapToPoint)
        XCTAssertTrue(model.indexOfStockSeries == modelCopy.indexOfStockSeries)
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
    
    func testCreateTickFunc() throws {
        let model = ChartModel(chartType: .line,
                               data: [[22, 30, 40, 50, 65]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May"]]
        )
        
        let axisTickValues = ChartUtility.axisCreateTicks(model, rangeStart: 21, rangeEnd: 66, desiredTickCount: 3, looseLabels: false, fudgeRange: false, adjustToNiceValues: true)
        print(axisTickValues)
        XCTAssertEqual(axisTickValues.dataMinimum, 21)
        XCTAssertEqual(axisTickValues.dataMaximum, 66)
        XCTAssertEqual(axisTickValues.tickMinimum, 20)
        XCTAssertEqual(axisTickValues.tickMaximum, 60)
        XCTAssertEqual(axisTickValues.plotMinimum, 20)
        XCTAssertEqual(axisTickValues.plotMaximum, 66)
        XCTAssertEqual(axisTickValues.tickValues, [60.0, 40.0, 20.0])
    }
    
    func testCreateTickFunc2() throws {
        let model = ChartModel(chartType: .line,
                               data: [[22, 30, 40, 50, 65]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May"]]
        )
        
        let axisTickValues = ChartUtility.axisCreateTicks(model, rangeStart: 20, rangeEnd: 66, desiredTickCount: 3, looseLabels: true, fudgeRange: false, adjustToNiceValues: true)
        print(axisTickValues)
        XCTAssertEqual(axisTickValues.dataMinimum, 20)
        XCTAssertEqual(axisTickValues.dataMaximum, 66)
        XCTAssertEqual(axisTickValues.tickMinimum, 0)
        XCTAssertEqual(axisTickValues.tickMaximum, 80)
        XCTAssertEqual(axisTickValues.plotMinimum, 0)
        XCTAssertEqual(axisTickValues.plotMaximum, 80)
        XCTAssertEqual(axisTickValues.tickValues, [80.0, 40.0, 0.0])
    }
    
    func testCreateTickFunc3() throws {
        let model = ChartModel(chartType: .line,
                               data: [[22, 30, 40, 50, 65]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May"]]
        )
        
        let axisTickValues = ChartUtility.axisCreateTicks(model, rangeStart: 21, rangeEnd: 66, desiredTickCount: 3, looseLabels: true, fudgeRange: false, adjustToNiceValues: true)
        //print(axisTickValues)
        XCTAssertEqual(axisTickValues.dataMinimum, 21)
        XCTAssertEqual(axisTickValues.dataMaximum, 66)
        XCTAssertEqual(axisTickValues.tickMinimum, 20)
        XCTAssertEqual(axisTickValues.tickMaximum, 80)
        XCTAssertEqual(axisTickValues.plotMinimum, 20)
        XCTAssertEqual(axisTickValues.plotMaximum, 80)
        XCTAssertEqual(axisTickValues.tickValues, [80.0, 60.0, 40.0, 20.0])
    }
    
    func testCreateTickFunc4() throws {
        let model = ChartModel(chartType: .line,
                               data: [[22, 30, 40, 50, 65]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May"]]
        )
        
        let axisTickValues = ChartUtility.axisCreateTicks(model, rangeStart: 21, rangeEnd: 66, desiredTickCount: 3, looseLabels: false, fudgeRange: false, adjustToNiceValues: false)
        //print(axisTickValues)
        XCTAssertEqual(axisTickValues.dataMinimum, 21)
        XCTAssertEqual(axisTickValues.dataMaximum, 66)
        XCTAssertEqual(axisTickValues.tickMinimum, 21)
        XCTAssertEqual(axisTickValues.tickMaximum, 66)
        XCTAssertEqual(axisTickValues.plotMinimum, 21)
        XCTAssertEqual(axisTickValues.plotMaximum, 66)
        XCTAssertEqual(axisTickValues.tickValues, [66.0, 43.5, 21.0])
    }
    
    func testCreateTickFunc5() throws {
        let model = ChartModel(chartType: .line,
                               data: [[22, 30, 40, 50, 65]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May"]]
        )
        
        let axisTickValues = ChartUtility.axisCreateTicks(model, rangeStart: 21, rangeEnd: 66, desiredTickCount: 3, looseLabels: false, fudgeRange: true, adjustToNiceValues: false)
        //print(axisTickValues)
        XCTAssertEqual(axisTickValues.dataMinimum, 21)
        XCTAssertEqual(axisTickValues.dataMaximum, 66)
        XCTAssertEqual(axisTickValues.tickMinimum, 19.2)
        XCTAssertEqual(axisTickValues.tickMaximum, 67.8)
        XCTAssertEqual(axisTickValues.plotMinimum, 19.2)
        XCTAssertEqual(axisTickValues.plotMaximum, 67.8)
        XCTAssertEqual(axisTickValues.tickValues, [69.6, 45.3, 21.0])
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
