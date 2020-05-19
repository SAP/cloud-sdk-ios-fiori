//
//  SettingsSelection.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/12/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingsSelection: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        Form {
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
                    self.model.selectedSeriesIndex = (self.model.currentSeriesIndex + 1) % max(1, self.model.numOfSeries())
                }, onDecrement:  {
                    self.model.selectedSeriesIndex = (self.model.currentSeriesIndex - 1 + self.model.numOfSeries()) % max(1, self.model.numOfSeries())
                })
                
                Text("Selected Category Indexes: \(String(describing: model.selectedCategoryInRange))")
                Text("Selected Dimension Indexes: TODO")
            }
        }
    }
}

struct SettingsSelection_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSelection(model: Tests.stockModels[0])
    }
}
