import SwiftUI

struct ChartBoundaryKey: EnvironmentKey {
    static let defaultValue: CGRect = .zero
}

extension EnvironmentValues {
    var chartBoundingBox: CGRect {
        get { self[ChartBoundaryKey.self] }
        set { self[ChartBoundaryKey.self] = newValue }
    }
}

/* extension EnvironmentValues {
     var bulletMicroChartModel: BulletMicroChart.Model {
         get { return self[BulletMicroChart.ModelKey.self] }
         set { self[BulletMicroChart.ModelKey.self] = newValue }
     }
 } */
