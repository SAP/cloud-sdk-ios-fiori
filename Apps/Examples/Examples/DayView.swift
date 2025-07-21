import FioriSwiftUICore
import SwiftUI

private extension VerticalAlignment {
    private enum TitleFirstTextBaselineAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.firstTextBaseline]
        }
    }

    static let titleFirstTextBaseline = VerticalAlignment(TitleFirstTextBaselineAlignment.self)
}

private extension UIContentSizeCategory {
    // Utility function to return ContentSize scale value
    // Imitate the design of Apple `UIFontMetrics(forTextStyle: ...).scaledFont(for: ...)` for font scaling
    // No bold() case considered
    //
    // system font 17 plain, diff category get ratio
    // default `.medium` 1.0 ratio
    //
    // Note: This solution is only designed to handle containers that are not use autoLayout and are scaled exactly according to the system scaling font standard resulting in overflowing UI
    //
    // - Returns: next `Double` in the view's hierarchy
    var sizeToScaleValue: Double {
        switch self {
        case .extraSmall:
            return 0.882758620689655
        case .small:
            return 0.937931034482759
        case .medium:
            return 1.0
        case .large:
            return 1.0448275862069
        case .extraLarge:
            return 1.16551724137931
        case .extraExtraLarge:
            return 1.24827586206897
        case .extraExtraExtraLarge:
            return 1.36551724137931
        case .accessibilityMedium:
            return 1.64137931034483
        case .accessibilityLarge:
            return 1.93793103448276
        case .accessibilityExtraLarge:
            return 2.33793103448276
        case .accessibilityExtraExtraLarge:
            return 2.77931034482759
        case .accessibilityExtraExtraExtraLarge:
            return 2.99310344827586
        default:
            return 1.0
        }
    }
}

struct DayView: View {
    var title: String
    var subtitle: String?
    
    var weekNumber: String?
    var weekNumberViewWidth: CGFloat = 0
    
    var isMultiSelect: Bool = false
    var isEventIndicatorVisible: Bool = false
    
    var titlePaddingTop: CGFloat {
        var titlePaddingTop: CGFloat = 0
        if self.hasSubTitle {
            if self.isMultiSelect {
                titlePaddingTop = 8
            } else {
                titlePaddingTop = 4
            }
        } else {
            if self.isMultiSelect {
                titlePaddingTop = 15
            } else {
                titlePaddingTop = 8
            }
        }
        return titlePaddingTop
    }
    
    private var hasSubTitle: Bool {
        guard let subtitle else { return false }
        return subtitle.count > 0
    }
    
    var body: some View {
        HStack(alignment: .titleFirstTextBaseline, spacing: 0, content: {
            if let weekNumber {
                Text(weekNumber)
                    .font(.fiori(fixedSize: 11 * self.scaleForSizeChange, weight: .regular))
                    .foregroundStyle(Color.preferredColor(.tertiaryLabel).opacity(0.6))
                    .alignmentGuide(.titleFirstTextBaseline) { $0[.firstTextBaseline] }
                    .frame(width: self.weekNumberViewWidth)
            }
            
            VStack(spacing: 0, content: {
                Text(self.title)
                    .font(.fiori(fixedSize: 16 * self.scaleForSizeChange, weight: .regular))
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
                    .frame(height: 21 * self.scaleForSizeChange)
                    .padding(.top, self.titlePaddingTop)
                    .alignmentGuide(.titleFirstTextBaseline) { $0[.firstTextBaseline] }
                
                if let subtitle {
                    Text(subtitle)
                        .font(.fiori(fixedSize: 11 * self.scaleForSizeChange, weight: .regular))
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                        .frame(height: 11 * self.scaleForSizeChange)
                        .padding(.top, -4)
                }
                
                Circle()
                    .frame(width: 4, height: 4)
                    .backgroundStyle(Color.preferredColor(.tertiaryLabel))
                    .padding(.top, self.hasSubTitle ? 6 : 8)
                    .opacity(self.isEventIndicatorVisible ? 1 : 0)
                
            })
            .frame(maxWidth: .infinity)
        })
    }
    
    var scaleForSizeChange: Double {
        self.sizeEnumToValue(limitMaxCategory: .accessibilityMedium)
    }
    
    func sizeEnumToValue(sizeCategory: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory,
                         limitMinCategory: UIContentSizeCategory = .extraSmall,
                         limitMaxCategory: UIContentSizeCategory = .accessibilityExtraExtraExtraLarge) -> Double
    {
        if sizeCategory < limitMinCategory {
            return limitMinCategory.sizeToScaleValue
        }
        
        if sizeCategory > limitMaxCategory {
            return limitMaxCategory.sizeToScaleValue
        }
        
        return sizeCategory.sizeToScaleValue
    }
}

#Preview {
    HStack {
        DayView(title: "6", subtitle: "12", weekNumber: "29", weekNumberViewWidth: 20)
        DayView(title: "7", subtitle: "13", isEventIndicatorVisible: true)
        DayView(title: "8", subtitle: "14")
        DayView(title: "9", subtitle: "15", isEventIndicatorVisible: true)
        DayView(title: "10", subtitle: "16", isEventIndicatorVisible: true)
        DayView(title: "11", subtitle: "17", isEventIndicatorVisible: true)
        DayView(title: "12", subtitle: "18")
    }
}
