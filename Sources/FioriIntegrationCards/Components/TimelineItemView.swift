//
//  TimelineItemView.swift
//  DevTest
//
//  Created by Ma, Xiao on 2/4/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct TimelineItemView: View {
    
    var model: TimelineItem
    
    var body: some View {
        HStack {
            VStack {
                SafeView(model.icon)
            }
            VStack(alignment: .leading, spacing: 0) {
                SafeText(model.title).font(.body)
                SafeText(model.dateTime).font(.footnote).foregroundColor(.gray)
                Spacer()
                SafeText(model.description).font(.body)
            }
        }
    }
}

//struct Bubble: Shape {
//    func path(in rect: CGRect) -> Path {
//
//    }
//}
