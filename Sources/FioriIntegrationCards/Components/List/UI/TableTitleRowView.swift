//
//  TableTitleRowView.swift
//  DevTest
//
//  Created by Ma, Xiao on 2/3/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct TableTitleRowView: View {
    var model: [TableColumn]!
    
    var body: some View {
        HStack {
            ForEach(model) {
                self.SafeText($0.title).font(.system(size: 14))
                    .frame(width: 90, height: 30, alignment: .leading)

            }
        }
        .background(Color.init(UIColor.lightGray.withAlphaComponent(0.3)))
    }
}
