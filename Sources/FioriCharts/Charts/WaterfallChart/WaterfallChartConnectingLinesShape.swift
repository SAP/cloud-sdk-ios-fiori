import SwiftUI

struct WaterfallChartConnectingLinesShape: Shape {
    let path: [[[Path]]]
    let seriesIndex: Int
    let startIndex: Int
    let endIndex: Int
    
    func path(in rect: CGRect) -> Path {
        guard self.seriesIndex >= 0, self.startIndex >= 0, self.startIndex <= self.endIndex, self.path.count > self.seriesIndex, !self.path[self.seriesIndex].isEmpty, self.path[self.seriesIndex].count > self.endIndex else {
            return Path()
        }
        
        var seriesPath = Path()
        for index in self.startIndex ... self.endIndex {
            let categoryPath = self.path[self.seriesIndex][index]
            
            if let linePath = categoryPath.last {
                seriesPath.addPath(linePath)
            }
        }
        
        return seriesPath
            .applying(CGAffineTransform(scaleX: rect.size.width, y: rect.size.height))
    }
}
