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
                
//                Toggle(isOn: axis.explicitMinToggleBinding) {
//                    Text("Explicit Min is set")
//                }
//                
//                if axis.explicitMin != nil {
//                    VStack(alignment: .leading, spacing: 0) {
//                        Text("Explicit Min Value: \(axis.explicitMin ?? 0)")
//                        Slider(value: $axis.explicitMinDoubleBinding, in: 0...100, step: 10)
//                    }
//                }
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
            }
        }.navigationBarTitle("Axis")
    }
}

extension ChartNumericAxis {
    var explicitMinToggleBinding: Binding<Bool> {
        return Binding(get: {
            return self.explicitMin != nil
        }, set: { (val) in
            self.explicitMin = val ? 0 : nil
        })
    }
    
    var explicitMinDoubleBinding: Binding<Double> {
        return Binding(get: { () -> Double in
            return Double(self.explicitMin ?? 0)
        }, set: { (val) in
            self.explicitMin = Double(val)
        })
    }
    
    var explicitMaxToggleBinding: Binding<Bool> {
        return Binding(get: {
            return self.explicitMax != nil
        }) { (val) in
            self.explicitMax = val ? 0 : nil
        }
    }
}

struct SettingsAxis_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAxis(axis: .constant(Tests.stockModels[0].numericAxis))
    }
}
