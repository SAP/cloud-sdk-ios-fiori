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

struct ChartsContentView: View {
    @State var showingDetail = false
    
    let charts: [(String, [ChartModel], [String])] =
        [("Stock", Tests.stockModels, Tests.stockModelsDesc),
         ("Line", Tests.lineModels, Tests.lineModelsDesc),
         ("Area", Tests.lineModels.map {
            if let model = $0.copy() as? ChartModel {
                model.chartType = .area
                return model
            } else {
                return $0
            }
         }, Tests.lineModelsDesc),
         ("Column", Tests.lineModels.map {
            if let model = $0.copy() as? ChartModel {
                model.chartType = .column
                return model
            } else {
                return $0
            }
         }, Tests.lineModelsDesc),
         ("Stacked Column", Tests.lineModels.map {
            if let model = $0.copy() as? ChartModel {
                model.chartType = .stackedColumn
                return model
            } else {
                return $0
            }
         }, Tests.lineModelsDesc),
         ("Waterfall", Tests.waterfallModels, Tests.waterfallModelsDesc),
         ("Combo", Tests.comboModels, Tests.comboModelsDesc),
         ("Bar", Tests.lineModels.map {
            if let model = $0.copy() as? ChartModel {
                model.chartType = .bar
                return model
            } else {
                return $0
            }
         }, Tests.lineModelsDesc),
         ("Stacked Bar", Tests.lineModels.map {
            if let model = $0.copy() as? ChartModel {
                model.chartType = .stackedBar
                return model
            } else {
                return $0
            }
         }, Tests.lineModelsDesc),
         ("Bubble", Tests.bubbleModels, Tests.bubbleModelsDesc),
         ("Scatter", Tests.scatterModels, Tests.scatterModelsDesc),
         ("Donut", Tests.donutModels, Tests.donutModelsDesc),
         ("Micro Chart - Column", Tests.columnModels, Tests.columnModelsDesc),
         ("Micro Chart - Radial", Tests.radialModels, Tests.radialModelsDesc),
         ("Micro Chart - Harvey Ball", Tests.harveyBallModels, Tests.harveyBallModelsDesc),
         ("Micro Chart - Bullet", Tests.bulletModles, Tests.bulletModlesDesc)
    ]
    
    var body: some View {
        List {
            ForEach(0 ..< charts.count) { index in
                NavigationLink(destination: ChartHomeView(info: self.charts[index])) {
                    Text(self.charts[index].0).font(.headline)
                }
            }
        }.navigationBarTitle("FioriCharts")
    }
}

struct ChartHomeView: View {
    @State var showingDetail = false
    @State var currentModel: ChartModel? = nil
    
    let info: (String, [ChartModel], [String])
        
    init(info: (String, [ChartModel], [String])) {
        self.info = info
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.size)
        }
        .navigationBarTitle(info.0)
        .sheet(isPresented: $showingDetail) {
            ChartDetailView(model: self.currentModel!)
        }
    }
    
    func makeBody(in size: CGSize) -> some View {
        let width = size.width - 32
        return List {
            ForEach(0 ..< self.info.1.count) { i in
                VStack(alignment: .center) {
                    Text(self.currentModel?.id.uuidString ?? "").hidden() // workaround for Xcode 12 beta bug, see https://developer.apple.com/forums/thread/653247
                    
                    if self.info.2[i] == "Customized No Data View" {
                        ChartView(self.info.1[i], noDataView: NoDataView {
                            GeometryReader { proxy in
                                VStack(alignment: .center) {
                                    Text("☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹")
                                    Text("Customized No Data View")
                                    Text("☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹")
                                }
                                .frame(width: proxy.size.width, height: proxy.size.height)
                                .border(Color.primary, width: 1)
                            }
                        })
                        .frame(width: width,
                               height: self.info.1[i].chartType == .bar || self.info.1[i].chartType == .stackedBar ? width : width / 2.14 )
                    } else {
                        ChartView(self.info.1[i])
                            .frame(width: width,
                                   height: self.info.1[i].chartType == .bar || self.info.1[i].chartType == .stackedBar ? width : width / 2.14 )
                    }
 
                    Text(self.info.2[i]).font(.subheadline)
                }
                .onTapGesture {
                    self.currentModel = self.info.1[i]
                    self.showingDetail.toggle()
                }
            }
        }
    }
}

struct ChartsContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

