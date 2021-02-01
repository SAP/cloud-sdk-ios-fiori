import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: ChartsContentView()) {
                    Text("Charts")
                }
                NavigationLink(
                    destination: IntegrationCardsContentView()) {
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
        .chartSeriesShapeStyle([1: LinearGradient(gradient: Gradient(colors: [.red, .green, .blue]), startPoint: .bottom, endPoint: .top)])
        .chartCategoryShapeStyle([0: [0: LinearGradient(gradient: Gradient(colors: [.red, .green, .blue]), startPoint: .bottom, endPoint: .top),
                                      1: Color.yellow,
                                      2: AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .pink]), center: UnitPoint(x: 0.50, y: 1.00), startAngle: Angle(degrees: 180.00), endAngle: Angle(degrees: 360.00))],
                                  1: [3: RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .pink]), center: .center, startRadius: 0, endRadius: 50),
                                      4: ImagePaint(image: Image("flower"))]])
    }
}
