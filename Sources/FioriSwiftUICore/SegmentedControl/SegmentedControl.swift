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
 
 segmentedControl = SegmentedControl(segmentTitles: segmentTitltes, selectedIndex: stockModel.indexOfStockSeries)
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
    
    /// Content inset for the segmented control.
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
    
    /// A Boolean value indicates whether empty selection is allowed. Default to `true`.
    public var allowEmptySelection: Bool {
        get {
            return model.allowEmptySelection
        }
        set {
            model.allowEmptySelection = newValue
        }
    }
    
    /// A `Publisher` which signals selection change.
    lazy public private(set) var selectionDidChangePublisher: AnyPublisher<Int?, Never> = {
        self.model.$selectedIndex.eraseToAnyPublisher()
    }()
    
    /// :nodoc:
    public private(set) var _heightDidChangePublisher = CurrentValueSubject<CGFloat, Never>(0)
        
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
        self.selectedIndex      = selectedIndex
        
        self.model.segmentAttributes = [
            .normal: SegmentAttributes(textColor: Color.preferredColor(.primary3), font: Font.system(.subheadline), borderColor: Color.preferredColor(.primary4)),
            .selected: SegmentAttributes(textColor: Color.preferredColor(.tintColor), font: Font.system(.subheadline), borderColor: Color.preferredColor(.tintColor)),
            .disabled: SegmentAttributes(textColor: Color.preferredColor(.primary3), font: Font.system(.subheadline), borderColor: Color.preferredColor(.primary4))
        ]
        
        if let _contentInset = contentInset {
            self.contentInset = _contentInset
        }
    }
    
    public var body: some View {
        Group {
            if model.segmentWidthMode == .equal {
                getHStack()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    getHStack()
                }
                .onPreferenceChange(SegmentPreferenceKey.self) { sizes in
                    switch self.model.segmentWidthMode {
                    case .maximum:
                        let size = sizes.max { $0.width < $1.width } ?? .zero
                        self._maxSegmentWidth = size.width
                    default:
                        break
                    }
                }
            }
        }
        .frame(width: nil, height: _height)
        .onPreferenceChange(HStackPreferenceKey.self) { heights in
            guard let height = heights.first, self._height != height else {
                return
            }
            
            self._height = height
            self._heightDidChangePublisher.send(height)
        }
    }
    
    @State private var _height: CGFloat = 0
    
    // For `SegmentWidthMode.maximum`
    @State private var _maxSegmentWidth: CGFloat? = nil
    
    /// :nodoc:
    private func getHStack() -> some View {
        return HStack(alignment: .center, spacing: self.model.interItemSpacing) {
            ForEach(self.model.titles.indices, id: \.self) { index in
                Segment(title: self.model.titles[index], isSelected: self.model.selectedIndex == index, isEnable: self.model.isEnable, segmentAttributes: self.model.segmentAttributes, insets: self.titleInsets)
                    .onTapGesture {
                        if self.model.isEnable {
                            self.selectionDidChange(index: index)
                        }
                }
                .background(SegmentPreferenceSetter())
                .modifier(SegmentFrame(segmentWidthMode: self.model.segmentWidthMode, width: self._segmentWidth))
                .overlay(ButtonOverlayView(isSelected: self.model.selectedIndex == index, isEnable: self.model.isEnable, segmentAttributes: self.model.segmentAttributes))
            }
        }
        .padding(contentInset)
        .lineLimit(1)
        .background(HStackPreferenceSetter())
    }
    
    private var _segmentWidth: CGFloat? {
        let width: CGFloat?
    
        switch self.model.segmentWidthMode {
        case .fixed(let _width):
            width = _width
        case .maximum:
            width = self._maxSegmentWidth
        default:
            width = nil
        }
    
        return width
    }

    private func selectionDidChange(index: Int?) {
        if allowEmptySelection {
            if selectedIndex == index {
                model.selectedIndex = nil
            } else {
                model.selectedIndex = index
            }
        } else {
            if selectedIndex != index {
                model.selectedIndex = index
            }
        }
    }
}

extension SegmentedControl {
    struct Segment: View {
        
        let title: String
        
        let isSelected: Bool
        
        let isEnable: Bool
        
        let segmentAttributes: [ControlState: SegmentAttributes]
        
        let insets: EdgeInsets
        
        var body: some View {
            Group {
                Text(self.title)
                    .padding(insets)
                    .font(self.isEnable ? (self.isSelected ? self.segmentAttributes[.selected]?.font : self.segmentAttributes[.normal]?.font) : self.segmentAttributes[.disabled]?.font)
                    .foregroundColor(self.isEnable ? (self.isSelected ? self.segmentAttributes[.selected]?.textColor : self.segmentAttributes[.normal]?.textColor) : (self.segmentAttributes[.disabled]?.textColor))
            }
        }
    }
    
    class Model: ObservableObject {
        @Published var titles: [String] = []
        @Published var selectedIndex: Int?
        @Published var interItemSpacing: CGFloat = 6
        @Published var titleInset: EdgeInsets = EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6)
        @Published var segmentAttributes: [ControlState: SegmentAttributes] = [:]
        @Published var contentInset: EdgeInsets?
        @Published var isEnable: Bool = true
        @Published var segmentWidthMode: SegmentWidthMode = .intrinsic
        @Published var allowEmptySelection: Bool = true
    }
    
    struct HStackPreferenceKey: PreferenceKey {
        typealias Value = [CGFloat]

        static var defaultValue: [CGFloat] = []
        
        static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
            value.append(contentsOf: nextValue())
        }
    }
    
    struct HStackPreferenceSetter: View {
        var body: some View {
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.clear)
                    .preference(key: HStackPreferenceKey.self,
                                value: [geometry.size.height])
            }
        }
    }
    
    struct SegmentPreferenceKey: PreferenceKey {
        typealias Value = [CGSize]

        static var defaultValue: [CGSize] = []
        
        static func reduce(value: inout [CGSize], nextValue: () -> [CGSize]) {
            value.append(contentsOf: nextValue())
        }
    }
    
    struct SegmentPreferenceSetter: View {
        var body: some View {
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.clear)
                    .preference(key: SegmentPreferenceKey.self,
                                value: [geometry.size])
            }
        }
    }
    
    struct SegmentFrame: ViewModifier {
        let segmentWidthMode: SegmentWidthMode
        
        // width for mode other than `.equal`
        let width: CGFloat?
        
        func body(content: Content) -> some View {
            Group {
                if segmentWidthMode == .equal {
                    content.frame(minWidth: 0, maxWidth: .infinity)
                } else if segmentWidthMode == .maximum {
                    content.fixedSize().frame(width: width)
                } else {
                    content.frame(width: width)
                }
            }
        }
    }
}

extension EdgeInsets {
    var horizontal: CGFloat {
        return leading + trailing
    }
    
    var vertical: CGFloat {
        return top + bottom
    }
}

struct DimensionSelector_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


