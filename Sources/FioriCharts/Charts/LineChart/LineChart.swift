import SwiftUI

struct LineChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(model: model,
                    chartContext: LineChartContext(),
                    chartView: LinesView(),
                    indicatorView: LineIndicatorView())
    }
}

class LineChartContext: DefaultChartContext {
    override func plotPath(_ model: ChartModel) -> [[[Path]]] {
        if !model.path.isEmpty {
            return model.path
        }
        
        var result = [[[Path]]]()
        
        for seriesIndex in 0 ..< model.numOfSeries() {
            let seriesPath = plotLinePath(model, for: seriesIndex)
            
            result.append(seriesPath)
        }
    
        model.path = result
        
        return result
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                LineChart(model: $0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
