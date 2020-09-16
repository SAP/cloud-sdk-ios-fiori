//
//  SettingsSeries.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/12/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts
import FioriSwiftUICore

struct SettingsSeries: View {
    @EnvironmentObject var model: ChartModel
    @Binding var seriesAttr: ChartSeriesAttributes
    
    var body: some View {
        let nf = NumberFormatter(style: .decimal)
        nf.maximumFractionDigits = 0
        
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
                Text("Line Width: \(nf.string(from: NSNumber(value: Double(seriesAttr.lineWidth))) ?? "")")
                Slider(value: $seriesAttr.lineWidth, in: 1...10, step: 1)
                
                Text("First Line Cap Diameter: \(nf.string(from: NSNumber(value: Double(seriesAttr.firstLineCapDiameter))) ?? "")")
                Slider(value: $seriesAttr.firstLineCapDiameter, in: 0...10, step: 1)

                Text("Last Line Cap Diameter: \(nf.string(from: NSNumber(value: Double(seriesAttr.lastLineCapDiameter))) ?? "")")
                Slider(value: $seriesAttr.lastLineCapDiameter, in: 0...10, step: 1)
            }
        }.navigationBarTitle("Series")
    }
}


struct SettingsSeriesCollection: View {
    @EnvironmentObject var model: ChartModel
    
    var body: some View {
        Form {
            ForEach(0 ..< self.model.seriesAttributes.count) { i in
                NavigationLink(destination:
                    SettingsSeries(seriesAttr: self.$model.seriesAttributes[i])) {
                        Text("Series \(i)")
                    }
            }
        }.navigationBarTitle("Series Collection")
    }
}

struct SettingsSeries_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSeriesCollection().environmentObject(Tests.lineModels[0])
    }
}
