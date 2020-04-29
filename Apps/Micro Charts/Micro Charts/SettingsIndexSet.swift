//
//  SettingsIndexSet.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 4/29/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingsIndexSet: View {
    @Binding var indexSet: IndexSet
    
    var body: some View {
        Picker(selection: $indexSet, label: Text("Index set")) {
            Text("[]").tag(IndexSet())
            Text("[0]").tag(IndexSet(integer: 0))
            Text("[1]").tag(IndexSet(integer: 1))
            Text("[0, 1]").tag(IndexSet(integersIn: 0...1))
        }
    }
}

struct SettingsIndexSet_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIndexSet(indexSet: .constant(Tests.lineModels[2].indexesOfSecondaryValueAxis))
    }
}
