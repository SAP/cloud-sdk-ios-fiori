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
    var body: some View {
//        ChartView(Tests.stockModels[1]).frame(height: 200)
        NavigationView {
            List(Tests.allCases) { model in
                NavigationLink(destination: OneChartView(model)) {
                    ChartView(model).frame(height: 200)
                }
            }.navigationBarTitle("Micro Charts")
        }
    }
}

struct OneChartView: View {
    var model: ChartModel
    
    init(_ model: ChartModel) {
        self.model = model
        self.model.userInteractionEnabled = true
    }
    
    var body: some View {
        ChartView(model).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

