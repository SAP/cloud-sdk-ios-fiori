import FioriCharts
import SwiftUI

struct ContentView: View {
    private let oneMany = ["table", "list", "timeline"]
    private let manyMany = ["LowCode", "object", "analytical"]
    private let cards: [String] = ["LowCode", "timeline", "table", "list" , "object", "analytical"]

    var body: some View {
        let linearGradient = LinearGradient(gradient: Gradient(colors: [.red, .green, .blue]), startPoint: .bottom, endPoint: .top)
        let angularGradient = AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .pink]), center: UnitPoint(x: 0.50, y: 1.00), startAngle: Angle(degrees: 180.00), endAngle: Angle(degrees: 360.00))
        let radialGradient = RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .pink]), center: .center, startRadius: 0, endRadius: 50)
        let imagePaint = ImagePaint(image: Image("flower"))
        
        return NavigationView {
            List {
                NavigationLink(
                    destination: ChartsContentView()) {
                    Text("Charts")
                }
                NavigationLink(
                    destination: IntegrationCardsContentView(cards: cards)) {
                    Text("Integration Cards")
                }
                NavigationLink(
                    destination: CoreContentView()) {
                    Text("Core Elements")
                }
            }
            .navigationBarTitle("Examples")
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .chartSeriesShapeStyle([0: AnyShapeStyle(linearGradient)])
        .chartCategoryShapeStyle([0: [0: AnyShapeStyle(linearGradient), 1: AnyShapeStyle(Color.yellow), 2: AnyShapeStyle(angularGradient)],
                                  1: [3: AnyShapeStyle(radialGradient), 4: AnyShapeStyle(imagePaint)]])
    }
}
