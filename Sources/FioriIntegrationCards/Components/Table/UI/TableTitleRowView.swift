//
//  TableTitleRowView.swift
//  DevTest
//
//  Created by Ma, Xiao on 2/3/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct TableTitleRowView: View {
    var model: [TableColumn]
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(0 ..< self.model.count) { index in
                    self.SafeText(self.model[index].title).font(.system(size: 14))
                }
                .frame(width: geometry.size.width / CGFloat(self.model.count), height: 40, alignment: .leading)
            }
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            .background(Color.init(UIColor.lightGray.withAlphaComponent(0.3)))
        }
        .frame(height: 40)
    }
}
