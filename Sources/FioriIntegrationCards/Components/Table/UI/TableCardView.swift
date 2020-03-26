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
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(model: model.header)
            
            VStack(alignment: .leading, spacing: 0) {
                TableTitleRowView(model: model.content.first?.columns)
                ForEach(model.content) {
                    TableRowView(model: $0)
                        .frame(height: 30)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .padding(10)
        }
        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray, lineWidth: 0.5)
        ).padding(20)
    }
}
