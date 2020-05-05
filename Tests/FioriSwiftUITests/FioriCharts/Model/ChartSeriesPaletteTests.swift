//
//  ChartSeriesPaletteTests.swift
//  FioriSwiftUITests
//
//  Created by Xu, Sheng on 4/30/20.
//

@testable import FioriCharts
import XCTest

class ChartSeriesPaletteTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let sp = ChartSeriesPalette(colors: [Palette.hexColor(for: .primary2)],
                                    labelColor: HexColor(lightColor: "121212", darkColor: "ffffffff"),
                                    positiveMaxColor: HexColor(lightColor: "112233", darkColor: "345678"),
                                    positiveMinColor: HexColor(lightColor: "220011", darkColor: "abcdef"),
                                    negativeMaxColor: HexColor(lightColor: "556677", darkColor: "6600ff12"),
                                    negativeMinColor: HexColor(lightColor: "778899", darkColor: "880099cc"))
        
        XCTAssertEqual(sp.colors, [Palette.hexColor(for: .primary2)])
        XCTAssertEqual(sp.labelColor, HexColor(lightColor: "121212", darkColor: "ffffffff"))
        XCTAssertEqual(sp.positiveMaxColor, HexColor(lightColor: "112233", darkColor: "345678"))
        XCTAssertEqual(sp.positiveMinColor, HexColor(lightColor: "220011", darkColor: "abcdef"))
        XCTAssertEqual(sp.negativeMaxColor, HexColor(lightColor: "556677", darkColor: "6600ff12"))
        XCTAssertEqual(sp.negativeMinColor, HexColor(lightColor: "778899", darkColor: "880099cc"))
    }

    func testInit2() throws {
        let sp = ChartSeriesPalette(colors: [Palette.hexColor(for: .primary2)])
        
        XCTAssertEqual(sp.colors, [Palette.hexColor(for: .primary2)])
        XCTAssertEqual(sp.labelColor, Palette.hexColor(for: .primary2))
        XCTAssertEqual(sp.positiveMaxColor, Palette.hexColor(for: .primary2))
        XCTAssertEqual(sp.positiveMinColor, Palette.hexColor(for: .primary2))
        XCTAssertEqual(sp.negativeMaxColor, Palette.hexColor(for: .primary2))
        XCTAssertEqual(sp.negativeMinColor, Palette.hexColor(for: .primary2))
    }
    
    func testCopy() throws {
        let sp = ChartSeriesPalette(colors: [Palette.hexColor(for: .primary2)],
                                    labelColor: HexColor(lightColor: "121212", darkColor: "ffffffff"),
                                    positiveMaxColor: HexColor(lightColor: "112233", darkColor: "345678"),
                                    positiveMinColor: HexColor(lightColor: "220011", darkColor: "abcdef"),
                                    negativeMaxColor: HexColor(lightColor: "556677", darkColor: "6600ff12"),
                                    negativeMinColor: HexColor(lightColor: "778899", darkColor: "880099cc"))
        
        let spCopy = sp.copy() as! ChartSeriesPalette
        XCTAssertEqual(sp, spCopy)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
