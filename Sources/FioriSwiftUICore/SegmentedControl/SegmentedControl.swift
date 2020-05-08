//
//  SegmentedControl.swift
//  FioriSwiftUICore
//
//  Created by Ma, Xiao on 3/17/20.
//  Copyright © 2020 Ma, Xiao. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
/**
A SegmentedControl object is a horizontal control made of multiple segments, each segment functioning as a discrete button.
Selection is mutually exclusive.
 
 ## Code usage:
 ```
 let titles = ["intraday: 1min", "one day: 1min", "1year:1day", "3years:1week"]
 var segmentedControl: SegmentedControl!
 var cancellableSet: Set<AnyCancellable> = []
 
 segmentedControl = SegmentedControl(segmentTitles: segmentTitltes, selectedIndex: stockModel.selectedSeriesIndex)
 segmentedControl.selectionDidChangePublisher
     .store(in: &cancellableSet)
 ```
 */

public struct SegmentedControl: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass: UserInterfaceSizeClass?
    
    /// Titles for the segments
    public var titles: [String] {
        get {
            return model.titles
        }
        set {
            model.titles = newValue
        }
    }
    
    /// A dictionary for setting attributes.
    public var segmentAttributes: [ControlState: SegmentAttributes] {
        get {
            return model.segmentAttributes
        }
        set {
            model.segmentAttributes = newValue
        }
    }

    /// Custom title insets for each segment.
    public var titleInsets: EdgeInsets {
        get {
            return model.titleInset
        }
        set {
            model.titleInset = newValue
        }
    }
    
    ///The space between two segments. Default value is 6.
    public var interItemSpacing: CGFloat {
        get {
            return model.interItemSpacing
        }
        set {
            model.interItemSpacing = newValue
        }
    }
    
    /**
     The index number identifying the selected segment (that is, the last segment touched).
     
     When this property is directly set to a new value by developer, the event handler registered on FUISegmentedControl will get invoked. If this property is set to a negative value, the current selection will be canceled. If exceeding the upper range, no change to the current selection. If the value is set to nil, it will de-select the current selection.
     */
    public var selectedIndex: Int? {
        get {
            return model.selectedIndex
        }
        set {
            guard self.isEnable else {
                return
            }
            if let value = newValue, (value < 0 || value >= self.titles.count) {
                return
            }
            model.selectedIndex = newValue
        }
    }

    /// If set to false, previous selection will be removed.
    public var isEnable: Bool {
        get {
            return model.isEnable
        }
        set {
            if !newValue {
                self.selectionDidChange(index: nil)
            }
            model.isEnable = newValue
        }
    }
    
    /// Content inset for the segmented control. Currently support leading and trailing insets.
    public var contentInset: EdgeInsets {
        get {
            let leadingAndTrailing: CGFloat = horizontalSizeClass == .compact ? 16 : 48
            let defaultInset = EdgeInsets(top: 8, leading: leadingAndTrailing, bottom: 8, trailing: leadingAndTrailing)
            return model.contentInset ?? defaultInset
        }
        set {
            return model.contentInset = newValue
        }
    }
    
    /// Segment width, default is `.intrinsic`
    public var segmentWidthMode: SegmentWidthMode {
        get {
            return model.segmentWidthMode
        }
        set {
            model.segmentWidthMode = newValue
        }
    }
    
    lazy public private(set) var selectionDidChangePublisher: AnyPublisher<Int?, Never> = {
        self.model.$selectedIndex.eraseToAnyPublisher()
    }()
        
    @ObservedObject private var model: Model = Model()
    
    
    /// Initializes and returns a segmented control with segments having the given titles.
    /// - Parameters:
    ///   - segmentTitles: An array of String objects (for segment titles).
    ///   - interItemSpacing: Margin between two segments, default is 6.
    ///   - titleInsets: Title insets for each segment.
    ///   - selectedIndex: An integer for setting pre-selection.
    ///   - contentInset: Option, content inset for the segmented control. Currently support leading and trailing insets.
    public init(segmentTitles: [String],
                interItemSpacing: CGFloat = 6,
                titleInsets: EdgeInsets = EdgeInsets.init(top: 8, leading: 8, bottom: 8, trailing: 8),
                selectedIndex: Int? = nil,
                contentInset: EdgeInsets? = nil) {
        self.titles      = segmentTitles
        self.titleInsets        = titleInsets
        self.interItemSpacing   = interItemSpacing
        self.model.isEnable     = true
        self.selectedIndex      = selectedIndex
        
        self.model.segmentAttributes = [
            .normal: SegmentAttributes(fontColor: .gray, font: UIFont.preferredFont(forTextStyle: .subheadline), borderColor: .init(red: 0.2, green: 0.2, blue: 0.2)),
            .selected: SegmentAttributes(fontColor: .blue, font: UIFont.preferredFont(forTextStyle: .subheadline), borderColor: .blue),
            .disabled: SegmentAttributes(fontColor: .gray, font: UIFont.preferredFont(forTextStyle: .subheadline), borderColor: .init(red: 0.2, green: 0.2, blue: 0.2))
        ]
        
        self.model.segmentWidthMode = .intrinsic
        
        if let _contentInset = contentInset {
            self.contentInset = _contentInset
        }
    }
    
    /// :nodoc:
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: self.model.interItemSpacing) {
                ForEach(self.model.titles.indices, id: \.self) { index in
                    Segment(title: self.model.titles[index], isSelected: self.model.selectedIndex == index, isEnable: self.model.isEnable, segmentAttributes: self.model.segmentAttributes, size: self.getSegmentSize(at: index))
                        .onTapGesture {
                            if self.model.isEnable {
                                self.selectionDidChange(index: index)
                            }
                        }
                }
            }
            .padding([.top, .bottom], 8)
            .padding(.leading, model.contentInset?.leading ?? (horizontalSizeClass == .compact ? 16 : 48))
            .padding(.trailing, model.contentInset?.trailing ?? (horizontalSizeClass == .compact ? 16 : 48))
        }
    }

    private func selectionDidChange(index: Int?) {
        if selectedIndex != index {
            self.model.selectedIndex = index
        }
    }
    
    private func getSegmentSize(at index: Int) -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0

        switch self.model.segmentWidthMode {
        case .fixed(let _width):
            width = _width
        case .intrinsic:
            width = getSizeForString(self.titles[index]).width
        case .maximum:
            for title in titles {
                width = max(width, getSizeForString(title).width)
            }
        default :
            width = getSizeForString(self.titles[index]).width
        }
        
        for title in titles {
            height = max(height, getSizeForString(title).height)
        }
        
        return CGSize(width: width + titleInsets.leading + titleInsets.trailing,
                      height: height + titleInsets.top + titleInsets.bottom)
    }
    
    private func largestFont() -> UIFont {
        var fonts: [UIFont] = []
        if let normalFont = segmentAttributes[.normal]?.font {
            fonts.append(normalFont.withSize(segmentAttributes[.normal]?.fontSize ?? normalFont.pointSize))
        }
        if let selectedFont = segmentAttributes[.selected]?.font {
            fonts.append(selectedFont.withSize(segmentAttributes[.selected]?.fontSize ?? selectedFont.pointSize))
        }
        if let disabledFont = segmentAttributes[.disabled]?.font {
            fonts.append(disabledFont.withSize(segmentAttributes[.disabled]?.fontSize ?? disabledFont.pointSize))
        }
        
        let sortedFont = fonts.sorted { (font1, font2) -> Bool in
            return font1.pointSize < font2.pointSize
        }
        return sortedFont.last ?? UIFont.preferredFont(forTextStyle: .subheadline)
    }
    
    private func getSizeForString(_ string: String) -> CGSize {
        return (string as NSString).size(withAttributes: [NSAttributedString.Key.font : largestFont()])
    }
}

extension SegmentedControl {
    struct Segment: View {
        
        let title: String
        
        var isSelected: Bool
        
        var isEnable: Bool
                
        var segmentAttributes: [ControlState: SegmentAttributes]
                
        var size: CGSize

        var body: some View {
            Text(self.title)
                .font(self.isEnable ? (self.isSelected ? self.segmentAttributes[.selected]?.getFont() : self.segmentAttributes[.normal]?.getFont()) : self.segmentAttributes[.disabled]?.getFont())
                .foregroundColor(self.isEnable ? (self.isSelected ? self.segmentAttributes[.selected]?.fontColor : self.segmentAttributes[.normal]?.fontColor) : (self.segmentAttributes[.disabled]?.fontColor))
                .frame(width: self.size.width, height: self.size.height)
                .overlay(ButtonOverlayView(isSelected: self.isSelected, isEnable: self.isEnable, segmentAttributes: self.segmentAttributes))
        }
    }
    
    class Model: ObservableObject {
        @Published var titles: [String]!
        @Published var selectedIndex: Int?
        @Published var interItemSpacing: CGFloat!
        @Published var titleInset: EdgeInsets!
        @Published var segmentAttributes: [ControlState: SegmentAttributes]!
        @Published var contentInset: EdgeInsets?
        @Published var isEnable: Bool!
        @Published var segmentWidthMode: SegmentWidthMode!
    }
}

struct DimensionSelector_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


