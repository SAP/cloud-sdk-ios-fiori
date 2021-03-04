import SwiftUI

struct AreaChart: View {
    @ObservedObject var model: ChartModel
  
    var body: some View {
        XYAxisChart(model: model,
                    chartContext: LineChartContext(),
                    chartView: LinesView(fill: true),
                    indicatorView: LineIndicatorView())
    }
}

// swiftlint:disable force_cast
struct AreaChart_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
            let model = $0.copy() as! ChartModel
            model.chartType = .area
            return model
        }
        
        return Group {
            ForEach(models) {
                AreaChart(model: $0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
