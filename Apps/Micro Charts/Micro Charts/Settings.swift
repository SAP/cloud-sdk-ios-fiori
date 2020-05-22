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
                    
                    Toggle(isOn: $model.snapToPoint) {
                        Text("Snap to point only")
                    }
                    
                    Stepper("Stock Series Index: \(self.model.currentSeriesIndex)", onIncrement: {
                        self.model.selectedSeriesIndex = (self.model.currentSeriesIndex + 1) % max(1, self.model.numOfSeries())
                    }, onDecrement:  {
                        self.model.selectedSeriesIndex = (self.model.currentSeriesIndex - 1 + self.model.numOfSeries()) % max(1, self.model.numOfSeries())
                    })
                }
                
                NavigationLink("Selection", destination: SettingsSelection(model: model))
                
                NavigationLink("Series Collection", destination: SettingsSeriesCollection(model: model))
                
                if model.colorsForCategory.count > 0 {
                    NavigationLink("Color for categories", destination: SettingsColorForCategory(model: model))
                }
                else {
                    Text("Color for categories: 0")
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
                    Slider(value: $model.numberOfGridlines.double, in: 1...20, step: 1)
                }
                
                Section(header: Text("Index Set")) {
                    Text("Indexes Of Column Series: TODO")
                    Text("Indexes Of Totals Categories: TODO")
                    
                    NavigationLink(destination: SettingsIndexSet(indexSet: $model.indexesOfSecondaryValueAxis)) { Text("Indexes Of Secondary Value Axis:")
                    }
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
