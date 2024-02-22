import SwiftUI

struct ScatterChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(model: self.model,
                    chartContext: BubbleChartContext(),
                    chartView: BubbleView(),
                    indicatorView: BubbleIndicatorView())
    }
}

struct ScatterChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.scatterModels) {
                ScatterChart(model: $0)
                    .frame(width: 330, height: 330, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
