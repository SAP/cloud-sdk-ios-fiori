import SwiftUI

struct ColumnChartCategoryShape: Shape {
    let chartType: ChartType
    let plotBaselinePosition: CGFloat
    let path: [[[Path]]]
    let seriesIndex: Int
    let categoryIndex: Int
    var animateScale: CGFloat
    
    //    var animatableData: CGFloat {
    //        get {
    //            animateScale
    //        }
    //        set {
    //            animateScale = newValue
    //        }
    //    }
    
    func path(in rect: CGRect) -> Path {
        guard self.seriesIndex >= 0, self.categoryIndex >= 0, self.path.count > self.seriesIndex, !self.path[self.seriesIndex].isEmpty, self.path[self.seriesIndex].count > self.categoryIndex, !self.path[self.seriesIndex][self.categoryIndex].isEmpty else {
            return Path()
        }
        
        var animateWidth: CGFloat = rect.size.width
        var animateHeight: CGFloat = rect.size.height
        let baselinePosition: CGFloat = 1 - self.plotBaselinePosition
        let animTransform: CGAffineTransform
        
        if self.chartType == .bar || self.chartType == .stackedBar {
            animateWidth = rect.size.width * self.animateScale
            animTransform = CGAffineTransform(translationX: (1 - baselinePosition) * (rect.size.width - animateWidth), y: 0)
        } else { // column & stacked column chart
            animateHeight = rect.size.height * self.animateScale
            animTransform = CGAffineTransform(translationX: 0, y: baselinePosition * (rect.size.height - animateHeight))
        }
        
        return self.path[self.seriesIndex][self.categoryIndex][0]
            .applying(CGAffineTransform(scaleX: animateWidth, y: animateHeight))
            .applying(animTransform)
    }
}
