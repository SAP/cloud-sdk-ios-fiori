//
//  HexColorTests.swift
//  FioriSwiftUITests
//
//  Created by Xu, Sheng on 4/30/20.
//

@testable import FioriCharts
import XCTest

class HexColorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyInit() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let color = HexColor()
        
        let lightColor = color.rgba(.light)
        XCTAssertEqual(Int(255 * lightColor.r), 0x0)
        XCTAssertEqual(Int(255 * lightColor.g), 0x0)
        XCTAssertEqual(Int(255 * lightColor.b), 0x0)
        XCTAssertEqual(Int(255 * lightColor.a), 0xff)
        
        let darkColor = color.rgba(.dark)
        XCTAssertEqual(Int(255 * darkColor.r), 0xff)
        XCTAssertEqual(Int(255 * darkColor.g), 0xff)
        XCTAssertEqual(Int(255 * darkColor.b), 0xff)
        XCTAssertEqual(Int(255 * darkColor.a), 0xff)
    }
    
    func testInit() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let color = HexColor(lightColor: "12345678", darkColor: "abCDef")
        let lightColor = color.rgba(.light)
        XCTAssertEqual(Int(255 * lightColor.r), 0x12)
        XCTAssertEqual(Int(255 * lightColor.g), 0x34)
        XCTAssertEqual(Int(255 * lightColor.b), 0x56)
        XCTAssertEqual(Int(255 * lightColor.a), 0x78)
        
        let darkColor = color.rgba(.dark)
        XCTAssertEqual(Int(255 * darkColor.r), 0xab)
        XCTAssertEqual(Int(255 * darkColor.g), 0xcd)
        XCTAssertEqual(Int(255 * darkColor.b), 0xef)
        XCTAssertEqual(Int(255 * darkColor.a), 0xff)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
