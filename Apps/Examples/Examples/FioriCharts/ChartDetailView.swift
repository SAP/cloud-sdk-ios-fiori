import Combine
import FioriCharts
import SwiftUI

struct ChartDetailConfigView: View {
    @ObservedObject var model: ChartModel
    @State var showingSettings = false

    init(model: ChartModel) {
        self.model = model
    }
    
    var body: some View {
        GeometryReader { _ in
            ChartView(self.model)
                .padding(16)
        }
        .navigationBarItems(trailing: Button("Config") {
            self.showingSettings.toggle()
        })
        .navigationBarTitle("Detail", displayMode: .inline)
        .sheet(isPresented: $showingSettings) {
            Settings().environmentObject(self.model)
        }
    }
}

struct ChartDetailView: View {
    @ObservedObject var model: ChartModel
    @State var isFullScreen: Bool = false
    @State var lenRatio: CGFloat = 1
  
    init(model: ChartModel) {
        self.model = model
    }
    
    var body: some View {
        GeometryReader { geometry in
            // Portrait mode
            if geometry.size.width <= geometry.size.height {
                ZStack(alignment: .topLeading) {
                    Image(systemName: "arrow.up.left.and.arrow.down.right")
                        .font(.body)
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
                                .padding()
                                .frame(height: (self.model.chartType == .bar || self.model.chartType == .stackedBar ? geometry.size.width : geometry.size.width * 2 / 3) * (self.isFullScreen ? self.lenRatio : 1))
                        }.frame(height: self.isFullScreen ? geometry.size.height : (self.model.chartType == .bar || self.model.chartType == .stackedBar ? geometry.size.width : geometry.size.width * 2 / 3))
                        
                        if !self.isFullScreen {
                            Divider().edgesIgnoringSafeArea(.all)
                            
                            Settings().environmentObject(self.model)
                        }
                    }
                }
            } else { // Landscape mode
                HStack(spacing: 0) {
                    ZStack(alignment: .topLeading) {
                        ChartView(self.model)
                            .padding()
                            .frame(width: self.isFullScreen ? (geometry.size.width - 32) : geometry.size.width / 2)
                        
                        Image(systemName: "arrow.up.left.and.arrow.down.right")
                            .font(.body)
                            .padding(8)
                            .onTapGesture {
                                self.isFullScreen.toggle()
                            }
                    }
                    
                    if !self.isFullScreen {
                        Divider().edgesIgnoringSafeArea(.all)

                        Settings().environmentObject(self.model)
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
