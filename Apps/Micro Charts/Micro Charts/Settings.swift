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
                
                Section(header: Text("Selection")) {
                    Toggle(isOn: $model.selectionRequired) {
                        Text("Selection Required")
                    }
                    
                    Picker(selection: $model.selectionMode, label: Text("Selection Mode")) {
                        Text("Single").tag(ChartSelectionMode.single)
                        Text("All").tag(ChartSelectionMode.all)
                    }
                    
                    Picker(selection: $model.defaultCategorySelectionMode, label: Text("Category Selection Mode")) {
                        Text("Index").tag(ChartCategorySelectionMode.index)
                        Text("First").tag(ChartCategorySelectionMode.first)
                        Text("Last").tag(ChartCategorySelectionMode.last)
                    }
                    
                    Stepper("Series Index: \(self.model.currentSeriesIndex)", onIncrement: {
                        self.model.selectedSeriesIndex = (self.model.currentSeriesIndex + 1) % self.model.data.count
                        self.model.scale = 1.0
                        self.model.startPos = 0
                    }, onDecrement:  {
                        self.model.selectedSeriesIndex = (self.model.currentSeriesIndex - 1 + self.model.data.count) % self.model.data.count
                        self.model.scale = 1.0
                        self.model.startPos = 0
                    })
                    
                    Text("Selected Category Indexes: TODO")
                    Text("Selected Dimension Indexes: TODO")
                }
                
                Section(header: Text("Scale")) {
                    
                    Text("Scale: \(model.scale)")
                    Slider(value: $model.scale, in: 1...max(1.1, CGFloat(model.data[model.currentSeriesIndex].count - 1) / 2), step: 0.1) { (changed) in
                        if (changed) {
                            self.model.startPos = 0
                        }
                    }
                    
                    Text("Start Position: \(model.startPos)")
                }
                
                Section(header: Text("Series")) {
                    Text("Colors: TBD")
                    
                    Text("Line Width: \(model.seriesAttributes.lineWidth)")
                    Slider(value: $model.seriesAttributes.lineWidth, in: 1...10, step: 1)
                    
                    Text("First Line Cap Diameter: \(model.seriesAttributes.firstLineCapDiameter)")
                    Slider(value: $model.seriesAttributes.firstLineCapDiameter, in: 0...10, step: 1)
                    
                    Text("First Line Cap Diameter: \(model.seriesAttributes.lastLineCapDiameter)")
                    Slider(value: $model.seriesAttributes.lastLineCapDiameter, in: 0...10, step: 1)
                    
                    NavigationLink(destination: SettingsPoint(point: $model.seriesAttributes.points)) {
                        Text("Point")
                    }
                    Text("Colors")
                }
                
                Section(header: Text("Axis")) {
                    NavigationLink(destination: SettingsCategoryAxis(axis: $model.categoryAxis)) {
                        Text("Category Axis")
                    }
                    
                    NavigationLink(destination: SettingsAxis(axis: $model.numericAxis)) {
                        Text("Numeric Axis")
                    }
                    
                    NavigationLink(destination: SettingsAxis(axis: $model.secondaryNumericAxis)) {
                        Text("Secondary Numeric Axis")
                    }
                    
                    Text("Number of Gridlines: \(model.numberOfGridlines)")
                    Slider(value: $model.numberOfGridlines.double, in: 1...10, step: 1)
                }
                
                Section(header: Text("Index Set")) {
                    Text("Indexes Of Column Series: TODO")
                    Text("Indexes Of Totals Categories: TODO")
                    Text("Indexes Of Secondary Value Axis: TODO")
                }
            }.navigationBarTitle("Configuration", displayMode: .inline)
        }
    }
}

extension Int {
    var double: Double {
        get { Double(self) }
        set { self = Int(newValue) }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(model: Tests.stockModels[0])
    }
}
