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
    @Binding var line: ChartGridlineAttributes
    
    var body: some View {
        Form {
            Section(header: Text("Basic")) {
                Toggle(isOn: $line.isHidden) {
                    Text("Is Hidden")
                }
                
                Text("Line width: \(line.width)")
                Slider(value: $line.width, in: 1...10, step: 1)
                
                Text("Color: TODO")
            }
            
            Section(header: Text("Dash Pattern")) {
                Text("Length: \(line.dashPatternLength)")
                Slider(value: $line.dashPatternLength, in: 1...20, step: 1)
                
                Text("Gap: \(line.dashPatternGap)")
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
