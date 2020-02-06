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
        HStack {
            ForEach(model.columns!) {
                TableColumnView(model: $0)
                    .frame(width: 90, height: 30, alignment: .leading)
            }
        }
    }
}
