//
//  SettingsSeries.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/12/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingsSeries: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        Form {
            Section(header: Text("Basic")) {
                Text("Line Width: \(model.seriesAttributes.lineWidth)")
                Slider(value: $model.seriesAttributes.lineWidth, in: 1...10, step: 1)

                Text("First Line Cap Diameter: \(model.seriesAttributes.firstLineCapDiameter)")
                Slider(value: $model.seriesAttributes.firstLineCapDiameter, in: 0...10, step: 1)

                Text("Last Line Cap Diameter: \(model.seriesAttributes.lastLineCapDiameter)")
                Slider(value: $model.seriesAttributes.lastLineCapDiameter, in: 0...10, step: 1)
            }
            
            Section(header: Text("Points")) {
                ForEach(0 ..< self.model.seriesAttributes.points.count) { i in
                    NavigationLink(destination: SettingsPoint(point: self.$model.seriesAttributes.points[i])) {
                        Text("Series \(i) Point")
                    }
                }
            }
            
            Section(header: Text("Colors")) {
                ForEach(0 ..< self.model.seriesAttributes.colors.count) { i in
                    SettingColor(color: self.$model.seriesAttributes.colors[i], title: "Series \(i) Color")
                }
            }
        }.navigationBarTitle("Series")
    }
}

struct SettingsSeries_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSeries(model: Tests.stockModels[0])
    }
}
