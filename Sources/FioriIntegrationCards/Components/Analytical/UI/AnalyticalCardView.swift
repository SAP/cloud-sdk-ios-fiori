import FioriCharts
import SwiftUI

@available(*, deprecated, message: "Module FioriIntegrationCards is deprecated and will be removed in a future major version")
public struct AnalyticalCardView: View {
    var model: AnalyticalCard
      
    public init(model: AnalyticalCard) {
        self.model = model
    }
    
    public var body: some View {
        Group {
            VStack {
                HeaderView(model: model.header)
                ChartView(self.model.chartModel)
                    .frame(minHeight: 260, alignment: .topLeading)
            }
//            .frame(maxWidth: 417, alignment: .topLeading)
            .padding(16)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray, lineWidth: 0.5)
            ).padding(16)
        }
    }
    
    func lineView(in rect: CGRect, from content: AnalyticalContent) -> some View {
        let xAxisHeight: CGFloat = 24
        let yAxisWidth: CGFloat = 40
        
        let width = rect.size.width - yAxisWidth
        let height = rect.size.height - xAxisHeight
        let linesRect = CGRect(x: yAxisWidth, y: 0, width: width, height: height)
        
        return ZStack {
            Text("Placeholder for LineShape") /*
                         ForEach(content.data!) { data in
             //                let points: [Double] = data.points.map { $0.value }
                             LinesShape(points: data.points.map { $0.value })
                             .stroke(Color.blue, style: StrokeStyle(lineWidth: 3))
                             .frame(width: width, height: height)
                             .previewLayout(.sizeThatFits)
                         }*/
        }
    }
}

struct PolygonView: View {
    let trend: String?
    let state: String?
    
    var body: some View {
        PolygonShape(sides: 3)
            .fill(Color.getKpiColor(trend: trend, state: state))
            .frame(width: 15, height: 15)
            .rotationEffect(.degrees(trend == "Down" ? 90 : -90))
    }
}

struct PolygonShape: Shape {
    var sides: Int
    
    func path(in rect: CGRect) -> Path {
        // hypotenuse
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        
        // center
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        
        var path = Path()
                
        for i in 0 ..< self.sides {
            let angle = (Double(i) * (360.0 / Double(self.sides))) * Double.pi / 180

            // Calculate vertex position
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            
            if i == 0 {
                path.move(to: pt) // move to first vertex
            } else {
                path.addLine(to: pt) // draw line to next vertex
            }
        }
        
        path.closeSubpath()
        
        return path
    }
}
