import FioriThemeManager
import SwiftUI

extension VerticalAlignment {
    enum TitleFirstTextBaselineAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.firstTextBaseline]
        }
    }

    static let titleFirstTextBaseline = VerticalAlignment(TitleFirstTextBaselineAlignment.self)
}

private extension DynamicTypeSize {
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
        case .xSmall:
            return 0.882758620689655
        case .small:
            return 0.937931034482759
        case .medium:
            return 1.0
        case .large:
            return 1.0448275862069
        case .xLarge:
            return 1.16551724137931
        case .xxLarge:
            return 1.24827586206897
        case .xxxLarge:
            return 1.36551724137931
        case .accessibility1:
            return 1.64137931034483
        case .accessibility2:
            return 1.93793103448276
        case .accessibility3:
            return 2.33793103448276
        case .accessibility4:
            return 2.77931034482759
        case .accessibility5:
            return 2.99310344827586
        default:
            return 1.0
        }
    }
}

enum DayViewState {
    case normal
    case today
    case outOfMonth
    case singleSelected
    case singleSelectedAndToday
    case multiSelectedStart
    case multiSelectedMiddle
    case multiSelectedEnd
    case disabled
    case disabledAndToday
    /// A disabled date can only appear in the middle of the selection
    case disabledInMultiSelection
    /// A disabled date can only appear in the middle of the selection
    case disabledAndTodayInMultiSelection
    
    var isSelected: Bool {
        let conditions: [DayViewState] = [
            .singleSelected,
            .singleSelectedAndToday,
            .multiSelectedStart,
            .multiSelectedMiddle,
            .multiSelectedEnd
        ]
        return conditions.contains(self)
    }

    var isDisabled: Bool {
        let conditions: [DayViewState] = [
            .outOfMonth,
            .disabled,
            .disabledAndToday,
            .disabledInMultiSelection,
            .disabledAndTodayInMultiSelection
        ]
        return conditions.contains(self)
    }
    
    var isTitleBold: Bool {
        let conditions: [DayViewState] = [
            .today,
            .singleSelected,
            .singleSelectedAndToday,
            .multiSelectedStart,
            .multiSelectedMiddle,
            .multiSelectedEnd,
            .disabledAndToday,
            .disabledAndTodayInMultiSelection
        ]
        return conditions.contains(self)
    }

    var isSingleSelected: Bool {
        let conditions: [DayViewState] = [
            .singleSelected,
            .singleSelectedAndToday
        ]
        return conditions.contains(self)
    }

    var isMultiSelected: Bool {
        let conditions: [DayViewState] = [
            .multiSelectedStart,
            .multiSelectedMiddle,
            .multiSelectedEnd,
            .disabledInMultiSelection,
            .disabledAndTodayInMultiSelection
        ]
        return conditions.contains(self)
    }
}

public struct DayView: View {
    var title: String
    var subtitle: String?
    
    var isEventIndicatorVisible: Bool = false
    
    var state: DayViewState = .normal
    
    private var hasSubTitle: Bool {
        guard let subtitle else { return false }
        return subtitle.count > 0
    }
    
    public var body: some View {
        ZStack(alignment: .top, content: {
            let height = (subtitle == nil ? 29 : 39) * self.scaleForSizeChange
            
            if self.state.isSingleSelected {
                let offset = self.state == .singleSelectedAndToday ? 4.0 : 0.0
                
                Circle()
                    .frame(width: height - offset, height: height - offset)
                    .foregroundStyle(Color.preferredColor(self.selectedBackgroundColorStyle))
                    .frame(width: height, height: height)
                    .ifApply(self.state == .singleSelectedAndToday) {
                        $0.overlay {
                            RoundedRectangle(cornerRadius: height / 2.0).stroke(Color.preferredColor(self.selectedBackgroundColorStyle), lineWidth: 1)
                        }
                    }
                    .padding(.top, 5.5)
            } else if self.state.isMultiSelected {
                let topLeadingRadius = self.state == .multiSelectedStart ? height / 2.0 : 0
                let topTrailingRadius = self.state == .multiSelectedEnd ? height / 2.0 : 0
                
                UnevenRoundedRectangle(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: topLeadingRadius, bottomTrailingRadius: topTrailingRadius, topTrailingRadius: topTrailingRadius)
                    .foregroundStyle(Color.preferredColor(self.selectedBackgroundColorStyle))
                    .frame(width: .infinity, height: height)
                    .padding(.top, 5.5)
            }
            
            VStack(spacing: 0, content: {
                Text(self.title)
                    .font(.fiori(fixedSize: self.titleFontSize, weight: self.titleWeight))
                    .foregroundStyle(Color.preferredColor(self.titleColorStyle))
                    .frame(height: self.titleHeight)
                    .padding(.top, self.titlePaddingTop)
                    .alignmentGuide(.titleFirstTextBaseline) { $0[.firstTextBaseline] }
                
                if let subtitle {
                    Text(subtitle)
                        .font(.fiori(fixedSize: 11 * self.scaleForSizeChange, weight: .regular))
                        .foregroundStyle(Color.preferredColor(self.titleColorStyle))
                        .frame(height: 13 * self.scaleForSizeChange)
                        .padding(.top, -2)
                }
                
                Circle()
                    .frame(width: 4, height: 4)
                    .foregroundStyle(Color.preferredColor(self.eventForegroundColorStyle))
                    .padding(.top, self.hasSubTitle ? 6 : 8)
                    .padding(.bottom, 9.5)
                    .opacity(self.isEventIndicatorVisible ? 1 : 0)
                
            })
        })
    }
    
    var titleTextStyle: Font.FioriTextStyle {
        self.state.isTitleBold ? .body : .callout
    }
    
    var titleFontSize: CGFloat {
        (self.state.isTitleBold ? 17 : 16) * self.scaleForSizeChange
    }
    
    var titleWeight: Font.FioriWeight {
        self.state.isTitleBold ? .bold : .regular
    }

    var titleColorStyle: ColorStyle {
        switch self.state {
        case .normal:
            return .primaryLabel
        case .today:
            return .tintColor
        case .singleSelected, .singleSelectedAndToday, .multiSelectedStart, .multiSelectedMiddle, .multiSelectedEnd:
            return .primaryBackground
        case .outOfMonth, .disabled, .disabledAndToday, .disabledInMultiSelection, .disabledAndTodayInMultiSelection:
            return .quaternaryLabel
        }
    }

    var selectedBackgroundColorStyle: ColorStyle {
        [.disabledInMultiSelection, .disabledAndTodayInMultiSelection].contains(self.state) ? .quaternaryFill : .tintColor
    }

    var titleHeight: CGFloat {
        22 * self.scaleForSizeChange
//        ((state.isTitleBold || (self.state == .disabledInMultiSelection)) ? 22 : 21) * self.scaleForSizeChange
    }

    var titlePaddingTop: CGFloat {
        9
//        (state.isTitleBold || (self.state == .disabledInMultiSelection)) ? 9 : 9.5
    }

    var eventForegroundColorStyle: ColorStyle {
        self.state.isDisabled ? .quaternaryLabel : .tertiaryLabel
    }
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var scaleForSizeChange: Double {
        sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
    }
}

extension View {
    func sizeEnumToValue(dynamicTypeSize: DynamicTypeSize,
                         limitMinTypeSize: DynamicTypeSize = .xSmall,
                         limitMaxTypeSize: DynamicTypeSize = .xxxLarge) -> Double
    {
        if dynamicTypeSize < limitMinTypeSize {
            return limitMinTypeSize.sizeToScaleValue
        }
        
        if dynamicTypeSize > limitMaxTypeSize {
            return limitMaxTypeSize.sizeToScaleValue
        }
        
        return dynamicTypeSize.sizeToScaleValue
    }
}

#Preview {
    HStack(spacing: 28, content: {
        DayView(title: "7", isEventIndicatorVisible: true, state: .normal)
        DayView(title: "7", isEventIndicatorVisible: true, state: .today)
        DayView(title: "7", isEventIndicatorVisible: true, state: .outOfMonth)
        DayView(title: "7", isEventIndicatorVisible: true, state: .disabled)
        DayView(title: "7", isEventIndicatorVisible: true, state: .disabledAndToday)
    })
    HStack(spacing: 0, content: {
        DayView(title: "7", isEventIndicatorVisible: true, state: .multiSelectedStart)
            .frame(width: 50)
        DayView(title: "8", isEventIndicatorVisible: true, state: .disabledInMultiSelection)
            .frame(width: 50)
        DayView(title: "9", isEventIndicatorVisible: true, state: .multiSelectedMiddle)
            .frame(width: 50)
        DayView(title: "10", isEventIndicatorVisible: true, state: .disabledAndTodayInMultiSelection)
            .frame(width: 50)
        DayView(title: "11", isEventIndicatorVisible: true, state: .multiSelectedEnd)
            .frame(width: 50)
    })
    HStack(spacing: 0, content: {
        DayView(title: "7", subtitle: "13", isEventIndicatorVisible: true, state: .multiSelectedStart)
            .frame(width: 50)
        DayView(title: "8", subtitle: "14", isEventIndicatorVisible: true, state: .disabledInMultiSelection)
            .frame(width: 50)
        DayView(title: "9", subtitle: "15", isEventIndicatorVisible: true, state: .multiSelectedMiddle)
            .frame(width: 50)
        DayView(title: "10", subtitle: "16", isEventIndicatorVisible: true, state: .disabledAndTodayInMultiSelection)
            .frame(width: 50)
        DayView(title: "11", subtitle: "17", isEventIndicatorVisible: true, state: .multiSelectedEnd)
            .frame(width: 50)
    })
    
    HStack(spacing: 20) {
        DayView(title: "8", state: .singleSelectedAndToday)
        DayView(title: "9", isEventIndicatorVisible: true, state: .singleSelected)
        DayView(title: "10", subtitle: "13", isEventIndicatorVisible: true)
        DayView(title: "11", subtitle: "14", state: .singleSelectedAndToday)
        DayView(title: "12", subtitle: "15", isEventIndicatorVisible: true, state: .singleSelected)
    }
}
