import SwiftUI

struct LinesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    /// true is for Area Chart, false is for Line Chart
    let fill: Bool
    
    init(fill: Bool = false) {
        self.fill = fill
    }
    
    var body: some View {
        ZStack {
            ForEach(0 ..< self.model.numOfSeries(), id: \.self) { seriesIndex in
                LineSeriesView(seriesIndex: seriesIndex, fill: self.fill)
            }
        }
    }
}

struct LinesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                LinesView()
                    .environmentObject($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
                
                LinesView()
                    .environmentObject($0)
                    .environment(\.layoutDirection, .rightToLeft)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
