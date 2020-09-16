//
//  SettingsLine.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingsLine: View {
    @EnvironmentObject var model: ChartModel
    @Binding var line: ChartGridlineAttributes
    
    var body: some View {
        let nf = NumberFormatter(style: .decimal)
        nf.maximumFractionDigits = 0
        
        return Form {
            Section(header: Text("Basic")) {
                Toggle(isOn: $line.isHidden) {
                    Text("Is Hidden")
                }
                
                Text("Line width: \(nf.string(from: NSNumber(value: Double(line.width))) ?? "")")
                Slider(value: $line.width, in: 1...10, step: 1)
                
                SettingColor(color: $line.color)
            }
            
            Section(header: Text("Dash Pattern")) {
                Text("Length: \(nf.string(from: NSNumber(value: Double(line.dashPatternLength))) ?? "")")
                Slider(value: $line.dashPatternLength, in: 1...20, step: 1)
                
                Text("Gap: \(nf.string(from: NSNumber(value: Double(line.dashPatternGap))) ?? "")")
                Slider(value: $line.dashPatternGap, in: 0...20, step: 1)
            }
        }.navigationBarTitle("Line Attributes")
    }
}

struct SettingsLine_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLine(line: .constant(Tests.stockModels[0].categoryAxis.gridlines))
    }
}
