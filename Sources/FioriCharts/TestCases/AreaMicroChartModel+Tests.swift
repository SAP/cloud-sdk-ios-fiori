import SwiftUI

extension AreaMicroChartModel {
    static let chartPoints = AreaMicroChartModel.Item(points: [.zero, .init(x: 30, y: 20), .init(x: 60, y: 20), .init(x: 100, y: 80)])
    static let targetPoints = AreaMicroChartModel.Item(.target,
                                                       points: [.zero, CGPoint(x: 30, y: 30), CGPoint(x: 60, y: 40), CGPoint(x: 100, y: 90)])
    static let maxThreshold = AreaMicroChartModel.Item(.maxFill,
                                                       color: .green,
                                                       points: [.zero, CGPoint(x: 30, y: 40), CGPoint(x: 60, y: 50), CGPoint(x: 100, y: 100)])
    static let minThreshold = AreaMicroChartModel.Item(.minFill,
                                                       color: .red,
                                                       points: [.zero, CGPoint(x: 30, y: 20), CGPoint(x: 60, y: 30), CGPoint(x: 100, y: 70)])
    
    static let test1 = AreaMicroChartModel(firstXLabel: Text("June 1").foregroundColor(.green),
                                           lastXLabel: Text("June 30").foregroundColor(.yellow),
                                           firstYLabel: Text("0M").foregroundColor(.green),
                                           lastYLabel: Text("80M").foregroundColor(.yellow),
                                           chartPoints: chartPoints,
                                           targetPoints: targetPoints,
                                           minThreshold: AreaMicroChartModel.Item(.minFill,
                                                                                  color: .red,
                                                                                  points: [
                                                                                      .zero,
                                                                                      CGPoint(x: 30, y: 20),
                                                                                      CGPoint(x: 60, y: 30),
                                                                                      CGPoint(x: 100, y: 70)
                                                                                  ]),
                                           maxThreshold: AreaMicroChartModel.Item(.maxFill,
                                                                                  color: .green,
                                                                                  points: [
                                                                                      .zero,
                                                                                      CGPoint(x: 30, y: 40),
                                                                                      CGPoint(x: 60, y: 50),
                                                                                      CGPoint(x: 100, y: 100)
                                                                                  ]))
        
    static let test2 = AreaMicroChartModel(chartPoints: AreaMicroChartModel.Item(points: [.zero,
                                                                                          CGPoint(x: 30, y: 20),
                                                                                          CGPoint(x: 60, y: 20),
                                                                                          CGPoint(x: 100, y: 80)]),
    targetPoints: AreaMicroChartModel.Item(.target,
                                           points: [CGPoint(x: 0, y: 0),
                                                    CGPoint(x: 100, y: 55)]))
    
    static let test3 = AreaMicroChartModel(firstXLabel: Text("June 1").foregroundColor(.green),
                                           lastXLabel: Text("June 30").foregroundColor(.green),
                                           firstYLabel: Text("30M").foregroundColor(.green),
                                           lastYLabel: Text("70M").foregroundColor(.green),
                                           minLabel: Text("25M").foregroundColor(.yellow),
                                           maxLabel: Text("70M").foregroundColor(.green),
                                           chartPoints: AreaMicroChartModel.Item(points: [
                                               CGPoint(x: 0, y: 30),
                                               CGPoint(x: 20, y: 45),
                                               CGPoint(x: 40, y: 40),
                                               CGPoint(x: 60, y: 25),
                                               CGPoint(x: 80, y: 65),
                                               CGPoint(x: 100, y: 70)
                                           ]),
                                           targetPoints: AreaMicroChartModel.Item(.target,
                                                                                  points: [
                                                                                      CGPoint(x: 0, y: 40),
                                                                                      CGPoint(x: 100, y: 60)
                                                                                  ]),
                                           minThreshold: AreaMicroChartModel.Item(.minFill,
                                                                                  color: .red,
                                                                                  points: [
                                                                                      CGPoint(x: 0, y: 20),
                                                                                      CGPoint(x: 15, y: 40),
                                                                                      CGPoint(x: 100, y: 10)
                                                                                  ]),
                                           maxThreshold: AreaMicroChartModel.Item(.maxFill,
                                                                                  color: .red,
                                                                                  points: [
                                                                                      CGPoint(x: 0, y: 60),
                                                                                      CGPoint(x: 100, y: 100)
                                                                                  ]),
                                           innerMinThreshold: AreaMicroChartModel.Item(.innerMinFill,
                                                                                       color: .green,
                                                                                       points: [
                                                                                           CGPoint(x: 0, y: 30),
                                                                                           CGPoint(x: 100, y: 30)
                                                                                       ]),
                                           innerMaxThreshold: AreaMicroChartModel.Item(.innerMaxFill,
                                                                                       color: .green,
                                                                                       points: [
                                                                                           CGPoint(x: 0, y: 50),
                                                                                           CGPoint(x: 100, y: 80)
                                                                                       ]),
                                           minXValue: 0,
                                           maxXValue: 100,
                                           minYValue: 0,
                                           maxYValue: 100)
    
    static let test4 = AreaMicroChartModel(firstXLabel: Text("June 1").foregroundColor(.green),
                                           lastXLabel: Text("June 30").foregroundColor(.green),
                                           firstYLabel: Text("30M").foregroundColor(.green),
                                           lastYLabel: Text("70M").foregroundColor(.green),
                                           minLabel: Text("25M").foregroundColor(.yellow),
                                           maxLabel: Text("70M").foregroundColor(.green))
    
    /// test cases for area chart
    public static let allCases: [AreaMicroChartModel] = [.test1, .test2, .test3, .test4]
}
