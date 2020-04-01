//
//  DimensionSelector.swift
//  DimensionSelector
//
//  Created by Ma, Xiao on 3/17/20.
//  Copyright © 2020 Ma, Xiao. All rights reserved.
//

import Foundation
import SwiftUI

public struct DimensionSelector: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass: UserInterfaceSizeClass?
    
    public let segmentTitles: [String]
    
    public var selectionDidChangeHandler: ((Int?) -> Void)?
    
    @State var interItemSpacing: CGFloat = 6
    
    @State public var selectedIndex: Int?
    
    public init(titles: [String], selectionDidChangeHandler: ((Int?) -> Void)? = nil, selectedIndex: Int? = nil) {
        self.segmentTitles = titles
        self.selectionDidChangeHandler = selectionDidChangeHandler
        _selectedIndex = State(initialValue: selectedIndex)
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: interItemSpacing) {
                ForEach(segmentTitles.indices, id: \.self) { index in
                    Segment(title: self.segmentTitles[index], isSelected: self.selectedIndex == index)
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
            selectedIndex = index
        } else {
            selectedIndex = nil
        }
        
//        print("selectedIndex: \(selectedIndex)")
        
        if let handler = self.selectionDidChangeHandler {
            handler(selectedIndex)
        }
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
