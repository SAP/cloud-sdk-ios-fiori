import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// Base Layout style
public struct DimensionSelectorBaseStyle: DimensionSelectorStyle {
    @EnvironmentObject private var modelObject: DimensionSelectorModelObject
    @Environment(\.isEnabled) var isEnabled
    @State private var _maxSegmentWidth: CGFloat? = nil
    
    public func makeBody(_ configuration: DimensionSelectorConfiguration) -> some View {
        Group {
            if self.modelObject.segmentWidthMode == .equal {
                self.getHStack(configuration)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    self.getHStack(configuration)
                }
                .onPreferenceChange(SegmentPreferenceKey.self) {
                    if self.modelObject.segmentWidthMode == .maximum {
                        self._maxSegmentWidth = $0
                    }
                }
            }
        }
    }
    
    func getHStack(_ configuration: DimensionSelectorConfiguration) -> some View {
        HStack(alignment: .center, spacing: self.modelObject.interItemSpacing) {
            ForEach(self.modelObject.titles.indices, id: \.self) { index in
                Text(self.modelObject.titles[index])
                    .padding(self.modelObject.titleInsets)
                    .font(self.getSegmentAttributes(configuration, for: index)?.font)
                    .foregroundColor(self.getSegmentAttributes(configuration, for: index)?.textColor)
                    .modifier(SegmentFrame(segmentWidthMode: self.modelObject.segmentWidthMode, width: self.getSegmentWidth()))
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .inset(by: self.getSegmentAttributes(configuration, for: index)!.borderWidth! / 2.0)
                            .stroke(self.getSegmentAttributes(configuration, for: index)!.borderColor!, lineWidth: self.getSegmentAttributes(configuration, for: index)!.borderWidth!)
                    )
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(self.getSegmentAttributes(configuration, for: index)!.backgroundColor!))
                    .onTapGesture {
                        if self.modelObject.isEnable {
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
        .padding(self.modelObject.contentInset)
        .lineLimit(1)
    }
    
    func segmentTapped(_ configuration: DimensionSelectorConfiguration, for index: Int) {
        if self.modelObject.allowEmptySelection, self.modelObject.selectedIndex == index {
            configuration.selectedIndex = nil
        } else {
            configuration.selectedIndex = index
        }
    }
        
    func getSegmentAttributes(_ configuration: DimensionSelectorConfiguration, for index: Int) -> SegmentAttributes? {
        let isSelected = self.modelObject.selectedIndex == index
        let isDisabled = !self.modelObject.isEnable || !self.isEnabled
        if isDisabled, configuration.selectedIndex != nil {
            configuration.selectedIndex = nil
        }
        return isDisabled ? self.modelObject.segmentAttributes[.disabled] : (isSelected ? self.modelObject.segmentAttributes[.selected] : self.modelObject.segmentAttributes[.normal])
    }
        
    func getSegmentWidth() -> CGFloat? {
        switch self.modelObject.segmentWidthMode {
        case .fixed(let _width):
            return _width
        case .maximum:
            return self._maxSegmentWidth
        default:
            return nil
        }
    }
    
    struct SegmentFrame: ViewModifier {
        let segmentWidthMode: SegmentWidthMode
        
        let width: CGFloat?
        
        func body(content: Content) -> some View {
            Group {
                if self.segmentWidthMode == .equal {
                    content.frame(minWidth: 0, maxWidth: .infinity)
                } else if self.segmentWidthMode == .maximum {
                    content.fixedSize().frame(width: self.width)
                } else {
                    content.frame(width: self.width)
                }
            }
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
                .environmentObject(DimensionSelectorModelObject(segmentTitles: configuration.titles, selectedIndex: configuration.selectedIndex, configuration: configuration))
        }
    }
    
    struct TitlesFioriStyle: TitlesStyle {
        let dimensionSelectorConfiguration: DimensionSelectorConfiguration

        func makeBody(_ configuration: TitlesConfiguration) -> some View {
            Titles(configuration)
        }
    }
}

class DimensionSelectorModelObject: ObservableObject {
    @Published var titles: [String]

    @Published var selectedIndex: Int?
     
    @Published var titleInsets: EdgeInsets
    
    @Published var interItemSpacing: CGFloat
    
    @Published var segmentAttributes: [ControlState: SegmentAttributes]
     
    @Published var contentInset: EdgeInsets
     
    @Published var isEnable: Bool = true
     
    @Published var segmentWidthMode: SegmentWidthMode
     
    @Published var allowEmptySelection: Bool

    var configuration: DimensionSelectorConfiguration
    
    // Initializes a `DimensionSelectorModelObject` with default insets and attributes.
    public init(segmentTitles: [String],
                selectedIndex: Int? = nil,
                configuration: DimensionSelectorConfiguration)
    {
        self.titles = segmentTitles
        self.selectedIndex = selectedIndex
        self.titleInsets = configuration.titleInsets ?? EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6)
        self.interItemSpacing = configuration.interItemSpacing
        self.segmentAttributes = [
            .normal: configuration.segmentAttributes?[.normal] ?? SegmentAttributes(textColor: Color.preferredColor(.secondaryLabel), font: Font.fiori(forTextStyle: .subheadline), borderWidth: 0.33, borderColor: Color.preferredColor(.separator), backgroundColor: Color.preferredColor(.tertiaryFill)),
            .selected: configuration.segmentAttributes?[.selected] ?? SegmentAttributes(textColor: Color.preferredColor(.tintColor), font: Font.fiori(forTextStyle: .subheadline), borderWidth: 1.0, borderColor: Color.preferredColor(.tintColor), backgroundColor: Color.preferredColor(.secondaryGroupedBackground)),
            .disabled: configuration.segmentAttributes?[.disabled] ?? SegmentAttributes(textColor: Color.preferredColor(.secondaryLabel), font: Font.fiori(forTextStyle: .subheadline), borderWidth: 0.33, borderColor: Color.preferredColor(.secondaryFill), backgroundColor: Color.preferredColor(.tertiaryFill))
        ]
        self.contentInset = configuration.contentInset ?? EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        self.isEnable = configuration.isEnable
        self.segmentWidthMode = configuration.segmentWidthMode
        self.allowEmptySelection = configuration.allowEmptySelection
        self.configuration = configuration
    }
}
