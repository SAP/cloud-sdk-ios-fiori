//
//  DimensionSelector.swift
//  DimensionSelector
//
//  Created by Ma, Xiao on 3/17/20.
//  Copyright © 2020 Ma, Xiao. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public struct DimensionSelector: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass: UserInterfaceSizeClass?
    
    let segmentTitles: [String]
    
    let interItemSpacing: CGFloat
    
    public var selectedIndex: Int? {
        get {
            return model.selectedIndex
        }
        set {
            model.selectedIndex = newValue
        }
    }
    
    public var selectionDidChangePublisher: CurrentValueSubject<Int?, Never>?
    
    @ObservedObject private var model: DimensionSelectorModel = DimensionSelectorModel()
    
    public init(segmentTitles: [String],
                interItemSpacing: CGFloat = 6,
                selectedIndex: Int?) {
        self.segmentTitles = segmentTitles
        self.interItemSpacing = interItemSpacing
        self.model.selectedIndex = selectedIndex
        
        self.selectionDidChangePublisher = CurrentValueSubject(selectedIndex)
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: interItemSpacing) {
                ForEach(segmentTitles.indices, id: \.self) { index in
                    Segment(title: self.segmentTitles[index], isSelected: self.model.selectedIndex == index)
                        .onTapGesture {
                            self.selectionDidChange(index: index)
                        }
                }
            }
            .padding([.top, .bottom], 8)
            .padding([.leading, .trailing], horizontalSizeClass == .compact ? 16 : 48)
        }
    }
    
    private func selectionDidChange(index: Int) {
        if selectedIndex != index {
            self.model.selectedIndex = index
        } else {
            self.model.selectedIndex = nil
        }
                
        selectionDidChangePublisher?.send(self.model.selectedIndex)
    }
}

extension DimensionSelector {
    struct Segment: View {
        
        let title: String
        
        var isSelected: Bool

        var body: some View {
            Text(title)
                .padding(8)
                .foregroundColor(self.isSelected ? Color.blue : Color.gray)
                .overlay(ButtonOverlayView(isSelected: self.isSelected))
        }
    }
}

struct DimensionSelector_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
