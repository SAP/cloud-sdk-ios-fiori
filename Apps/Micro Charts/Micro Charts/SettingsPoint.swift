//
//  SettingsPoint.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/10/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingsPoint: View {
    @Binding var point: ChartPointAttributes
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $point.isHidden) {
                    Text("Is Hidden")
                }
                
                Text("Diameter of the point: \(point.diameter)")
                Slider(value: $point.diameter, in: 0...20, step: 1)
                
//                Text("Line width for the point's stroked path: \(point.lineWidth)")
//                Slider(value: $point.lineWidth, in: 0...10, step: 1)
                
                Text("Allowed gap between dots before they run into each other and are hidden: \(point.gap)")
                Slider(value: $point.gap, in: 0...10, step: 1)
                
                SettingColor(color: $point.strokeColor)
            }
        }.navigationBarTitle("Point Attributes")
    }
}

struct SettingsPoint_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPoint(point: .constant(Tests.stockModels[0].seriesAttributes.points[0]))
    }
}
