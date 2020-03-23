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
    
    public let controlTitles: [String]
    
    public var selectionDidChangeHandler: ((Int?) -> Void)?
    public var selectedIndex: Int? {
        set {
            model.selectedIndex = newValue
        }
        get {
            return model.selectedIndex
        }
    }
    
    @ObservedObject private var model: DimensionSelectorModel = DimensionSelectorModel()
    
    public init(titles: [String], selectionDidChangeHandler: ((Int?) -> Void)? = nil, selectedIndex: Int? = nil) {
        self.controlTitles = titles
        self.selectionDidChangeHandler = selectionDidChangeHandler
        self.model.selectedIndex = selectedIndex
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 6) {
                ForEach(controlTitles.indices, id: \.self) { index in
                    FUIControlButton(title: self.controlTitles[index], isSelected: self.model.selectedIndex == index)
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
        if model.selectedIndex != index {
            model.selectedIndex = index
        } else {
            model.selectedIndex = nil
        }
        print("selected: \(selectedIndex ?? -1)")
        if let handler = self.selectionDidChangeHandler {
            handler(selectedIndex)
        }
    }
}
