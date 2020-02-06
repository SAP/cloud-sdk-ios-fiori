//
//  TimelineCardView.swift
//  DevTest
//
//  Created by Ma, Xiao on 2/5/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct TimelineCardView: View {
    
    var model: TimelineCard!
    
    var body: some View {
        ForEach(model.content.value!) {
            TimelineItemView(model: $0)
        }
    }
}
