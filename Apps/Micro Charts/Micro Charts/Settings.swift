//
//  Settings.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct Settings: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Basic")) {
                    Toggle(isOn: $model.userInteractionEnabled) {
                        Text("Enable User Interaction")
                    }
                    
                    Toggle(isOn: $model.panChartToDataPointOnly) {
                        Text("Pan chart to data point only")
                    }
                }
                
                Section(header: Text("Selection").font(.subheadline)) {
                    Stepper("Series Index: \(self.model.currentSeriesIndex)", onIncrement: {
                        self.model.selectedSeriesIndex = (self.model.currentSeriesIndex + 1) % self.model.data.count
                        self.model.scale = 1.0
                        self.model.startPos = 0
                    }, onDecrement:  {
                        self.model.selectedSeriesIndex = (self.model.currentSeriesIndex - 1 + self.model.data.count) % self.model.data.count
                        self.model.scale = 1.0
                        self.model.startPos = 0
                    })
                }
                
                Section(header: Text("Scale").font(.subheadline)) {
                    
                    Text("Scale: \(model.scale)")
                    Slider(value: $model.scale, in: 1...max(1.1, CGFloat(model.data[model.currentSeriesIndex].count - 1) / 2), step: 0.1) { (changed) in
                        if (changed) {
                            self.model.startPos = 0
                        }
                    }
                    
                    Text("Start Position: \(model.startPos)")
                    
                    Text("Baseline width: \(model.categoryAxis.baseline.width)")
                    Slider(value: $model.categoryAxis.baseline.width, in: 1...5, step: 1)
                }
                
                Section(footer: Text("Series")) {
                    Text("series")
                }
                
                Section(header: Text("Axis Attributes")) {
                    NavigationLink(destination: SettingsAxis(axis: $model.numericAxis)) {
                        Text("Category Axis")
                    }
                    
                    NavigationLink(destination: SettingsAxis(axis: $model.numericAxis)) {
                        Text("Numeric Axis")
                    }
                    
                    NavigationLink(destination: SettingsAxis(axis: $model.secondaryNumericAxis)) {
                        Text("Secondary Numeric Axis")
                    }
                }
            }.navigationBarTitle("Configuration", displayMode: .inline)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(model: Tests.stockModels[0])
    }
}
