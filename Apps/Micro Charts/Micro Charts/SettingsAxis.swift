//
//  SettingsAxis.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingsAxis: View {
    @Binding var axis: ChartNumericAxis
    
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
                
                Toggle(isOn: axis.explicitMinToggleBinding) {
                    Text("Explicit Min is set")
                }
            }
                
            Section(header: Text("Line")) {
                NavigationLink(destination:
                SettingsLine(line: $axis.gridlines)) {
                    Text("Baseline")
                }
                
                NavigationLink(destination:
                SettingsLine(line: $axis.gridlines)) {
                    Text("Gridlines")
                }
            }
        }.navigationBarTitle("Axis")
    }
}

extension ChartNumericAxis {
    var explicitMinToggleBinding: Binding<Bool> {
        return Binding(get: {
            return self.explicitMin != nil
        }) { (val) in
            self.explicitMin = val ? 0 : nil
        }
    }
}

struct SettingsAxis_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAxis(axis: .constant(Tests.stockModels[0].categoryAxis))
    }
}
