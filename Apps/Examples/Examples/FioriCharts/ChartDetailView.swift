import Combine
import FioriCharts
import SwiftUI

let linearGradient = LinearGradient(gradient: Gradient(colors: [.red, .green, .blue]), startPoint: .bottom, endPoint: .top)
let angularGradient = AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .pink]), center: UnitPoint(x: 0.50, y: 1.00), startAngle: Angle(degrees: 180.00), endAngle: Angle(degrees: 360.00))
let radialGradient = RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .pink]), center: .center, startRadius: 0, endRadius: 50)
let imagePaint = ImagePaint(image: Image("flower"))

struct ChartDetailConfigView: View {
    @ObservedObject var model: ChartModel
    @State var showingSettings = false
    @State var seriesShapeStyleEnable: Bool = false
    @State var categoryShapeStyleEnable: Bool = false
    
    init(model: ChartModel) {
        self.model = model
    }
    
    var body: some View {
        GeometryReader { _ in
            ChartView(self.model)
                .ifApply(self.seriesShapeStyleEnable) {
                    $0.chartSeriesShapeStyle([0: AnyShapeStyle(linearGradient)])
                }
                .ifApply(self.categoryShapeStyleEnable) {
                    $0.chartCategoryShapeStyle([0: [0: AnyShapeStyle(linearGradient), 1: AnyShapeStyle(Color.yellow), 2: AnyShapeStyle(angularGradient)],
                                                1: [3: AnyShapeStyle(radialGradient), 4: AnyShapeStyle(imagePaint)]])
                }
                .padding(16)
        }
        .navigationBarItems(trailing: Button("Config") {
            self.showingSettings.toggle()
        })
        .navigationBarTitle("Detail", displayMode: .inline)
        .sheet(isPresented: self.$showingSettings) {
            Settings(seriesShapeStyleEnable: self.$seriesShapeStyleEnable, categoryShapeStyleEnable: self.$categoryShapeStyleEnable).environmentObject(self.model)
        }
    }
}

struct ChartDetailView: View {
    @ObservedObject var model: ChartModel
    @State var isFullScreen: Bool = false
    @State var lenRatio: CGFloat = 1
    @State var seriesShapeStyleEnable: Bool = false
    @State var categoryShapeStyleEnable: Bool = false
    
    init(model: ChartModel) {
        self.model = model
    }
    
    var body: some View {
        GeometryReader { geometry in
            // Portrait mode
            if geometry.size.width <= geometry.size.height {
                ZStack(alignment: .topLeading) {
                    Image(systemName: "arrow.up.left.and.arrow.down.right")
                        .font(.fiori(forTextStyle: .body))
                        .padding(8)
                        .onTapGesture {
                            self.isFullScreen.toggle()
                        }
                    
                    if self.isFullScreen {
                        VStack {
                            Slider(value: self.$lenRatio, in: 1.0 ... 3.0)
                        }.padding(20)
                    }
                    
                    VStack(alignment: .center, spacing: 0) {
                        HStack(alignment: .center) {
                            ChartView(self.model)
                                .ifApply(self.seriesShapeStyleEnable) {
                                    $0.chartSeriesShapeStyle([0: AnyShapeStyle(linearGradient)])
                                }
                                .ifApply(self.categoryShapeStyleEnable) {
                                    $0.chartCategoryShapeStyle([0: [0: AnyShapeStyle(linearGradient), 1: AnyShapeStyle(Color.yellow), 2: AnyShapeStyle(angularGradient)],
                                                                1: [3: AnyShapeStyle(radialGradient), 4: AnyShapeStyle(imagePaint)]])
                                }
                                .padding()
                                .frame(height: (self.model.chartType == .bar || self.model.chartType == .stackedBar ? geometry.size.width : geometry.size.width * 2 / 3) * (self.isFullScreen ? self.lenRatio : 1))
                        }.frame(height: self.isFullScreen ? geometry.size.height : (self.model.chartType == .bar || self.model.chartType == .stackedBar ? geometry.size.width : geometry.size.width * 2 / 3))
                        
                        if !self.isFullScreen {
                            Divider().edgesIgnoringSafeArea(.all)
                            
                            Settings(seriesShapeStyleEnable: self.$seriesShapeStyleEnable, categoryShapeStyleEnable: self.$categoryShapeStyleEnable).environmentObject(self.model)
                        }
                    }
                }
            } else { // Landscape mode
                HStack(spacing: 0) {
                    ZStack(alignment: .topLeading) {
                        ChartView(self.model)
                            .ifApply(self.seriesShapeStyleEnable) {
                                $0.chartSeriesShapeStyle([0: AnyShapeStyle(linearGradient)])
                            }
                            .ifApply(self.categoryShapeStyleEnable) {
                                $0.chartCategoryShapeStyle([0: [0: AnyShapeStyle(linearGradient), 1: AnyShapeStyle(Color.yellow), 2: AnyShapeStyle(angularGradient)],
                                                            1: [3: AnyShapeStyle(radialGradient), 4: AnyShapeStyle(imagePaint)]])
                            }
                            .padding()
                            .frame(width: self.isFullScreen ? (geometry.size.width - 32) : geometry.size.width / 2)
                        
                        Image(systemName: "arrow.up.left.and.arrow.down.right")
                            .font(.fiori(forTextStyle: .body))
                            .padding(8)
                            .onTapGesture {
                                self.isFullScreen.toggle()
                            }
                    }
                    
                    if !self.isFullScreen {
                        Divider().edgesIgnoringSafeArea(.all)

                        Settings(seriesShapeStyleEnable: self.$seriesShapeStyleEnable, categoryShapeStyleEnable: self.$categoryShapeStyleEnable).environmentObject(self.model)
                    }
                }
            }
        }
        .navigationBarTitle("Detail", displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChartDetailView(model: Tests.stockModels[0])
    }
}
