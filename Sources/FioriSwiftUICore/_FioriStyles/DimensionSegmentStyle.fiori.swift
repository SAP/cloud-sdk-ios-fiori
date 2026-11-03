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
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .modifier(SegmentFrame(segmentWidthMode: self.modelObject.segmentWidthMode, width: self.getSegmentWidth()))
            .frame(minWidth: 54)
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
        @Environment(\.isLoading) var isLoading
        
        func makeBody(_ configuration: DimensionSegmentConfiguration) -> some View {
            let isEnabledSelected = self.isEnabled && configuration.isSelected
            return DimensionSegment(configuration)
                .ifApply(!LiquidGlassHelper.usesLiquidGlassUI, content: {
                    $0.background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .inset(by: (isEnabledSelected ? 1 : 0.33) / 2.0)
                            .stroke(self.isLoading ? Color.preferredColor(.separator) : (self.isEnabled ? (configuration.isSelected ? Color.preferredColor(.tintColor) : Color.preferredColor(.separator)) : Color.preferredColor(.secondaryFill)), lineWidth: isEnabledSelected ? 1 : 0.33)
                    )
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(self.isLoading ? Color.preferredColor(.separator) : (isEnabledSelected ? Color.preferredColor(.secondaryGroupedBackground) : Color.preferredColor(.tertiaryFill))))
                })
                .ifApply(LiquidGlassHelper.usesLiquidGlassUI) {
                    if #available(iOS 26.0, watchOS 26.0, visionOS 26.0, *) {
                        $0
                        #if !os(visionOS)
                        .glassEffect(.regular.tint(isEnabledSelected ? .preferredColor(.tintColor) : .clear))
                        #else
                        .glassBackgroundEffect()
                        #endif
                        .typeErased
                    } else {
                        $0.typeErased
                    }
                }
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let dimensionSegmentConfiguration: DimensionSegmentConfiguration
        @Environment(\.isEnabled) var isEnabled
        @Environment(\.isLoading) var isLoading
        
        var selectedForegroundColor: Color {
            if LiquidGlassHelper.usesLiquidGlassUI {
                #if !os(visionOS)
                    .preferredColor(.quinaryLabel)
                #else
                    .preferredColor(.tintColor)
                #endif
            } else {
                .preferredColor(.tintColor)
            }
        }
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(Font.fiori(forTextStyle: .body))
                .fontWeight(self.isEnabled && self.dimensionSegmentConfiguration.isSelected ? .semibold : nil)
                .foregroundColor(self.isLoading ? Color.preferredColor(.separator) : (self.isEnabled && self.dimensionSegmentConfiguration.isSelected ? self.selectedForegroundColor : Color.preferredColor(.secondaryLabel)))
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
