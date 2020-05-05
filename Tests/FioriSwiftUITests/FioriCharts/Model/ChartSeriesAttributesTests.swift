//
//  ChartSeriesAttributesTests.swift
//  FioriSwiftUITests
//
//  Created by Xu, Sheng on 4/30/20.
//

@testable import FioriCharts
import XCTest

class ChartSeriesAttributesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        /*
         palette: ChartSeriesPalette? = nil,
         lineWidth: Double = 1,
         point: ChartPointAttributes? = nil,
         firstLineCapDiameter: Double = 0,
         lastLineCapDiameter: Double = 0)
         */
        let sa = ChartSeriesAttributes(palette: nil, lineWidth: 3, point: nil, firstLineCapDiameter: 2, lastLineCapDiameter: 4)
        
        XCTAssertEqual(sa.lineWidth, 3.0)
        XCTAssertEqual(sa.firstLineCapDiameter, 2.0)
        XCTAssertEqual(sa.lastLineCapDiameter, 4.0)
        
        let saCopy = sa.copy() as! ChartSeriesAttributes
        XCTAssertEqual(sa, saCopy)
        
        saCopy.lineWidth = 5
        XCTAssertTrue(sa != saCopy)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
