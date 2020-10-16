//
//  BubbleChartTests.swift
//  FioriSwiftUITests
//
//  Created by Xu, Sheng on 7/27/20.
//

import XCTest
@testable import FioriCharts

class BubbleChartTests: XCTestCase {
    let model = Tests.bubbleModels[0]
    
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
        let _ = dataSource.plotData(model)
        let axisContext = model.numericAxisTickValues
        
        /// dataMaximum == 282.82751795046147
        XCTAssertEqual(axisContext.dataMaximum, 282.827, accuracy: 0.001 )
        XCTAssertTrue(axisContext.tickValues.count == 4)
        XCTAssertEqual(axisContext.tickValues[0], 300.0, accuracy: 0.001)
        XCTAssertEqual(axisContext.tickValues[1], 200.0, accuracy: 0.001)
    }
    
    func testChangeIsZeroBased() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BubbleChartContext()
        let model2 = Tests.bubbleModels[4]
        let _ = dataSource.plotData(model2)
        let axisContext1 = model2.numericAxisTickValues
        
        // change it
        model2.numericAxis.isZeroBased = false
        let _ = dataSource.plotData(model2)
        let axisContext2 = model2.numericAxisTickValues
        
        XCTAssertEqual(axisContext1.dataMinimum, 0, accuracy: 0.001 )
        XCTAssertEqual(axisContext1.dataMaximum, 2247.26, accuracy: 0.001 )
        XCTAssertEqual(axisContext2.dataMinimum, 1908, accuracy: 0.001 )
        XCTAssertEqual(axisContext2.dataMaximum, 2247.26, accuracy: 0.001 )
    }

    func testCategoryAxisContext() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BubbleChartContext()
        let _ = dataSource.plotData(model)
        if let axisContext = model.categoryAxisTickValues {
            /// dataMaximum == 2016.47
            XCTAssertEqual(axisContext.dataMaximum, 2016.4774, accuracy: 0.001)
            XCTAssertTrue(axisContext.tickValues.count == 3)
            XCTAssertEqual(axisContext.tickValues[0], 2030.0, accuracy: 0.001)
            XCTAssertEqual(axisContext.tickValues[2], 1890.0, accuracy: 0.001)
        }
    }
    
    func testPlotData() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BubbleChartContext()
        let pd = dataSource.plotData(model)

        XCTAssertTrue(pd[0].count == 1)
        XCTAssertEqual(pd[0][0].rect.origin.x, 0.4502, accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.origin.y, 0.3177, accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.size.width, 0.01384, accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.size.height, 0.0138, accuracy: 0.001)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        let dataSource = BubbleChartContext()
        
        self.measure {
            // Put the code you want to measure the time of here.
            for _ in 0 ..< 1000 {
                _ = dataSource.plotData(model)
            }
        }
    }

}
