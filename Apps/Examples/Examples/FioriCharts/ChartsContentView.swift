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
    @State var isPopUp = UserDefaults.standard.bool(forKey: "isPopUp")
    
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
                NavigationLink(destination: ChartHomeView(info: self.charts[index], isPopUp: self.$isPopUp)) {
                    Text(self.charts[index].0).font(.headline)
                }
            }
        }.navigationBarTitle("FioriCharts")
    }
}

struct ChartHomeView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    @State var showingDetail = false
    @State var currentModel: ChartModel? = nil
    
    let info: (String, [ChartModel], [String])
    
    @Binding var isPopUp: Bool
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.size)
        }
        .navigationBarTitle(info.0)
        .navigationBarItems(trailing: Toggle("Popup", isOn: $isPopUp))
        .sheet(isPresented: $showingDetail) {
            ChartDetailView(model: self.currentModel!)
        }
        .onDisappear() {
            UserDefaults.standard.set(self.isPopUp, forKey: "isPopUp")
        }
    }
    
    func makeBody(in size: CGSize) -> some View {
        var width: CGFloat

        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            if #available(iOS 14, *) {
                width = max((size.width - 48) / 2, 1)
            } else {
                width = max(min(size.width, size.height) / 2, 1)
            }
        } else if horizontalSizeClass == .compact {
            width = max(size.width - 32, 1)
        } else if verticalSizeClass == .compact {
            width = max(min((size.height - 32) * 3 / 2, size.width - 32), 1)
        } else {
            width = max(min(size.width, size.height) - 32, 1)
        }

        // Xcode 12
        #if swift(>=5.3)
            // iOS 14, or greater
            if #available(iOS 14, *) {
                let numOfColumns: Int = horizontalSizeClass == .regular && verticalSizeClass == .regular ? 2 : 1
            
                let columns: [GridItem] = Array(repeating: .init(.flexible()), count: numOfColumns)

                return AnyView(ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(0 ..< self.info.1.count) { i in
                            self.griditem(model: self.info.1[i], desc: self.info.2[i], width: width)
                                .padding(8)
                        }
                    }.padding(8)
                })
            } else {
                return AnyView(List {
                    ForEach(0 ..< self.info.1.count) { i in
                        HStack {
                            Spacer(minLength: 0)

                            self.griditem(model: self.info.1[i], desc: self.info.2[i], width: width)

                            Spacer(minLength: 0)
                        }
                    }
                })
            }
        #else
            return AnyView(List {
                ForEach(0 ..< self.info.1.count) { i in
                    HStack {
                        Spacer(minLength: 0)

                        self.griditem(model: self.info.1[i], desc: self.info.2[i], width: width)

                        Spacer(minLength: 0)
                    }
                }
            })
        #endif
    }
    
    func griditem(model: ChartModel, desc: String, width: CGFloat) -> some View {
        Group {
            if self.isPopUp {
                VStack(alignment: .center, spacing: 0) {
                    // workaround for Xcode 12 beta bug, see https://developer.apple.com/forums/thread/653247
                    Text(self.currentModel?.id.uuidString ?? "")
                        .frame(height: 0)
                        .hidden()
                    
                    ChartView(model)
                        .frame(width: width,
                               height: width * 2 / 3 )
                    
                    Spacer().frame(height: 8)
                    
                    Text(desc).font(.subheadline).foregroundColor(.primary)
                }.onTapGesture {
                    self.currentModel = model
                    if self.isPopUp {
                        self.showingDetail.toggle()
                    }
                }
            } else {
                NavigationLink(destination: ChartDetailConfigView(model: model)) {
                    VStack(alignment: .center, spacing: 0) {
                        ChartView(model)
                            .frame(width: width,
                                   height: width * 2 / 3 )
                        
                        Spacer().frame(height: 8)
                        
                        Text(desc).font(.subheadline).foregroundColor(.primary)
                    }
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

