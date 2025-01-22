import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// Base Layout style
public struct DimensionSegmentBaseStyle: DimensionSegmentStyle {
    @EnvironmentObject private var modelObject: DimensionSegmentModelObject
    
    public func makeBody(_ configuration: DimensionSegmentConfiguration) -> some View {
        Text(self.modelObject.titles[self.modelObject.segmentIndex])
            .padding(self.modelObject.titleInsets)
            .modifier(SegmentFrame(segmentWidthMode: self.modelObject.segmentWidthMode, width: self.getSegmentWidth()))
    }
        
    func getSegmentWidth() -> CGFloat? {
        switch self.modelObject.segmentWidthMode {
        case .fixed(let _width):
            return _width
        case .maximum:
            return self.modelObject._maxSegmentWidth
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
}

// Default fiori styles
extension DimensionSegmentFioriStyle {
    struct ContentFioriStyle: DimensionSegmentStyle {
        @Environment(\.isEnabled) var isEnabled
        
        func makeBody(_ configuration: DimensionSegmentConfiguration) -> some View {
            DimensionSegment(configuration)
                .font(self.getSegmentAttributes(configuration).font)
                .foregroundColor(self.getSegmentAttributes(configuration).textColor)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .inset(by: self.getSegmentAttributes(configuration).borderWidth! / 2.0)
                        .stroke(self.getSegmentAttributes(configuration).borderColor!, lineWidth: self.getSegmentAttributes(configuration).borderWidth!)
                )
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(self.getSegmentAttributes(configuration).backgroundColor!))
        }
        
        func getSegmentAttributes(_ configuration: DimensionSegmentConfiguration) -> SegmentAttributes {
            if self.isEnabled {
                if configuration.isSelected {
                    return SegmentAttributes(textColor: Color.preferredColor(.tintColor), font: Font.fiori(forTextStyle: .subheadline), borderWidth: 1.0, borderColor: Color.preferredColor(.tintColor), backgroundColor: Color.preferredColor(.secondaryGroupedBackground))
                } else {
                    return SegmentAttributes(textColor: Color.preferredColor(.secondaryLabel), font: Font.fiori(forTextStyle: .subheadline), borderWidth: 0.33, borderColor: Color.preferredColor(.separator), backgroundColor: Color.preferredColor(.tertiaryFill))
                }
            }
            return SegmentAttributes(textColor: Color.preferredColor(.secondaryLabel), font: Font.fiori(forTextStyle: .subheadline), borderWidth: 0.33, borderColor: Color.preferredColor(.secondaryFill), backgroundColor: Color.preferredColor(.tertiaryFill))
        }
    }
}

class DimensionSegmentModelObject: ObservableObject {
    @Published var titles: [String]
    
    @Published var segmentIndex: Int
     
    @Published var titleInsets: EdgeInsets
    
    @Published var segmentWidthMode: SegmentWidthMode
     
    var _maxSegmentWidth: CGFloat?
    
    // Initializes a `DimensionSegmentModelObject` with attributes from `DimensionSelector` and default title insets.
    public init(segmentIndex: Int, _maxSegmentWidth: CGFloat?, configuration: DimensionSelectorConfiguration) {
        self.titles = configuration.titles
        self.segmentIndex = segmentIndex
        self._maxSegmentWidth = _maxSegmentWidth
        self.titleInsets = EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6)
        self.segmentWidthMode = configuration.segmentWidthMode
    }
}
