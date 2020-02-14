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
            VStack(alignment: .center) {
                HeaderView(model: model.header)
                TableTitleRowView(model: model.content.value?.first?.columns)
                ForEach(model.content.value!) {
                    TableRowView(model: $0)
                        .frame(height: 30)
                }
            }
        }
        .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray, lineWidth: 0.5)
        ).padding(20)
    }
}
