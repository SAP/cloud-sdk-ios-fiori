//
//  SettingsLabel.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingsLabel: View {
    @Binding var label: ChartLabelAttributes
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $label.isHidden) {
                    Text("Is Hidden")
                }
                
                Text("Font Size: \(label.fontSize)")
                Slider(value: $label.fontSize, in: 5...20, step: 1)
                
                Text("Font offset: \(label.offset)")
                Slider(value: $label.offset, in: 0...10, step: 1)
                
                Text("Color: TODO")
            }
        }.navigationBarTitle("Label Attributes")
    }
}

struct SettingsLabel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabel(label: .constant(Tests.stockModels[0].categoryAxis.labels))
    }
}
