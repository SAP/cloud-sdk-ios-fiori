//
//  FUIControlButton.swift
//  DimensionSelector
//
//  Created by Ma, Xiao on 3/17/20.
//  Copyright © 2020 Ma, Xiao. All rights reserved.
//

import Foundation
import SwiftUI

struct FUIControlButton: View {
    
    let title: String
    let index: Int
    @Binding var selectedIndex: Int?

    var body: some View {
        Text(title)
            .padding(8)
            .foregroundColor(self.selectedIndex == self.index ? Color.blue : Color.gray)
            .overlay(ButtonOverlayView(index: self.index, selectedIndex: self.$selectedIndex))
    }
}
