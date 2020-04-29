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
            model.selectedIndex = newValue
        }
    }
    
//    public var titleFont: Font? {
//        get {
//            return model.font
//        }
//        set {
//            model.font = newValue
//        }
//    }
    
//    public var controlStateColor: ControlStateColor? {
//        get {
//            return model.controlStateColor
//        }
//        set {
//            model.controlStateColor = newValue
//        }
//    }
    
    lazy public private(set) var selectionDidChangePublisher: AnyPublisher<Int?, Never> = {
        self.model.$selectedIndex.eraseToAnyPublisher()
    }()
        
    @ObservedObject private var model: Model = Model()
    
    public init(segmentTitles: [String],
                interItemSpacing: CGFloat = 6,
                titleInsets: EdgeInsets = EdgeInsets.init(top: 8, leading: 8, bottom: 8, trailing: 8),
                selectedIndex: Int? = nil) {
        self.segmentTitles              = segmentTitles
        self.titleInsets                = titleInsets
        self.model.interItemSpacing     = interItemSpacing
        self.model.selectedIndex        = selectedIndex
        self.model.segmentAttributes    = [
            .normal: SegmentAttribute(fontColor: .gray, borderColor: .init(red: 0.2, green: 0.2, blue: 0.2)),
            .selected: SegmentAttribute(fontColor: .blue, borderColor: .blue),
            .disabled: SegmentAttribute(fontColor: .gray, borderColor: .init(red: 0.2, green: 0.2, blue: 0.2))
        ]
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: self.model.interItemSpacing) {
                ForEach(segmentTitles.indices, id: \.self) { index in
                    Segment(title: self.segmentTitles[index], isSelected: self.model.selectedIndex == index, segmentAttributes: self.model.segmentAttributes, titleInset: self.model.titleInset)
                        .onTapGesture {
                            self.selectionDidChange(index: index)
                        }
                }
            }
            .padding([.top, .bottom], 8)
            .padding([.leading, .trailing], horizontalSizeClass == .compact ? 16 : 48)
        }
    }

    private func selectionDidChange(index: Int?) {
        if selectedIndex != index {
            self.model.selectedIndex = index
        }
    }
}

//extension DimensionSelector {
//    public func onIndexChange(_ handler: @escaping ((Int?) -> Void)) -> some View {
//        self.modifier(OnIndexChangeModifier(dimensionSelector: self, handler: handler))
//    }
//}
//
//struct OnIndexChangeModifier: ViewModifier {
//    let dimensionSelector: DimensionSelector
//    let handler: ((Int?) -> Void)
//
//    func body(content: Content) -> some View {
//        dimensionSelector.getBody(selectionDidChangeHandler: handler)
//    }
//}

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
        @Published var selectedIndex: Int?
        @Published var interItemSpacing: CGFloat!
        @Published var titleInset: EdgeInsets!
        @Published var segmentAttributes: [ControlState: SegmentAttribute]!
    }
}

struct DimensionSelector_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


