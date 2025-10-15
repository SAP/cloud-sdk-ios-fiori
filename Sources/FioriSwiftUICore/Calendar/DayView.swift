import FioriThemeManager
import SwiftUI

extension VerticalAlignment {
    enum TitleFirstTextBaselineAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.firstTextBaseline]
        }
    }

    static let titleFirstTextBaseline = VerticalAlignment(TitleFirstTextBaselineAlignment.self)
    
    enum EventIndicatorCenterAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.bottom]
        }
    }

    static let eventIndicatorCenterAlignment = VerticalAlignment(EventIndicatorCenterAlignment.self)
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
    let title: String
    let subtitle: String?
    
    let isEventIndicatorVisible: Bool
    
    var state: DayViewState
    
    let customEventView: any View
    
    @Environment(\.eventViewColor) var eventViewColor
    @Environment(\.eventViewColorDisabled) var eventViewColorDisabled
    @Environment(\.selectionRangeColor) var selectionRangeColor
    @Environment(\.selectionSingleColor) var selectionSingleColor
    @Environment(\.calendarItemTintAttributes) var calendarItemTintAttributes
    
    init(title: String, subtitle: String? = nil, isEventIndicatorVisible: Bool = false, state: DayViewState = .normal, customEventView: any View = EmptyView()) {
        self.title = title
        self.subtitle = subtitle
        self.isEventIndicatorVisible = isEventIndicatorVisible
        self.state = state
        self.customEventView = customEventView
    }
    
    private var hasSubTitle: Bool {
        guard let subtitle else { return false }
        return subtitle.count > 0
    }
    
    public var body: some View {
        ZStack(alignment: .top, content: {
            let height = (subtitle == nil ? 26 : 34) * self.scaleForSizeChange
            
            if self.state.isSingleSelected {
                let offset = self.state == .singleSelectedAndToday ? 4.0 : 0.0
                
                Circle()
                    .frame(width: height - offset, height: height - offset)
                    .foregroundStyle(self.selectionSingleColor)
                    .frame(width: height, height: height)
                    .ifApply(self.state == .singleSelectedAndToday) {
                        $0.overlay {
                            RoundedRectangle(cornerRadius: height / 2.0).stroke(self.selectionSingleColor, lineWidth: 1)
                        }
                    }
                    .padding(.top, self.hasSubTitle ? 2.5 : 7)
            } else if self.state.isMultiSelected {
                let topLeadingRadius = self.state == .multiSelectedStart ? height / 2.0 : 0
                let topTrailingRadius = self.state == .multiSelectedEnd ? height / 2.0 : 0
                
                UnevenRoundedRectangle(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: topLeadingRadius, bottomTrailingRadius: topTrailingRadius, topTrailingRadius: topTrailingRadius)
                    .foregroundStyle(self.multiSelectedBackgroundColor)
                    .frame(height: height)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 5.5)
            }
            
            VStack(spacing: 0, content: {
                Text(self.title)
                    .font(.fiori(fixedSize: self.titleFontSize, weight: self.titleWeight))
                    .foregroundStyle(self.titleColor)
                    .frame(height: self.titleHeight)
                    .padding(.top, self.titlePaddingTop)
                    .alignmentGuide(.titleFirstTextBaseline) { $0[.firstTextBaseline] }
                
                if let subtitle {
                    Text(subtitle)
                        .font(.fiori(fixedSize: 11 * self.scaleForSizeChange, weight: .regular))
                        .foregroundStyle(self.titleColor)
                        .frame(height: 13 * self.scaleForSizeChange)
                        .padding(.top, -4)
                }
                
                ZStack(alignment: .center) {
                    if self.isEventIndicatorVisible {
                        if self.customEventView.isEmpty {
                            Circle()
                                .foregroundStyle(self.eventForegroundColor)
                        } else {
                            self.customEventView.typeErased
                        }
                    }
                }
                .frame(width: 4, height: 4)
                .padding(.top, self.hasSubTitle ? 6 : 8)
                .padding(.bottom, self.hasSubTitle ? 7.5 : 9.5)
                
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

    var titleColor: Color {
        switch self.state {
        case .normal:
            return self.calendarItemTintAttributes[.title]?[.normal] ?? .preferredColor(.primaryLabel)
        case .today:
            return self.calendarItemTintAttributes[.title]?[.highlighted] ?? .preferredColor(.tintColor)
        case .singleSelected, .singleSelectedAndToday, .multiSelectedStart, .multiSelectedMiddle, .multiSelectedEnd:
            return self.calendarItemTintAttributes[.title]?[.selected] ?? .preferredColor(.primaryBackground)
        case .disabled, .disabledAndToday, .disabledInMultiSelection, .disabledAndTodayInMultiSelection:
            return self.calendarItemTintAttributes[.title]?[.disabled] ?? .preferredColor(.quaternaryLabel)
        case .outOfMonth:
            return .preferredColor(.quaternaryLabel)
        }
    }

    var multiSelectedBackgroundColor: Color {
        [.disabledInMultiSelection, .disabledAndTodayInMultiSelection].contains(self.state) ? .preferredColor(.quaternaryFill) : self.selectionRangeColor
    }

    var titleHeight: CGFloat {
        22 * self.scaleForSizeChange
//        ((state.isTitleBold || (self.state == .disabledInMultiSelection)) ? 22 : 21) * self.scaleForSizeChange
    }

    var titlePaddingTop: CGFloat {
        self.hasSubTitle ? 4 : 9
//        (state.isTitleBold || (self.state == .disabledInMultiSelection)) ? 9 : 9.5
    }

    var eventForegroundColor: Color {
        self.state.isDisabled ? self.eventViewColorDisabled : self.eventViewColor
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
