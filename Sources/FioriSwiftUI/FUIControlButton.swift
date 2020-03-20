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
    
    var isSelected: Bool

    var body: some View {
        Text(title)
            .padding(8)
            .foregroundColor(self.isSelected ? Color.blue : Color.gray)
            .overlay(ButtonOverlayView(isSelected: self.isSelected))
    }
}
