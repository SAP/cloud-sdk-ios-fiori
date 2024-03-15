@testable import FioriCharts
import XCTest

// swiftlint:disable force_unwrapping
class ComboChartTests: XCTestCase {
    let model1 = ChartModel(chartType: .combo,
                            data: [[200, 170, 165, 143, 166, 112, 110],
                                   [150, 120, 130, 135, 120, 138, 137]],
                            titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                            indexesOfSecondaryValueAxis: [1],
                            indexesOfColumnSeries: [0])
    
    let model2 = ChartModel(chartType: .combo,
                            data: [[2.50, 2.20, 1.60, 2.80, 1.70, 0.90, 0.80, 1.95, 1.75, 1.33, 2.44, 1.40, 1.25, 1.80].map { $0 * 100 },
                                   [1.95, 1.75, 1.33, 2.44, 1.40, 1.25, 1.90, 1.65, 1.85, 1.43, 1.64, 1.74, 1.55, 1.68].map { $0 * 100 },
                                   [2.62, 2.25, 1.90, 2.48, 1.87, 0.92, 1.28, 1.35, 1.45, 1.53, 2.04, 1.94, 1.85, 1.65].map { $0 * 100 },
                                   [1.65, 1.95, 1.63, 2.04, 1.74, 1.65, 1.38, 1.75, 1.70, 1.63, 2.14, 1.64, 1.45, 1.50].map { $0 * 100 },
                                   [2.25, 2.02, 1.86, 2.28, 1.37, 1.29, 0.88, 1.05, 1.15, 1.30, 1.54, 1.84, 1.45, 1.60].map { $0 * 100 },
                                   [1.15, 1.35, 1.73, 2.24, 1.84, 1.55, 1.98, 2.15, 2.35, 2.45, 2.40, 2.00, 1.55, 1.20].map { $0 * 100 }],
                            titlesForCategory: [["Adam Humprey", "Jimmy Patrick", "Franck Syren", "Alex Kilgo", "Kim Kilgo", "Sean Long", "Flash Ek-Ularnpun", "Lili Lin", "Luka Ning", "Rodhan Hickey", "Natasha Girotra", "Megan Zurcher", "Joan Wood", "Stanley Thomas Stadelman Jr."]],
                            indexesOfSecondaryValueAxis: [3, 4, 5],
                            indexesOfColumnSeries: [0, 1, 2])
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlotData() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dataSource = ComboChartContext()
        let pd = dataSource.plotData(self.model1)

        XCTAssertTrue(pd.count == self.model1.numOfCategories(in: 0))
        XCTAssertTrue(pd[0].count == self.model1.numOfSeries())
    }
    
    func testColumnIndex() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // change it
        self.model1.indexesOfColumnSeries = [1]
        
        let dataSource = ComboChartContext()
        let pd = dataSource.plotData(self.model1)
        
        let plotRectData: ChartPlotRectData? = pd[0][1].plotRectData
        let plotPointData: ChartPlotPointData? = pd[0][0].plotPointData
        
        XCTAssertTrue(plotRectData != nil)
        XCTAssertTrue(plotPointData != nil)
    }
    
    func testColumnIndex2() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // change it
        self.model2.indexesOfColumnSeries = [1, 3, 5]
        
        let dataSource = ComboChartContext()
        let pd = dataSource.plotData(self.model2)
        
        let plotRectData1: ChartPlotRectData? = pd[0][1].plotRectData
        let plotRectData3: ChartPlotRectData? = pd[0][3].plotRectData
        let plotRectData5: ChartPlotRectData? = pd[0][5].plotRectData
        
        let plotPointData0: ChartPlotPointData? = pd[0][0].plotPointData
        let plotPointData2: ChartPlotPointData? = pd[0][2].plotPointData
        let plotPointData4: ChartPlotPointData? = pd[0][4].plotPointData
        
        XCTAssertTrue(plotRectData1 != nil)
        XCTAssertTrue(plotRectData3 != nil)
        XCTAssertTrue(plotRectData5 != nil)
        
        XCTAssertTrue(plotPointData0 != nil)
        XCTAssertTrue(plotPointData2 != nil)
        XCTAssertTrue(plotPointData4 != nil)
    }
    
    func testColumnWithDifferentAxisPositiveValues() throws {
        let model = ChartModel(chartType: .combo,
                               data: [[200, 120, 165, 143, 166, 130, 110],
                                      [150, 120, 130, 135, 120, 138, 137]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                               indexesOfSecondaryValueAxis: [1],
                               indexesOfColumnSeries: [0, 1])
        
        let dataSource = ComboChartContext()
        let pd = dataSource.plotData(model)
        
        let axisValue1 = model.numericAxisTickValues
        let axisValue2 = model.secondaryNumericAxisTickValues
        
        XCTAssertEqual(pd[1][0].rect.size.height, model.data[0][1].first!! / axisValue1.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[1][1].rect.size.height, model.data[1][1].first!! / axisValue2.plotRange, accuracy: 0.0001)
    }
    
    func testColumnWithDifferentAxisNegativeValues() throws {
        let model = ChartModel(chartType: .combo,
                               data: [[200, 120, 165, 143, 166, 130, 110].map { -$0 },
                                      [150, 120, 130, 135, 120, 138, 137].map { -$0 }],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                               indexesOfSecondaryValueAxis: [1],
                               indexesOfColumnSeries: [0, 1])
        
        let dataSource = ComboChartContext()
        let pd = dataSource.plotData(model)
        
        let axisValue1 = model.numericAxisTickValues
        let axisValue2 = model.secondaryNumericAxisTickValues
        
        XCTAssertEqual(pd[1][0].rect.size.height, abs(model.data[0][1].first!!) / axisValue1.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[1][1].rect.size.height, abs(model.data[1][1].first!!) / axisValue2.plotRange, accuracy: 0.0001)
    }
    
    func testColumnWithDifferentAxisMixedValues() throws {
        let model = ChartModel(chartType: .combo,
                               data: [[200, 120, 165, 143, 166, 130, 110].map { $0 * ($0 > 150 ? 1 : -1) },
                                      [150, 120, 130, 135, 120, 138, 137]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                               indexesOfSecondaryValueAxis: [1],
                               indexesOfColumnSeries: [0, 1])
        
        let dataSource = ComboChartContext()
        let pd = dataSource.plotData(model)
        
        let axisValue1 = model.numericAxisTickValues
        let axisValue2 = model.secondaryNumericAxisTickValues
        
        XCTAssertEqual(pd[1][0].rect.size.height, abs(model.data[0][1].first!!) / axisValue1.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[1][1].rect.size.height, model.data[1][1].first!! / axisValue2.plotRange, accuracy: 0.0001)
    }
    
    func testSecondaryAxis() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // change it
        self.model2.indexesOfColumnSeries = [0, 1, 2, 3, 4]
        self.model2.indexesOfSecondaryValueAxis = [1, 3, 4]
        
        let dataSource = ComboChartContext()
        let pd = dataSource.plotData(self.model2)
        
        let axisValue1 = self.model2.numericAxisTickValues
        let axisValue2 = self.model2.secondaryNumericAxisTickValues
        
        XCTAssertEqual(pd[0][0].rect.size.height, self.model2.data[0][0].first!! / axisValue1.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][1].rect.size.height, self.model2.data[1][0].first!! / axisValue2.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][2].rect.size.height, self.model2.data[2][0].first!! / axisValue1.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][3].rect.size.height, self.model2.data[3][0].first!! / axisValue2.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][4].rect.size.height, self.model2.data[4][0].first!! / axisValue2.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][5].rect.size.height, 0, accuracy: 0.0001)
    }
    
    func testAllPrimaryNumericAxis() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // change it
        self.model2.indexesOfColumnSeries = [0, 2, 4]
        self.model2.indexesOfSecondaryValueAxis = []
        
        let dataSource = ComboChartContext()
        let pd = dataSource.plotData(self.model2)
        
        let axisValue1 = self.model2.numericAxisTickValues
        
        XCTAssertEqual(pd[0][0].rect.size.height, self.model2.data[0][0].first!! / axisValue1.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][1].rect.size.height, 0, accuracy: 0.0001)
        XCTAssertEqual(pd[0][2].rect.size.height, self.model2.data[2][0].first!! / axisValue1.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][3].rect.size.height, 0, accuracy: 0.0001)
        XCTAssertEqual(pd[0][4].rect.size.height, self.model2.data[4][0].first!! / axisValue1.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][5].rect.size.height, 0, accuracy: 0.0001)
    }
    
    func testAllSecondaryNumericAxis() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // change it
        self.model2.indexesOfColumnSeries = [0, 1, 2, 4]
        self.model2.indexesOfSecondaryValueAxis = [0, 1, 2, 3, 4, 5]
        
        let dataSource = ComboChartContext()
        let pd = dataSource.plotData(self.model2)
        
        let axisValue2 = self.model2.secondaryNumericAxisTickValues
        
        XCTAssertEqual(pd[0][0].rect.size.height, self.model2.data[0][0].first!! / axisValue2.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][1].rect.size.height, self.model2.data[1][0].first!! / axisValue2.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][2].rect.size.height, self.model2.data[2][0].first!! / axisValue2.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][3].rect.size.height, 0, accuracy: 0.0001)
        XCTAssertEqual(pd[0][4].rect.size.height, self.model2.data[4][0].first!! / axisValue2.plotRange, accuracy: 0.0001)
        XCTAssertEqual(pd[0][5].rect.size.height, 0, accuracy: 0.0001)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        let dataSource = ComboChartContext()
        
        self.measure {
            // Put the code you want to measure the time of here.
            for _ in 0 ..< 1000 {
                _ = dataSource.plotData(self.model2)
            }
        }
    }
}
