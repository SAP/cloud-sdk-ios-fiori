import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct CalendarDayViewBaseStyle: CalendarDayViewStyle {
    @Environment(\.eventViewColor) var eventViewColor
    @Environment(\.eventViewColorDisabled) var eventViewColorDisabled
    @Environment(\.selectionRangeColor) var selectionRangeColor
    @Environment(\.selectionSingleColor) var selectionSingleColor
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    public func makeBody(_ configuration: CalendarDayViewConfiguration) -> some View {
        ZStack(alignment: .top, content: {
            if configuration.state.isSingleSelected {
                let height = (configuration.hasSubTitle ? 34 : 26) * self.scaleForSizeChange
                let offset = configuration.state == .singleSelectedAndToday ? 4.0 : 0.0
                
                Circle()
                    .frame(width: height - offset, height: height - offset)
                    .foregroundStyle(self.selectionSingleColor)
                    .frame(width: height, height: height)
                    .ifApply(configuration.state == .singleSelectedAndToday) {
                        $0.overlay {
                            RoundedRectangle(cornerRadius: height / 2.0).stroke(self.selectionSingleColor, lineWidth: 1)
                        }
                    }
                    .padding(.top, configuration.hasSubTitle ? 2.5 : 7)
            } else if configuration.state.isMultiSelected {
                let height = (configuration.hasSubTitle ? 38 : 30) * self.scaleForSizeChange
                let topLeadingRadius = configuration.state == .multiSelectedStart ? height / 2.0 : 0
                let topTrailingRadius = configuration.state == .multiSelectedEnd ? height / 2.0 : 0
                
                UnevenRoundedRectangle(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: topLeadingRadius, bottomTrailingRadius: topTrailingRadius, topTrailingRadius: topTrailingRadius)
                    .foregroundStyle(self.multiSelectedBackgroundColor(configuration))
                    .frame(height: height)
                    .frame(maxWidth: .infinity)
                    .padding(.top, configuration.hasSubTitle ? 0 : 3.5)
            }
            
            VStack(spacing: 0, content: {
                configuration.title
                    .frame(height: 22 * self.scaleForSizeChange)
                    .padding(.top, configuration.hasSubTitle ? 4 : 9)
                    .alignmentGuide(.titleFirstTextBaseline) { $0[.firstTextBaseline] }
                
                if configuration.hasSubTitle {
                    configuration.subtitle
                        .padding(.top, -3)
                        .padding(.bottom, 1)
                }
                
                ZStack(alignment: .center) {
                    if configuration.isEventIndicatorVisible {
                        if configuration.customEventView.isEmpty {
                            Circle()
                                .foregroundStyle(self.eventForegroundColor(configuration))
                        } else {
                            configuration.customEventView.typeErased
                        }
                    }
                }
                .frame(width: 4, height: 4)
                .padding(.top, configuration.hasSubTitle ? 6 : 8)
                .padding(.bottom, configuration.hasSubTitle ? 7.5 : 9.5)
                
            })
        })
    }
    
    /// Limit max type size to save more space to display all the contents
    var scaleForSizeChange: Double {
        sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
    }
    
    func eventForegroundColor(_ configuration: CalendarDayViewConfiguration) -> Color {
        configuration.state.isDisabled ? self.eventViewColorDisabled : self.eventViewColor
    }
    
    func multiSelectedBackgroundColor(_ configuration: CalendarDayViewConfiguration) -> Color {
        [.disabledInMultiSelection, .disabledAndTodayInMultiSelection].contains(configuration.state) ? .preferredColor(.quaternaryFill) : self.selectionRangeColor
    }
}

extension CalendarDayViewConfiguration {
    var hasSubTitle: Bool {
        !subtitle.isEmpty
    }
}

// Default fiori styles
extension CalendarDayViewFioriStyle {
    struct ContentFioriStyle: CalendarDayViewStyle {
        func makeBody(_ configuration: CalendarDayViewConfiguration) -> some View {
            CalendarDayView(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let calendarDayViewConfiguration: CalendarDayViewConfiguration
        
        @Environment(\.calendarItemTintAttributes) var calendarItemTintAttributes
        @Environment(\.dynamicTypeSize) var dynamicTypeSize

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
//                .font(.fiori(fixedSize: self.titleFontSize, weight: self.titleWeight))
                .foregroundStyle(self.titleColor)
        }
        
        var titleFontSize: CGFloat {
            (self.calendarDayViewConfiguration.state.isTitleBold ? 17 : 16) * self.scaleForSizeChange
        }
        
        var titleWeight: Font.FioriWeight {
            self.calendarDayViewConfiguration.state.isTitleBold ? .bold : .regular
        }
        
        var titleColor: Color {
            switch self.calendarDayViewConfiguration.state {
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
        
        /// Limit max type size to save more space to display all the contents
        var scaleForSizeChange: Double {
            sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let calendarDayViewConfiguration: CalendarDayViewConfiguration
        @Environment(\.calendarItemTintAttributes) var calendarItemTintAttributes
        @Environment(\.dynamicTypeSize) var dynamicTypeSize

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .font(.fiori(fixedSize: 11 * self.scaleForSizeChange, weight: .regular))
                .foregroundStyle(self.titleColor)
        }
        
        var titleColor: Color {
            switch self.calendarDayViewConfiguration.state {
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
        
        /// Limit max type size to save more space to display all the contents
        var scaleForSizeChange: Double {
            sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
        }
    }
}

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

func checkDateRangeContainsDate(_ selectedRange: ClosedRange<Date>, date: Date) -> Bool {
    let calendar = Calendar.autoupdatingCurrent
    return calendar.compare(date, to: selectedRange.lowerBound, toGranularity: .day) != .orderedAscending && calendar.compare(date, to: selectedRange.upperBound, toGranularity: .day) != .orderedDescending
}
