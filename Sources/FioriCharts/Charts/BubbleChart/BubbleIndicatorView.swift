import SwiftUI

struct BubbleIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.layoutDirection) var layoutDirection
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
        
        var selections: [Int: [Int]] = [:]
        if let tmpSelections = model.selections {
            selections = tmpSelections
        }
        
        let minLength = min(rect.size.width, rect.size.height) * self.model.scaleX
        let pd = self.chartContext.plotData(self.model)
        let singleSelected = selections.count == 1 && selections.first?.value.count == 1
        var x: CGFloat = 0
        var y: CGFloat = 0
        if singleSelected {
            let seriesIndex = selections.first?.key ?? 0
            let categoryIndex = selections[seriesIndex]?.first ?? 0
            x = pd[seriesIndex][categoryIndex].pos.x * self.model.scaleX * rect.size.width - startPosX
            y = (1 - pd[seriesIndex][categoryIndex].pos.y) * self.model.scaleX * rect.size.height - startPosY
        }
        
        let seriesIndices = selections.keys.reversed()
        var displayPlotData: [ChartPlotData] = []
        
        for seriesIndex in seriesIndices {
            if let categoryIndices = selections[seriesIndex] {
                for categoryIndex in categoryIndices {
                    displayPlotData.append(pd[seriesIndex][categoryIndex])
                }
            }
        }
        
        return ZStack {
            ForEach(0 ..< displayPlotData.count, id: \.self) { index in
                Circle()
                    .fill(self.model.colorAt(seriesIndex: displayPlotData[index].seriesIndex, categoryIndex: displayPlotData[index].categoryIndex))
                    .frame(width: self.model.chartType == .scatter ? 10 : displayPlotData[index].rect.size.width * minLength,
                           height: self.model.chartType == .scatter ? 10 : displayPlotData[index].rect.size.width * minLength)
                    .position(x: displayPlotData[index].pos.x * self.model.scaleX * rect.size.width - startPosX,
                              y: (1 - displayPlotData[index].pos.y) * self.model.scaleX * rect.size.height - startPosY)
            }
            
            // draw cross lines for single selection only
            if singleSelected {
                // horizontal line
                LineShape(pos1: CGPoint(x: 0, y: y),
                          pos2: CGPoint(x: rect.size.width, y: y),
                          layoutDirection: layoutDirection)
                    .stroke(Color.preferredColor(.primary3), lineWidth: 1)

                // vertical line
                LineShape(pos1: CGPoint(x: x, y: 0),
                          pos2: CGPoint(x: x, y: rect.size.height),
                          layoutDirection: layoutDirection)
                    .stroke(Color.preferredColor(.primary3), lineWidth: 1)
            } else {
                EmptyView()
            }
        }.clipped()
    }
}

struct BubbleIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.bubbleModels) {
                BubbleIndicatorView()
                    .environmentObject($0)
                    .environment(\.chartContext, BubbleChartContext())
                    .frame(width: 330, height: 330, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
