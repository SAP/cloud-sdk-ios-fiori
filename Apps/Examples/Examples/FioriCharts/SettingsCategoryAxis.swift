//
//  SettingsCategoryAxis.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/10/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingsCategoryAxis: View {
    @EnvironmentObject var model: ChartModel
    @Binding var axis: ChartCategoryAxisAttributes
    
    var body: some View {
        Form {
            Section(header: Text("Basic")) {
                Toggle(isOn: $axis.isZeroBased) {
                    Text("Is Zero Based")
                }
                
                Toggle(isOn: $axis.abbreviatesLabels) {
                    Text("Is Abbreviated Labels")
                }
                
                Toggle(isOn: $axis.isMagnitudedDisplayed) {
                    Text("Is Magnituded Displayed")
                }
            }
                
            Section(header: Text("Line")) {
                NavigationLink(destination:
                SettingsBaseline(line: $axis.baseline)) {
                    Text("Baseline")
                }
                
                NavigationLink(destination:
                SettingsLine(line: $axis.gridlines)) {
                    Text("Gridlines")
                }
            }
            
            Section(header: Text("Label")) {
                NavigationLink(destination: SettingsLabel(label: $axis.labels)) {
                    Text("Axis Gridline Label")
                }
                
                NavigationLink(destination: SettingsLabel(label: $axis.titleLabel)) {
                    Text("Axis Title Label")
                }
                
                Picker(selection: $axis.labelLayoutStyle, label: Text("Axis Label Layout Style")) {
                    Text("All or Nothing").tag(ChartCategoryAxisLabelLayoutStyle.allOrNothing)
                    Text("Range").tag(ChartCategoryAxisLabelLayoutStyle.range)
                }
            }
        }.navigationBarTitle("Axis")
    }
}

struct SettingsCategoryAxis_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCategoryAxis(axis: .constant(Tests.stockModels[0].categoryAxis))
    }
}
