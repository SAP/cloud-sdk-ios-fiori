//
//  SettingColor.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/12/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct SettingColor: View {
    @Binding var color: String
    var title: String?
    
    let colorOptions: [String] = ["5899DA", "E8743B", "19A979", "ED4A7B", "945ECF", "13A4B4", "525DF4", "BF399E", "6C8893", "EE6868", "2F6497", "000000", "00000000", "FFFFFF", "D3D3D3", "D3D3D388", "AB2217", "7EFAA1", "EDD3D2", "FCFDFC"]
    
    var body: some View {
        Picker(selection: $color, label: Text(title ?? "Select Color")) {
            ForEach(colorOptions, id: \.self) { hex in
                Rectangle()
                    .fill(Color(hex: hex))
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
