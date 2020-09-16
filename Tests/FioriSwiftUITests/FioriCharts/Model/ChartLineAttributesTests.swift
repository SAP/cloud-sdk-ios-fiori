//
//  ChartLineAttributesTests.swift
//  FioriSwiftUITests
//
//  Created by Xu, Sheng on 4/30/20.
//

@testable import FioriCharts
import XCTest

class ChartLineAttributesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChartGridlineAttributes() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ga = ChartGridlineAttributes(width: 2, color: .gray, dashPatternLength: 1, dashPatternGap: 0, isHidden: true)
        
        XCTAssertEqual(ga.width, 2.0)
        XCTAssertEqual(ga.color, .gray)
        XCTAssertEqual(ga.dashPatternLength, 1.0)
        XCTAssertEqual(ga.dashPatternGap, 0.0)
        XCTAssertEqual(ga.isHidden, true)
    }
    
    func testConstrainedMaxValues() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ga = ChartGridlineAttributes(width: 30, color: .gray, dashPatternLength: 200, dashPatternGap: 200, isHidden: true)
        
        XCTAssertEqual(ga.width, 20)
        XCTAssertEqual(ga.dashPatternLength, 20)
        XCTAssertEqual(ga.dashPatternGap, 20)
    }
    
    func testConstrainedMinValues() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ga = ChartGridlineAttributes(width: -30, color: .gray, dashPatternLength: -200, dashPatternGap: -200, isHidden: true)
        
        XCTAssertEqual(ga.width, 0)
        XCTAssertEqual(ga.dashPatternLength, 0)
        XCTAssertEqual(ga.dashPatternGap, 00)
    }
    
    func testChartGridlineAttributesCopy() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ga = ChartGridlineAttributes(width: 2, color: .preferredColor(.chart1), dashPatternLength: 1, dashPatternGap: 0, isHidden: true)
        
        let gaCopy = ga.copy() as! ChartGridlineAttributes
        XCTAssertEqual(ga, gaCopy)
        
        gaCopy.isHidden = false
        XCTAssertTrue(ga != gaCopy)
    }
    
    func testChartBaselineAttributes() throws {
        let ga = ChartBaselineAttributes(width: 2, color: .gray, dashPatternLength: 1, dashPatternGap: 0, isHidden: false, value: 0, position: 2)
        
        XCTAssertEqual(ga.width, 2.0)
        XCTAssertEqual(ga.color, .gray)
        XCTAssertEqual(ga.dashPatternLength, 1.0)
        XCTAssertEqual(ga.dashPatternGap, 0.0)
        XCTAssertEqual(ga.isHidden, false)
        XCTAssertEqual(ga.value, 0.0)
        XCTAssertEqual(ga.position, 2.0)
    }
    
    func testChartBaselineAttributesCopy() throws {
        let ga = ChartBaselineAttributes(width: 2, color: .preferredColor(.chart1), dashPatternLength: 1, dashPatternGap: 0, isHidden: false, value: 0, position: 2)
        
        let gaCopy = ga.copy() as! ChartBaselineAttributes
        XCTAssertEqual(ga, gaCopy)
        
        gaCopy.isHidden = true
        XCTAssertTrue(ga != gaCopy)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
