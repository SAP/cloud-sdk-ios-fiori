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
 
extension DynamicTypeSize {
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

public enum CalendarDayState {
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
        let conditions: [CalendarDayState] = [
            .singleSelected,
            .singleSelectedAndToday,
            .multiSelectedStart,
            .multiSelectedMiddle,
            .multiSelectedEnd
        ]
        return conditions.contains(self)
    }

    var isDisabled: Bool {
        let conditions: [CalendarDayState] = [
            .outOfMonth,
            .disabled,
            .disabledAndToday,
            .disabledInMultiSelection,
            .disabledAndTodayInMultiSelection
        ]
        return conditions.contains(self)
    }
    
    var isTitleBold: Bool {
        let conditions: [CalendarDayState] = [
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
        let conditions: [CalendarDayState] = [
            .singleSelected,
            .singleSelectedAndToday
        ]
        return conditions.contains(self)
    }

    var isMultiSelected: Bool {
        let conditions: [CalendarDayState] = [
            .multiSelectedStart,
            .multiSelectedMiddle,
            .multiSelectedEnd,
            .disabledInMultiSelection,
            .disabledAndTodayInMultiSelection
        ]
        return conditions.contains(self)
    }
}
