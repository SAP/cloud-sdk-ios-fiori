//
//  TimelineCardView.swift
//  DevTest
//
//  Created by Ma, Xiao on 2/5/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

public struct TimelineCardView: View {
    
    public var model: TimelineCard!
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HeaderView(model: model.header)
            Divider().accentColor(Color.primary)
            ForEach(model.content.value!) {
                TimelineItemView(model: $0)
            }
        }
        .padding(16)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 0.5)
        ).padding(16)
    }
    
    public init(model: TimelineCard) {
        self.model = model
    }
}
