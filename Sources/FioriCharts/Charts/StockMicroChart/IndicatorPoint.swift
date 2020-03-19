//
//  IndicatorPoint.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/3/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct IndicatorPoint: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
        }
        .frame(width: 14, height: 14)
    }
}

struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint()
            .position(x: 100, y: 100)
            .frame(width:200, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
    }
}
