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
    @Binding var seriesAttr: ChartSeriesAttributes
    
    var body: some View {
        return Form {
            Section(header: Text("Palette")) {
                ForEach(0 ..< self.seriesAttr.palette.colors.count) { i in
                    SettingColor(color: self.$seriesAttr.palette.colors[i], title: "Primary Color \(i)")
                }
                
                SettingColor(color: self.$seriesAttr.palette.labelColor, title: "Label Color")
                
                SettingColor(color: self.$seriesAttr.palette.positiveMinColor, title: "Positive Min Color")
                
                SettingColor(color: self.$seriesAttr.palette.positiveMaxColor, title: "Positive Max Color")
                
                SettingColor(color: self.$seriesAttr.palette.negativeMinColor, title: "Negative Min Color")
                
                SettingColor(color: self.$seriesAttr.palette.negativeMaxColor, title: "Negative Max Color")
            }
            
            Section(header: Text("Point")) {
                NavigationLink(destination: SettingsPoint(point: $seriesAttr.point)) {
                    Text("Point")
                }
            }
            
            Section(header: Text("Line")) {
                Text("Line Width: \(seriesAttr.lineWidth)")
                Slider(value: $seriesAttr.lineWidth, in: 1...10, step: 1)
                
                Text("First Line Cap Diameter: \(seriesAttr.firstLineCapDiameter)")
                Slider(value: $seriesAttr.firstLineCapDiameter, in: 0...10, step: 1)

                Text("Last Line Cap Diameter: \(seriesAttr.lastLineCapDiameter)")
                Slider(value: $seriesAttr.lastLineCapDiameter, in: 0...10, step: 1)
            }
        }.navigationBarTitle("Series")
    }
}


struct SettingsSeriesCollection: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        Form {
            ForEach(0 ..< self.model.seriesAttributes.count) { i in
                NavigationLink(destination: SettingsSeries(seriesAttr: self.$model.seriesAttributes[i])) {
                    Text("Series \(i)")
                }
            }
        }.navigationBarTitle("Series Collection")
    }
}

struct SettingsSeries_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSeriesCollection(model: Tests.stockModels[0])
    }
}
