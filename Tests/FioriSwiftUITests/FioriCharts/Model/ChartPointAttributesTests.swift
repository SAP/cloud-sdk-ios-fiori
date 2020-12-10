@testable import FioriCharts
import SwiftUI
import XCTest

class ChartPointAttributesTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pa = ChartPointAttributes(isHidden: false, diameter: 2, strokeColor: .preferredColor(.chart8), gap: 1)
        
        XCTAssertEqual(pa.isHidden, false)
        XCTAssertEqual(pa.diameter, 2.0)
        XCTAssertEqual(pa.strokeColor.resolvedColor(with: .light), Color.preferredColor(.chart8).resolvedColor(with: .light))
        XCTAssertEqual(pa.gap, 1.0)
    }
    
    func testConstrainedMaxValues() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pa = ChartPointAttributes(isHidden: false, diameter: 200, strokeColor: .preferredColor(.chart8), gap: 200)
        
        XCTAssertEqual(pa.diameter, 100)
        XCTAssertEqual(pa.gap, 100)
    }
    
    func testConstrainedMinValues() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pa = ChartPointAttributes(isHidden: false, diameter: -200, strokeColor: .preferredColor(.chart8), gap: -200)
        
        XCTAssertEqual(pa.diameter, 0)
        XCTAssertEqual(pa.strokeColor.resolvedColor(with: .light), Color.preferredColor(.chart8).resolvedColor(with: .light))
        XCTAssertEqual(pa.gap, 0)
    }
    
    func testCopy() throws {
        let pa = ChartPointAttributes(isHidden: false, diameter: 2, strokeColor: .preferredColor(.chart8), gap: 1)
        
        let paCopy = pa.copy() as! ChartPointAttributes
        
        XCTAssertEqual(pa, paCopy)
    }
}
