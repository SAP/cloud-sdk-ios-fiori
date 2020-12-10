@testable import FioriCharts
import XCTest

class ChartAxisAttributesTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChartAxisAttributes() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ab = ChartAxisAttributes(axisId: .x, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil)
 
        XCTAssertEqual(ab.axisId, .x)
    }
    
    func testChartAxisAttributesCopy() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ab = ChartAxisAttributes(axisId: .x, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil)
        let abCopy = ab.copy() as! ChartAxisAttributes
        
        XCTAssertEqual(ab, abCopy)
    }
    
    func testChartNumericAxisAttributes() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ab = ChartNumericAxisAttributes(axisId: .y, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: false, abbreviatesLabels: true, explicitMin: nil, explicitMax: nil, formatter: nil, abbreviatedFormatter: nil)
  
        XCTAssertEqual(ab.axisId, .y)
    }
    
    func testChartNumericAxisAttributesCopy() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ab = ChartNumericAxisAttributes(axisId: .y, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: false, abbreviatesLabels: true, explicitMin: nil, explicitMax: nil, formatter: nil, abbreviatedFormatter: nil)
        let abCopy = ab.copy() as! ChartNumericAxisAttributes
        
        XCTAssertEqual(ab, abCopy)
    }
    
    func testChartCategoryAxisAttributes() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ab = ChartCategoryAxisAttributes(axisId: .x, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: false, abbreviatesLabels: true, explicitMin: nil, explicitMax: nil, formatter: nil, abbreviatedFormatter: nil, labelLayoutStyle: .range)
 
        XCTAssertEqual(ab.axisId, .x)
        XCTAssertEqual(ab.labelLayoutStyle, .range)
    }
    
    func testChartCategoryAxisAttributesCopy() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ab = ChartCategoryAxisAttributes(axisId: .x, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: false, abbreviatesLabels: true, explicitMin: nil, explicitMax: nil, formatter: nil, abbreviatedFormatter: nil, labelLayoutStyle: .range)
        let abCopy = ab.copy() as! ChartCategoryAxisAttributes

        XCTAssertEqual(ab, abCopy)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
