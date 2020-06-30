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
    
    let charts: [(String, [ChartModel], [String])] =
        [("Stock", Tests.stockModels, Tests.stockModelsDesc),
         ("Line", Tests.lineModels, Tests.lineModelsDesc),
         ("Area", Tests.lineModels.map {
            let model = $0.copy() as! ChartModel
            model.chartType = .area
            return model
         }, Tests.lineModelsDesc),
         ("Column", Tests.lineModels.map {
            let model = $0.copy() as! ChartModel
            model.chartType = .column
            return model
         }, Tests.lineModelsDesc),
         ("Stacked Column", Tests.lineModels.map {
            let model = $0.copy() as! ChartModel
            model.chartType = .stackedColumn
            return model
         }, Tests.lineModelsDesc),
         ("Waterfall", Tests.waterfallModels, Tests.waterfallModelsDesc),
         ("Donut", Tests.donutModels, Tests.donutModelsDesc),
         ("Micro Chart - Column", Tests.columnModels, Tests.columnModelsDesc),
         ("Micro Chart - Radial", Tests.radialModels, Tests.radialModelsDesc),
         ("Micro Chart - Harvey Ball", Tests.harveyBallModels, Tests.harveyBallModelsDesc),
         ("Micro Chart - Bullet", Tests.bulletModles, Tests.bulletModlesDesc)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< charts.count) { index in
                    NavigationLink(destination: ChartHomeView(info: self.charts[index])) {
                        Text(self.charts[index].0).font(.headline)
                    }
                }
            }.navigationBarTitle("Fiori Charts")
        }
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
            DetailView(model: self.currentModel!)
        }
    }
    
    func makeBody(in size: CGSize) -> some View {
        let width = size.width - 32
        return List {
            ForEach(0 ..< self.info.1.count) { i in
                VStack(alignment: .center) {
                    ChartView(self.info.1[i])
                        .frame(width: width, height: width / 2.14 )

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

