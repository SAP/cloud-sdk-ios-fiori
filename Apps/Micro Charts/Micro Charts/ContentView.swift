//
//  ContentView.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/2/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI
import FioriCharts

struct ContentView: View {
    @State var showingDetail = false
    @State var currentModel: ChartModel? = nil
    
    let charts: [(String, CGFloat, CGFloat, [ChartModel])] =
        [("Stock", 280, 160, Tests.stockModels),
         ("Line", 280, 160, Tests.lineModels),
         ("Area", 280, 160, Tests.lineModels.map {
            let model = $0.copy() as! ChartModel
            model.chartType = .area
            return model
         }),
         ("Micro Chart - Column", 280, 160, Tests.columnModels),
         ("Donut", 180, 160, Tests.donutModels),
         ("Micro Chart - Radial", 180, 160, Tests.radialModels),
         ("Micro Chart - Harvey Ball", 240, 160, Tests.harveyBallModels),
         ("Micro Chart - Bullet", 280, 120, Tests.bulletModles)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< charts.count) { index in
                    VStack(alignment: .leading) {
                        Text(self.charts[index].0)
                            .font(.headline)
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 0) {
                                ForEach(self.charts[index].3) { model in
                                    ChartView(model)
                                        .frame(width: self.charts[index].1, height: self.charts[index].2 - 2)
                                        .padding(.leading, 8)
                                        .onTapGesture {
                                            self.currentModel = model
                                            self.showingDetail.toggle()
                                    }
                                }
                            }
                        }.frame(height: self.charts[index].2)
                    }
                }
            }.navigationBarTitle("Micro Charts")
                .sheet(isPresented: $showingDetail) {
                    DetailView(model: self.currentModel!)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

