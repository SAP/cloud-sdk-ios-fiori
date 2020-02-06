//
//  TableCardView.swift
//  DevTest
//
//  Created by Ma, Xiao on 2/3/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

public struct TableCardView: View {
    
    @ObservedObject var model: TableCard
    
    public init(model: TableCard) {
        self.model = model
    }
    
    public var body: some View {
        Group {
            VStack(alignment: .leading) {
                HeaderView(model: model.header)
                    .padding(.bottom)
                TableTitleRowView(model: model.content.value?.first?.columns)
                    .padding(EdgeInsets.init(top: 0, leading: -4, bottom: 0, trailing: -8))
                    .padding(.bottom)
                ForEach(model.content.value!) {
                    TableRowView(model: $0)
                        .padding(.bottom)
                }
            }
        }
        .padding(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray, lineWidth: 0.5)
        ).padding(0)
    }
}
