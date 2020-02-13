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
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(model: model.header)
            Divider().accentColor(Color.primary)
                .padding([.bottom, .top])
            ForEach(0 ..< model.content.value!.count) { index in
                TimelineItemView(model: self.model.content.value![index], isLast: index == self.model.content.value!.count - 1)
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
