import SwiftUI

struct HarveyBallMicroChart: View {
    @ObservedObject var model: ChartModel
    
    // the difference of outer and inner radius range from 5...20
    private static let minDepth: CGFloat = 5
    private static let maxDepth: CGFloat = 20
    
    var body: some View {
        GeometryReader { proxy in
            self.chartView(in: proxy.size)
        }
    }
    
    // swiftlint:disable force_unwrapping
    func chartView(in size: CGSize) -> some View {
        let radius = min(size.width, size.height) / 2
        
        // calculate the difference of outer and inner radius
        let val = radius / 10
        let depth = val > HarveyBallMicroChart.maxDepth ? HarveyBallMicroChart.maxDepth : (val < HarveyBallMicroChart.minDepth ? HarveyBallMicroChart.minDepth : val)
        
        let total = self.model.dataItemsIn(seriesIndex: 0).first
        let fraction = self.model.dataItemsIn(seriesIndex: 0).last
        
        return HStack {
            if fraction != nil, total != nil {
                Spacer()
                ZStack(alignment: .center) {
                    Circle()
                        .fill(total!.color)
                        .frame(width: radius * 2, height: radius * 2)
                    
                    ArcShape(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: Double(fraction!.value) * 360 / Double(total!.value)), insetAmount: (radius - depth) / 2)
                        .stroke(fraction!.color, lineWidth: radius - depth)
                        .frame(width: (radius - depth) * 2, height: (radius - depth) * 2)
                }
                
                VStack(alignment: .center) {
                    if fraction!.label != nil {
                        Text(fraction!.label!)
                            .foregroundColor(fraction!.color)
                    }
                    
                    if total!.label != nil {
                        Text(total!.label!)
                            .foregroundColor(total!.color)
                    }
                }
                Spacer()
            } else {
                NoDataView()
            }
        }
    }
}

struct HarveyBallMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.harveyBallModels) {
                HarveyBallMicroChart(model: $0)
                    .frame(width: 400, height: 200)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
