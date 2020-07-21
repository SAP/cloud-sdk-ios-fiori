//
//  SettingsColorForCategory.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/17/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts
import FioriSwiftUICore

struct SettingsColorForCategory: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        let seriesIds = [Int](model.colorsForCategory.keys.sorted())
        
        return Form {
            ForEach(seriesIds, id: \.self) { i in
                Section(header: Text("Series \(i)")) {
                    SettingsColorForOneCategory(colors: self.model.colorsForCategory[i]!)
                }
            }
        }
    }
}

struct SettingsColorForOneCategory: View {
    var colors: [Int: Color]
    
    var body: some View {
        let colorTuples: [(Int, Color)] = colors.map { (arg0) -> (Int, Color) in
            let (key, value) = arg0
            return (key, value)
        }.sorted { $0.0 < $1.0 }
        
        return ForEach(colorTuples, id: \.0) { index, color in
            HStack {
                Text("Category \(index)")
                Spacer()
                Rectangle()
                    .fill(color)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
                    .frame(width: 80, height: 20)
            }
            
            //SettingColor(color: .constant(color))
        }
    }
}

struct SettingsColorForCategory_Previews: PreviewProvider {
    static var previews: some View {
        SettingsColorForCategory(model: Tests.radialModels[0])
    }
}
