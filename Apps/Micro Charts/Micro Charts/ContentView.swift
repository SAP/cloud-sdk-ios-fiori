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
    
    let charts: [(String, CGFloat, [ChartModel])] =
        [("Stock", 160, Tests.stockModels),
         ("Donut", 140, Tests.donutModels),
         ("Micro Chart - Column", 160, Tests.columnModels),
         ("Micro Chart - Harvey Ball", 160, Tests.harveyBallModels),
         ("Micro Chart - Radial", 160, Tests.radialModels),
         ("Micro Chart - Bullet", 120, Tests.bulletModles)
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
                                ForEach(self.charts[index].2) { model in
                                    ChartView(model)
                                        .frame(width: 280, height: self.charts[index].1)
                                        .padding(.leading, 15)
                                        .onTapGesture {
                                            self.currentModel = model
                                            self.showingDetail.toggle()
                                    }
                                }
                            }
                        }
                    }
                }
            }.navigationBarTitle("Micro Charts", displayMode: .inline)
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

