//
//  BarChartTests.swift
//  FioriSwiftUITests
//
//  Created by Xu, Sheng on 8/13/20.
//

import XCTest
@testable import FioriCharts

class BarChartTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumericAxisContext() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //let dataSource = BarAxisDataSource()
        let model = Tests.lineModels[0]
        model.chartType = .bar
        //let _ = dataSource.plotData(model)
        let axisContext = model.numericAxisTickValues
        
        /// dataMaximum == 279.85333333333335
        XCTAssertEqual(axisContext.dataMaximum, 200, accuracy: 0.0001)
        XCTAssertTrue(axisContext.tickValues.count == 3)
        XCTAssertEqual(axisContext.tickValues[0], 200, accuracy: 0.1)
        XCTAssertEqual(axisContext.tickValues[1], 100, accuracy: 0.1)
    }
    
    func testChangeIsZeroBased() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //let dataSource = BarAxisDataSource()
        let model = Tests.lineModels[0].copy() as! ChartModel
        model.chartType = .bar
        let axisContext1 = model.numericAxisTickValues
        
        // change it
        model.numericAxis.isZeroBased = false
        let axisContext2 = model.numericAxisTickValues
        
        XCTAssertEqual(axisContext1.dataMinimum, 0, accuracy: 0.01 )
        XCTAssertTrue(axisContext2.tickValues.count == 3)
        XCTAssertEqual(axisContext2.tickValues[0], 200, accuracy: 0.1)
        XCTAssertEqual(axisContext2.tickValues[1], 100, accuracy: 0.1)
    }

    func testYAxisLabels() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BarAxisDataSource()
        let model = Tests.lineModels[0]
        model.chartType = .bar
        let labels = dataSource.yAxisLabels(model, rect: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        XCTAssertTrue(labels[0].title == "Jan")
        XCTAssertTrue(labels[6].title == "Jul")
    }
    
    func testPositiveValuesPlotData() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BarAxisDataSource()
        let model = Tests.lineModels[0]
        model.chartType = .bar
        let pd = dataSource.plotData(model)

        XCTAssertTrue(pd[0].count == 1)
        XCTAssertEqual(pd[0][0].rect.origin.x, 0, accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.origin.y, 0 , accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.size.width, 1.0 , accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.size.height, 0.111 , accuracy: 0.001)
        
        XCTAssertEqual(pd[1][0].rect.origin.x, 0, accuracy: 0.001)
        XCTAssertEqual(pd[1][0].rect.origin.y, 0.1481 , accuracy: 0.001)
        XCTAssertEqual(pd[1][0].rect.size.width, 0.85 , accuracy: 0.001)
        XCTAssertEqual(pd[1][0].rect.size.height, 0.111 , accuracy: 0.001)
    }
    
    func testNegativeValuesPlotData() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BarAxisDataSource()
        let model = Tests.lineModels[3]
        model.chartType = .bar
        let pd = dataSource.plotData(model)

        XCTAssertTrue(pd[0].count == 2)
        XCTAssertEqual(pd[0][0].rect.origin.x, 0.5909, accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.origin.y, 0 , accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.size.width, 0.409 , accuracy: 0.001)
        XCTAssertEqual(pd[0][0].rect.size.height, 0.0319 , accuracy: 0.001)
        
        XCTAssertEqual(pd[1][1].rect.origin.x, 0.159, accuracy: 0.001)
        XCTAssertEqual(pd[1][1].rect.origin.y, 0.1170 , accuracy: 0.001)
        XCTAssertEqual(pd[1][1].rect.size.width, 0.8409 , accuracy: 0.001)
        XCTAssertEqual(pd[1][1].rect.size.height, 0.0319 , accuracy: 0.001)
    }
    
    func testMixedValuesPlotData() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = BarAxisDataSource()
        let model = Tests.lineModels[4]
        model.chartType = .bar
        let pd = dataSource.plotData(model)

        XCTAssertTrue(pd[0].count == 2)
        XCTAssertEqual(pd[4][0].rect.origin.x, 0.3333, accuracy: 0.001)
        XCTAssertEqual(pd[4][0].rect.origin.y, 0.3404 , accuracy: 0.001)
        XCTAssertEqual(pd[4][0].rect.size.width, 0.1428 , accuracy: 0.001)
        XCTAssertEqual(pd[4][0].rect.size.height, 0.0319 , accuracy: 0.001)
        
        XCTAssertEqual(pd[4][1].rect.origin.x, 0.47619, accuracy: 0.001)
        XCTAssertEqual(pd[4][1].rect.origin.y, 0.3723 , accuracy: 0.001)
        XCTAssertEqual(pd[4][1].rect.size.width, 0.3928 , accuracy: 0.001)
        XCTAssertEqual(pd[4][1].rect.size.height, 0.0319 , accuracy: 0.001)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        let dataSource = BarAxisDataSource()
        let model = Tests.lineModels[0].copy() as! ChartModel
        model.chartType = .bar
        
        self.measure {
            // Put the code you want to measure the time of here.
            for _ in 0 ..< 1000 {
                let _ = dataSource.plotData(model)
            }
        }
    }

}
