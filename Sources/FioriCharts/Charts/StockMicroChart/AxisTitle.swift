//
//  AxisTitle.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation

struct AxisTitle: Identifiable {
    // the index in model.data for x axis
    let index: Int
    let title: String
    
    var id: Int {
        return index
    }
}
