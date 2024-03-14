@testable import FioriCharts
import XCTest

class WaterfallChartTests: XCTestCase {
    let model = ChartModel(chartType: .waterfall,
                           data: [[27, 3, 29, -2, -5, 52]],
                           titlesForCategory: [["17 Q1", "New hires", "Transfer-in", "Transfer-out", "Termination", "18 Q1"]],
                           colorsForCategory: [0: [0: .preferredColor(.positiveLabel),
                                                   1: .preferredColor(.positiveLabel),
                                                   2: .preferredColor(.positiveLabel),
                                                   3: .preferredColor(.chart2),
                                                   4: .preferredColor(.chart2),
                                                   5: .preferredColor(.chart1)]],
                           indexesOfTotalsCategories: [5])
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAxisPlotRange() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let axisValues = self.model.numericAxisTickValues
        let plotMin = axisValues.plotMinimum
        let plotMax = axisValues.plotMaximum
        
        XCTAssertTrue(plotMin == 0.0)
        XCTAssertTrue(plotMax == 60.0)
    }
    
    func testPlotData() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = WaterfallChartContext()
        let pd = dataSource.plotData(self.model)
        
        XCTAssertTrue(pd.count == self.model.numOfCategories(in: 0))
        XCTAssertTrue(pd[0].count == self.model.numOfSeries())
    }
    
    func testPlotData2() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        self.model.indexesOfTotalsCategories = [5]
        let axisValues = self.model.numericAxisTickValues
        let dataSource = WaterfallChartContext()
        let pd = dataSource.plotData(self.model)
        
        XCTAssertEqual(pd[2][0].rect.origin.y, 30.0 / axisValues.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[2][0].rect.size.height, 29.0 / axisValues.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[4][0].rect.origin.y, 52.0 / axisValues.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[4][0].rect.size.height, 5.0 / axisValues.plotRange, accuracy: 0.0001)
    }
    
    func testTotalIndex() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // change it
        self.model.indexesOfTotalsCategories = [5]
        
        let dataSource = WaterfallChartContext()
        let pd = dataSource.plotData(self.model)
        
        XCTAssertTrue(pd[0][0].rect.origin.y == 0)
        XCTAssertTrue(pd[5][0].rect.origin.y == 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        let dataSource = ComboChartContext()
        
        self.measure {
            // Put the code you want to measure the time of here.
            for _ in 0 ..< 1000 {
                _ = dataSource.plotData(self.model)
            }
        }
    }
}
