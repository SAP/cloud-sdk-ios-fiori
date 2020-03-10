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
            Section {
                Toggle(isOn: $line.isHidden) {
                    Text("Is Hidden")
                }
                
                Text("Baseline width: \(line.width)")
                Slider(value: $line.width, in: 1...5, step: 1)
                
            }
        }.navigationBarTitle("Line")
    }
}

struct SettingsLine_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLine(line: .constant(Tests.stockModels[0].categoryAxis.gridlines))
    }
}
