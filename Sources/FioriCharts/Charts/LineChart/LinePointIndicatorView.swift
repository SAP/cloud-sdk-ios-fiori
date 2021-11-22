import SwiftUI

struct LinePointIndicatorView: View {
    let pointRadius: CGFloat
    let strokeColr: Color
    
    var body: some View {
        let circleColor: Color = .preferredColor(.secondaryGroupedBackground)
        let extraSelectedPointDiameterWidth = ChartViewLayout.extraSelectedPointRadiusWidth * 2
        let extraSelectedPointAndBorderDiameter = (ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth) * 2
        
        return ZStack {
            Circle()
                .fill(strokeColr)
                .frame(width: pointRadius * 2 + extraSelectedPointDiameterWidth,
                       height: pointRadius * 2 + extraSelectedPointDiameterWidth)

            Circle()
                .stroke(circleColor, style: StrokeStyle(lineWidth: 4))
                .frame(width: pointRadius * 2 + extraSelectedPointAndBorderDiameter,
                       height: pointRadius * 2 + extraSelectedPointAndBorderDiameter)
        }
    }
}

struct LinePointIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        LinePointIndicatorView(pointRadius: 7,
                               strokeColr: Color.primary)
            .frame(width: 20, height: 100)
    }
}
