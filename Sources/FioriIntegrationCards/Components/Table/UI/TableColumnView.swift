//
//  TableColumnView.swift
//  DevTest
//
//  Created by Ma, Xiao on 1/31/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct TableColumnView: View {
    
    var model: TableColumn
    private let boldText: Bool
    
    init(model: TableColumn) {
        self.model = model
        self.boldText = model.identifier ?? false
    }
    
    var body: some View {
        SafeText(model.value)
            .foregroundColor(.forStatus(status: model.state))
            .font(.system(size: 12, weight: self.boldText ? .bold : .regular, design: .default))
            .frame( alignment: .leading)
    }
}
