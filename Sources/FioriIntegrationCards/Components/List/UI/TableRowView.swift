//
//  TableRowView.swift
//  DevTest
//
//  Created by Ma, Xiao on 2/3/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct TableRowView: View {
    var model: TableRow
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(0 ..< self.model.columns!.count) { index in
                    TableColumnView(model: self.model.columns![index])
                        .frame(width: geometry.size.width / CGFloat(self.model.columns!.count), alignment: .leading)
                }
            }
        }
    }
}
