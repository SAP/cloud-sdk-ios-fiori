import SwiftUI

struct BubbleView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let startPosition = self.chartContext.startPosition(self.model, plotViewSize: rect.size)
        let startPosX = startPosition.x * self.model.scaleX * rect.size.width
        let startPosY = startPosition.y * self.model.scaleX * rect.size.height
        let pd = self.chartContext.plotData(self.model)
        let minLength = min(rect.size.width, rect.size.height) * self.model.scaleX
        
        var displayPlotData: [ChartPlotData] = []
        for category in pd {
            for item in category {
                if self.isInVisableArea(for: item, rect: rect) {
                    displayPlotData.append(item)
                }
            }
        }
        
        // origin is at top left
        return ZStack {
            ForEach(0 ..< displayPlotData.count, id: \.self) { index in
                Circle()
                    .fill(self.model.colorAt(seriesIndex: displayPlotData[index].seriesIndex, categoryIndex: displayPlotData[index].categoryIndex))
                    .opacity(self.model.selections != nil ? 0.25 : 0.8)
                    .frame(width: self.model.chartType == .scatter ? 10 : displayPlotData[index].rect.size.width * minLength,
                           height: self.model.chartType == .scatter ? 10 : displayPlotData[index].rect.size.width * minLength)
                    .position(x: displayPlotData[index].pos.x * self.model.scaleX * rect.size.width - startPosX,
                              y: (1 - displayPlotData[index].pos.y) * self.model.scaleX * rect.size.height - startPosY)
            }
        }.clipped()
    }
    
    func isInVisableArea(for item: ChartPlotData, rect: CGRect) -> Bool {
        let startPosition = self.chartContext.startPosition(self.model, plotViewSize: rect.size)
        let startPosX = startPosition.x * self.model.scaleX * rect.size.width
        let startPosY = startPosition.y * self.model.scaleX * rect.size.height
        let x = item.pos.x * self.model.scaleX * rect.size.width - startPosX
        let y = (1 - item.pos.y) * self.model.scaleX * rect.size.height - startPosY
        
        if x >= 0 && x <= rect.size.width && y >= 0 && y <= rect.size.height {
            return true
        } else {
            return false
        }
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.bubbleModels) {
                BubbleView()
                    .environmentObject($0)
                    .environment(\.chartContext, BubbleChartContext())
                    .frame(width: 330, height: 330, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
