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
                    if model.chartType == .stock {
                        Stepper("Index of Stock Series: \(self.model.indexOfStockSeries)", onIncrement: {
                            self.model.indexOfStockSeries = (self.model.indexOfStockSeries + 1) % max(1, self.model.numOfSeries())
                        }, onDecrement:  {
                            self.model.indexOfStockSeries = (self.model.indexOfStockSeries - 1 + self.model.numOfSeries()) % max(1, self.model.numOfSeries())
                        })
                    }
                    
                    NavigationLink(destination: SettingsIndexSet(indexSet: $model.indexesOfSecondaryValueAxis)) { Text("Indexes Of Secondary Value Axis:")
                    }
                    
                    Text("Indexes Of Column Series: \(String(describing: model.indexesOfColumnSeries.sorted()))")
                    Text("Indexes Of Totals Categories: \(String(describing: model.indexesOfTotalsCategories.sorted()))")
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
