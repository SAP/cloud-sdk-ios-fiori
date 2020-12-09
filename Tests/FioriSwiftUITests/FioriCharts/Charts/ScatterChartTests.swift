//
//  ScatterChartTests.swift
//  FioriSwiftUITests
//
//  Created by Xu, Sheng on 7/30/20.
//

import XCTest
@testable import FioriCharts

class ScatterChartTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumericAxisContext() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BubbleChartContext()
        let model = Tests.scatterModels[0]
        let _ = dataSource.plotData(model)
        let axisContext = model.numericAxisTickValues
        
        /// dataMaximum == 279.85333333333335
        XCTAssertEqual(axisContext.dataMaximum, 279.8533, accuracy: 0.001)
        XCTAssertTrue(axisContext.tickValues.count == 4)
        XCTAssertEqual(axisContext.tickValues[0], 300.0, accuracy: 0.001)
        XCTAssertEqual(axisContext.tickValues[1], 200.0, accuracy: 0.001)
    }
    
    func testChangeIsZeroBased() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BubbleChartContext()
        let model = Tests.scatterModels[4]
        let _ = dataSource.plotData(model)
        let axisContext1 = model.numericAxisTickValues
        
        // change it
        model.numericAxis.isZeroBased = false
        model.plotDataCache = nil
        model.numericAxisTickValuesCache = []
        model.yDataMinimumValue = nil
        model.yDataMaximumValue = nil
        let _ = dataSource.plotData(model)
        let axisContext2 = model.numericAxisTickValues
        
        XCTAssertEqual(axisContext1.dataMinimum, 0, accuracy: 0.001 )
        XCTAssertEqual(axisContext1.dataMaximum, 2025.4133, accuracy: 0.001 )
        XCTAssertEqual(axisContext2.dataMinimum, 1907.3066, accuracy: 0.001 )
        XCTAssertEqual(axisContext2.dataMaximum, 2012.693, accuracy: 0.001 )
    }

    func testCategoryAxisContext() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BubbleChartContext()
        let model = Tests.scatterModels[0]
        let _ = dataSource.plotData(model)
        if let axisContext = model.categoryAxisTickValues {
            /// dataMaximum == 2012.69
            XCTAssertEqual(axisContext.dataMaximum, 2012.6933, accuracy: 0.001)
            XCTAssertTrue(axisContext.tickValues.count == 3)
            XCTAssertEqual(axisContext.tickValues[0], 2030.0, accuracy: 0.001)
            XCTAssertEqual(axisContext.tickValues[2], 1890.0, accuracy: 0.001)
        }
    }
    
    func testPlotData() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BubbleChartContext()
        let model = Tests.scatterModels[0]
        let pd = dataSource.plotData(model)

        XCTAssertTrue(pd[0].count == 143)
        XCTAssertEqual(pd[0][0].rect.origin.x, 0.7828, accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.origin.y, 0.3433, accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.size.width, 0.02, accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.size.height, 0.02, accuracy: 0.001)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        let dataSource = BubbleChartContext()
        let model = Tests.scatterModels[0]
        
        self.measure {
            // Put the code you want to measure the time of here.
            for _ in 0 ..< 1000 {
                _ = dataSource.plotData(model)
            }
        }
    }

}
