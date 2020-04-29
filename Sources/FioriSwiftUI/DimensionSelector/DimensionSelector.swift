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
    
    public var titles: [String] {
        get {
            return model.titles
        }
        set {
            model.titles = newValue
        }
    }
    
    public var segmentAttributes: [ControlState: SegmentAttribute] {
        get {
            return model.segmentAttributes
        }
        set {
            model.segmentAttributes = newValue
        }
    }
    
    public var titleInsets: EdgeInsets {
        get {
            return model.titleInset
        }
        set {
            model.titleInset = newValue
        }
    }

    public var interItemSpacing: CGFloat {
        get {
            return model.interItemSpacing
        }
        set {
            model.interItemSpacing = newValue
        }
    }
        
    public var selectedIndex: Int? {
        get {
            return model.selectedIndex
        }
        set {
            guard let value = newValue, 0 <= value, value < self.titles.count else {
                return
            }
            model.selectedIndex = value
        }
    }
    
    public var leadingInset: CGFloat {
        get {
            return model.leadingInset ?? (horizontalSizeClass == .compact ? 16 : 48)
        }
        set {
            return model.leadingInset = newValue
        }
    }
    
    lazy public private(set) var selectionDidChangePublisher: AnyPublisher<Int?, Never> = {
        self.model.$selectedIndex.eraseToAnyPublisher()
    }()
        
    @ObservedObject private var model: Model = Model()
    
    public init(segmentTitles: [String],
                interItemSpacing: CGFloat = 6,
                titleInsets: EdgeInsets = EdgeInsets.init(top: 8, leading: 8, bottom: 8, trailing: 8),
                selectedIndex: Int? = nil,
                leadingInset: CGFloat? = nil) {
        self.titles      = segmentTitles
        self.titleInsets        = titleInsets
        self.interItemSpacing   = interItemSpacing
        self.selectedIndex      = selectedIndex
        
        self.model.segmentAttributes    = [
            .normal: SegmentAttribute(fontColor: .gray, borderColor: .init(red: 0.2, green: 0.2, blue: 0.2)),
            .selected: SegmentAttribute(fontColor: .blue, borderColor: .blue),
            .disabled: SegmentAttribute(fontColor: .gray, borderColor: .init(red: 0.2, green: 0.2, blue: 0.2))
        ]
        
        if let _leadingInset = leadingInset {
            self.leadingInset = _leadingInset
        }
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: self.model.interItemSpacing) {
                ForEach(self.model.titles.indices, id: \.self) { index in
                    Segment(title: self.model.titles[index], isSelected: self.model.selectedIndex == index, segmentAttributes: self.model.segmentAttributes, titleInset: self.model.titleInset)
                        .onTapGesture {
                            self.selectionDidChange(index: index)
                        }
                }
            }
            .padding([.top, .bottom], 8)
            .padding([.leading, .trailing], model.leadingInset ?? (horizontalSizeClass == .compact ? 16 : 48))
        }
    }

    private func selectionDidChange(index: Int?) {
        if selectedIndex != index {
            self.model.selectedIndex = index
        }
    }
}

extension DimensionSelector {
    struct Segment: View {
        
        let title: String
        
        var isSelected: Bool
                
        var segmentAttributes: [ControlState: SegmentAttribute]
        
        var titleInset: EdgeInsets

        var body: some View {
            Text(title)
                .font(self.isSelected ? segmentAttributes[.selected]?.font : segmentAttributes[.normal]?.font)
                .padding(titleInset)
                .foregroundColor(self.isSelected ? segmentAttributes[.selected]?.fontColor : segmentAttributes[.normal]?.fontColor)
                .overlay(ButtonOverlayView(isSelected: self.isSelected, segmentAttributes: segmentAttributes))
        }
    }
    
    class Model: ObservableObject {
        @Published var titles: [String]!
        @Published var selectedIndex: Int?
        @Published var interItemSpacing: CGFloat!
        @Published var titleInset: EdgeInsets!
        @Published var segmentAttributes: [ControlState: SegmentAttribute]!
        @Published var leadingInset: CGFloat?
    }
}

struct DimensionSelector_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


