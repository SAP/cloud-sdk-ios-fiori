//
//  ChartLabelAttributesTests.swift
//  FioriSwiftUITests
//
//  Created by Xu, Sheng on 4/30/20.
//

@testable import FioriCharts
import XCTest

class ChartLabelAttributesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let labelAttributes = ChartLabelAttributes(color: Palette.hexColor(for: .primary2),
                                                   fontSize: 12,
                                                   offset: 0,
                                                   isHidden: false)
        
        XCTAssertEqual(labelAttributes.color, Palette.hexColor(for: .primary2))
        XCTAssertEqual(labelAttributes.fontSize, 12)
        XCTAssertEqual(labelAttributes.offset, 0)
        XCTAssertEqual(labelAttributes.isHidden, false)
    }

    func testCopy() throws {
        let labelAttributes = ChartLabelAttributes(color: Palette.hexColor(for: .primary2),
                                                   fontSize: 12,
                                                   offset: 0,
                                                   isHidden: true)
        
        let labelAttributesCopy = labelAttributes.copy()as! ChartLabelAttributes
        
        XCTAssertEqual(labelAttributes, labelAttributesCopy)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
