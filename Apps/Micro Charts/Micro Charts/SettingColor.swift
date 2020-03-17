//
//  SettingColor.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/12/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingColor: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var color: HexColor
    var title: String?
    
    let colorOptions: [HexColor] = ColorStyle.allCases.map() {Palette.hexColor(for:$0)}
    
    var body: some View {
        Picker(selection: $color, label: Text(title ?? "Select Color")) {
            ForEach(colorOptions, id: \.self) { hex in
                Rectangle()
                    .fill(hex.color(self.colorScheme))
                    .tag(hex)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1))
                    .frame(width: 60, height: 20)
            }
        }
    }
}

struct SettingColor_Previews: PreviewProvider {
    static var previews: some View {
        SettingColor(color: .constant(Tests.stockModels[0].categoryAxis.baseline.color))
    }
}
