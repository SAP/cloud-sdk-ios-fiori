@testable import FioriCharts
import SwiftUI
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
        let sp = ChartSeriesPalette(colors: [.preferredColor(.primary2)],
                                    fillColor: .preferredColor(.primary1),
                                    labelColor: .preferredColor(.chart1),
                                    positiveMaxColor: .preferredColor(.chart2),
                                    positiveMinColor: .preferredColor(.chart3),
                                    negativeMaxColor: .preferredColor(.chart4),
                                    negativeMinColor: .preferredColor(.chart5))
        
        XCTAssertEqual(sp.colors.compactMap { $0.resolvedColor(with: .light) }, [Color.preferredColor(.primary2).resolvedColor(with: .light)])
        XCTAssertEqual(sp.fillColor.resolvedColor(with: .light), Color.preferredColor(.primary1).resolvedColor(with: .light))
        XCTAssertEqual(sp.labelColor.resolvedColor(with: .light), Color.preferredColor(.chart1).resolvedColor(with: .light))
        XCTAssertEqual(sp.positiveMaxColor.resolvedColor(with: .light), Color.preferredColor(.chart2).resolvedColor(with: .light))
        XCTAssertEqual(sp.positiveMinColor.resolvedColor(with: .light), Color.preferredColor(.chart3).resolvedColor(with: .light))
        XCTAssertEqual(sp.negativeMaxColor.resolvedColor(with: .light), Color.preferredColor(.chart4).resolvedColor(with: .light))
        XCTAssertEqual(sp.negativeMinColor.resolvedColor(with: .light), Color.preferredColor(.chart5).resolvedColor(with: .light))
    }

    func testInit2() throws {
        let sp = ChartSeriesPalette(colors: [.preferredColor(.primary2)])
        
        XCTAssertEqual(sp.colors.compactMap { $0.resolvedColor(with: .dark) }, [Color.preferredColor(.primary2).resolvedColor(with: .dark)])
        XCTAssertEqual(sp.labelColor.resolvedColor(with: .dark), Color.preferredColor(.primary2).resolvedColor(with: .dark))
        XCTAssertEqual(sp.positiveMaxColor.resolvedColor(with: .dark), Color.preferredColor(.primary2).resolvedColor(with: .dark))
        XCTAssertEqual(sp.positiveMinColor.resolvedColor(with: .dark), Color.preferredColor(.primary2).resolvedColor(with: .dark))
        XCTAssertEqual(sp.negativeMaxColor.resolvedColor(with: .dark), Color.preferredColor(.primary2).resolvedColor(with: .dark))
        XCTAssertEqual(sp.negativeMinColor.resolvedColor(with: .dark), Color.preferredColor(.primary2).resolvedColor(with: .dark))
    }
    
    func testCopy() throws {
        let sp = ChartSeriesPalette(colors: [.preferredColor(.primary2)], fillColor: .preferredColor(.primary1),
                                    labelColor: .preferredColor(.chart1),
                                    positiveMaxColor: .preferredColor(.chart2),
                                    positiveMinColor: .preferredColor(.chart3),
                                    negativeMaxColor: .preferredColor(.chart4),
                                    negativeMinColor: .preferredColor(.chart5))
        
        let spCopy = sp.copy() as! ChartSeriesPalette
        XCTAssertEqual(sp, spCopy)
    }
}
