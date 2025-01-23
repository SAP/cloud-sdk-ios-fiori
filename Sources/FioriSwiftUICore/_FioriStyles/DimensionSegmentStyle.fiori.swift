import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// Base Layout style
public struct DimensionSegmentBaseStyle: DimensionSegmentStyle {
    @EnvironmentObject private var modelObject: DimensionSegmentModelObject
    
    public func makeBody(_ configuration: DimensionSegmentConfiguration) -> some View {
        configuration.title
            .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
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
            let isEnabledSelected = self.isEnabled && configuration.isSelected
            return DimensionSegment(configuration)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .inset(by: (isEnabledSelected ? 1 : 0.33) / 2.0)
                        .stroke(self.isEnabled ? (configuration.isSelected ? Color.preferredColor(.tintColor) : Color.preferredColor(.separator)) : Color.preferredColor(.secondaryFill), lineWidth: isEnabledSelected ? 1 : 0.33)
                )
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(isEnabledSelected ? Color.preferredColor(.secondaryGroupedBackground) : Color.preferredColor(.tertiaryFill)))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let dimensionSegmentConfiguration: DimensionSegmentConfiguration
        @Environment(\.isEnabled) var isEnabled
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(Font.fiori(forTextStyle: .subheadline))
                .foregroundColor(self.isEnabled && self.dimensionSegmentConfiguration.isSelected ? Color.preferredColor(.tintColor) : Color.preferredColor(.secondaryLabel))
        }
    }
}

class DimensionSegmentModelObject: ObservableObject {
    var segmentWidthMode: SegmentWidthMode
    @Published var _maxSegmentWidth: CGFloat?
    
    // Initializes a `DimensionSegmentModelObject` with attributes from `DimensionSelector`.
    public init(_maxSegmentWidth: CGFloat?, segmentWidthMode: SegmentWidthMode) {
        self._maxSegmentWidth = _maxSegmentWidth
        self.segmentWidthMode = segmentWidthMode
    }
}
