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
    
    // relative postion
    var pos: CGPoint
    
    // the size of title
    let size: CGSize
    
    var id: Int {
        return index
    }
    
    init(index: Int, value: CGFloat = 0, title: String, pos: CGPoint, size: CGSize = .zero) {
        self.index = index
        self.value = value
        self.title = title
        self.pos = pos
        self.size = size
    }
    
    mutating func x(_ x: CGFloat) {
        self.pos.x = x
    }
}
