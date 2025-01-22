// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// Base Layout style
public struct DimensionSelectorBaseStyle: DimensionSelectorStyle {
    @Environment(\.isEnabled) var isEnabled
    @State private var _maxSegmentWidth: CGFloat? = nil
    
    public func makeBody(_ configuration: DimensionSelectorConfiguration) -> some View {
        Group {
            if configuration.segmentWidthMode == .equal {
                self.getHStack(configuration)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    self.getHStack(configuration)
                }
                .onPreferenceChange(SegmentPreferenceKey.self) {
                    if configuration.segmentWidthMode == .maximum {
                        self._maxSegmentWidth = $0
                    }
                }
            }
        }
    }
    
    func getHStack(_ configuration: DimensionSelectorConfiguration) -> some View {
        if !self.isEnabled, configuration.selectedIndex != nil {
            configuration.selectedIndex = nil
        }
        return HStack(alignment: .center, spacing: configuration.interItemSpacing) {
            ForEach(configuration.titles.indices, id: \.self) { index in
                if !configuration.segment(configuration.titles[index]).isEmpty {
                    AnyView(configuration.segment(configuration.titles[index]))
                        .environmentObject(DimensionSegmentModelObject(segmentIndex: index, _maxSegmentWidth: self._maxSegmentWidth, configuration: configuration))
                        .onTapGesture {
                            self.segmentTapped(configuration, for: index)
                        }
                } else {
                    DimensionSegment(isSelected: configuration.selectedIndex == index)
                        .environmentObject(DimensionSegmentModelObject(segmentIndex: index, _maxSegmentWidth: self._maxSegmentWidth, configuration: configuration))
                        .onTapGesture {
                            self.segmentTapped(configuration, for: index)
                        }
                }
            }
            .background(GeometryReader { geometry in
                Color.clear.preference(
                    key: SegmentPreferenceKey.self,
                    value: geometry.size.width
                )
            })
        }
        .padding(configuration.contentInset ?? EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .lineLimit(1)
    }
    
    func segmentTapped(_ configuration: DimensionSelectorConfiguration, for index: Int) {
        if configuration.allowEmptySelection, configuration.selectedIndex == index {
            configuration.selectedIndex = nil
        } else {
            configuration.selectedIndex = index
        }
    }
    
    struct SegmentPreferenceKey: PreferenceKey {
        static let defaultValue: CGFloat = 0
        
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = max(value, nextValue())
        }
    }
}

// Default fiori styles
extension DimensionSelectorFioriStyle {
    struct ContentFioriStyle: DimensionSelectorStyle {
        func makeBody(_ configuration: DimensionSelectorConfiguration) -> some View {
            DimensionSelector(configuration)
        }
    }
}
