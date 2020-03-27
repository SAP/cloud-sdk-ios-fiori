//
//  AxisTitle.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

struct AxisTitle: Identifiable {
    // the index in model.data for x & y axis
    let index: Int
    let value: CGFloat
    let title: String
    let pos: CGFloat
    
    var id: Int {
        return index
    }
    
    init(index: Int, value: CGFloat = 0, title: String, pos: CGFloat) {
        self.index = index
        self.value = value
        self.title = title
        self.pos = pos
    }
}

