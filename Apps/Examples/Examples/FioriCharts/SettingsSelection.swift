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
                Toggle(isOn: $model.userInteractionEnabled) {
                    Text("Enable User Interaction")
                }
                
                Toggle(isOn: $model.snapToPoint) {
                    Text("Snap to point only")
                }
                
                Toggle(isOn: $model.selectionRequired) {
                    Text("Selection Required")
                }
                
                Picker(selection: $model.selectionMode, label: Text("Selection Mode")) {
                    Text("Single").tag(ChartSelectionMode.single)
                    Text("All").tag(ChartSelectionMode.all)
                    Text("Multiple").tag(ChartSelectionMode.multiple)
                }
                
                Text("Selections: \(String(describing: model.selections))")
            }
        }
    }
}

struct SettingsSelection_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSelection(model: Tests.stockModels[0])
    }
}
