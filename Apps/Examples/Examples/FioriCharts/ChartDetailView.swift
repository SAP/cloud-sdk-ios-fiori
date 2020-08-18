//
//  DetailView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts
import Combine

struct ChartDetailView: View {
    @ObservedObject var model: ChartModel
    @State var isFullScreen: Bool = false
    @State var lenRatio: CGFloat = 1
//    @State var cancellableSet: Set<AnyCancellable> = []
    
    init(model: ChartModel) {
        self.model = model
        
//        model.selectionDidChangePublisher
//        .subscribe(on: RunLoop.main)
//        .sink(receiveValue: { (selections) in
//            if let selections = selections {
//                if selections.count == 2 {
//                    print("MicroCharts: Selected series: \(selections[0]), selected categoies: \(selections[1])")
//                }
//            }
//            else {
//                print("No selections")
//            }
//        })
//        .store(in: &cancellableSet)
    }
    
    var body: some View {
        //print(String(describing: model))
        
        return GeometryReader { geometry in
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
                                .frame(height: (self.model.chartType == .bar ? geometry.size.width : geometry.size.width * 2 / 3) * (self.isFullScreen ? self.lenRatio : 1))
                        }.frame(height: self.isFullScreen ? geometry.size.height : (self.model.chartType == .bar ? geometry.size.width : geometry.size.width * 2 / 3))
                        
                        if !self.isFullScreen {
                            Divider().edgesIgnoringSafeArea(.all)
                            
                            Settings(model: self.model)
                        }
                    }
                }
            }
            else { // Landscape mode
                HStack(spacing: 0) {
                    ZStack(alignment: .topLeading) {
                        ChartView(self.model).padding()
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

                        Settings(model: self.model)
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
