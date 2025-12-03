import FioriThemeManager
import Foundation
import SwiftUI

extension CalendarViewConfiguration {
    var fillBackgroundColor: Color {
        if [.rangeSelection, .datesSelection].contains(model.calendarStyle) {
            self.customCalendarBackgroundColor ?? .preferredColor(.secondaryGroupedBackground)
        } else {
            self.customCalendarBackgroundColor ?? .preferredColor(.tertiaryGroupedBackground)
        }
    }
}

// Base Layout style
public struct CalendarViewBaseStyle: CalendarViewStyle {
    let calendar = Calendar.autoupdatingCurrent
    
    @State var weekViewHeight: CGFloat = 60
    
    @State var availableWidth: CGFloat = 16
    
    @Environment(\.customLanguageId) var customLanguageId
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    // swiftlint:disable function_body_length
    public func makeBody(_ configuration: CalendarViewConfiguration) -> some View {
        ZStack(alignment: .bottom, content: {
            let paddingOffset: CGFloat = 8
            
            VStack(spacing: 0, content: {
                WeekContainerView(firstWeekday: configuration.model.firstWeekday)
                    .padding(EdgeInsets(top: 0, leading: paddingOffset, bottom: 0, trailing: paddingOffset))
                
                if configuration.model.calendarStyle == .week || (configuration.model.calendarStyle == .expandable && !configuration.model.isExpanded && !configuration.model.isDragging) {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(0 ..< configuration.model.weeks.count, id: \.self) { index in
                                let info = configuration.model.weeks[index]
                                CalendarWeekView(calendarStyle: configuration.model.calendarStyle, weekInfo: info, startDate: configuration.model.startDate, endDate: configuration.model.endDate, selectedDate: configuration.model.selectedDate, disabledDates: configuration.model.disabledDates, dayTappedCallback: { date, dayViewState in
                                    self.handleDayViewTapGesture(date, state: dayViewState, configuration: configuration)
                                })
                                .frame(width: self.availableWidth - paddingOffset * 2)
                                .fioriSizeReader { size in
                                    DispatchQueue.main.async {
                                        self.weekViewHeight = size.height
                                    }
                                }
                            }
                        }
                        .scrollTargetLayout()
                    })
                    .scrollPosition(id: Binding<Int?>(get: { configuration.model.weekViewScrollPosition }, set: { configuration.model.weekViewScrollPosition = $0 }), anchor: .leading)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .scrollBounceBehavior(.always)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(configuration.fillBackgroundColor)
                    )
                    .frame(width: self.availableWidth - paddingOffset * 2, height: self.weekViewHeight)
                    .padding(EdgeInsets(top: 0, leading: paddingOffset, bottom: paddingOffset, trailing: paddingOffset))
                } else if configuration.model.calendarStyle == .expandable {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(0 ..< configuration.model.months.count, id: \.self) { index in
                                let monthModel = configuration.model.months[index]
                                CalendarMonthView(calendarStyle: configuration.model.calendarStyle, model: monthModel, startDate: configuration.model.startDate, endDate: configuration.model.endDate, showsMonthHeader: configuration.model.showsMonthHeader, showsOutOfMonthDates: configuration.model.showsOutOfMonthDates, selectedDate: configuration.model.selectedDate, selectedDates: configuration.model.selectedDates, selectedRange: configuration.model.selectedRange, disabledDates: configuration.model.disabledDates, dayTappedCallback: { date, dayViewState in
                                    self.handleDayViewTapGesture(date, state: dayViewState, configuration: configuration)
                                }, customEventView: configuration.customEventView)
                                    .frame(width: self.availableWidth - paddingOffset * 2)
                                    .fioriSizeReader { newValue in
                                        if abs(configuration.model.monthViewHeight - newValue.height) > 0.1 {
                                            DispatchQueue.main.async {
                                                configuration.model.monthViewHeight = newValue.height
                                            }
                                        }
                                    }
                            }
                        }
                        .scrollTargetLayout()
                    })
                    .scrollPosition(id: self.$scrollPosition, anchor: .leading)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .scrollBounceBehavior(.always)
                    .frame(width: self.availableWidth - paddingOffset * 2)
                    .frame(height: {
                        if configuration.model.isDragging, configuration.model.currentMonthOriginHeight > 0 {
                            return configuration.model.currentMonthOriginHeight
                        } else {
                            return configuration.model.monthViewHeight
                        }
                    }())
                    .clipped()
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(configuration.fillBackgroundColor)
                    )
                    .padding(EdgeInsets(top: 0, leading: paddingOffset, bottom: paddingOffset, trailing: paddingOffset))
                } else if configuration.model.calendarStyle == .month || configuration.model.showFullScreen {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVStack {
                            ForEach(0 ..< configuration.model.months.count, id: \.self) { index in
                                let monthModel = configuration.model.months[index]
                                CalendarMonthView(calendarStyle: configuration.model.calendarStyle, model: monthModel, startDate: configuration.model.startDate, endDate: configuration.model.endDate, showsMonthHeader: true, showsOutOfMonthDates: configuration.model.showsOutOfMonthDates, selectedDate: configuration.model.selectedDate, selectedDates: configuration.model.selectedDates, selectedRange: configuration.model.selectedRange, disabledDates: configuration.model.disabledDates, dayTappedCallback: { date, dayViewState in
                                    self.handleDayViewTapGesture(date, state: dayViewState, configuration: configuration)
                                }, customEventView: configuration.customEventView)
                                    .fioriSizeReader { newValue in
                                        if abs(configuration.model.monthViewHeight - newValue.height) > 0.1 {
                                            DispatchQueue.main.async {
                                                configuration.model.monthViewHeight = newValue.height
                                            }
                                        }
                                    }
                                    .padding(.bottom, self.monthViewPaddingBottom(index: index, configuration))
                            }
                            .padding(.top, configuration.model.showsMonthHeader ? 0 : -self.monthHeaderHeight)
                        }
                        .scrollTargetLayout()
                    })
                    .scrollPosition(id: self.$scrollPosition, anchor: .top)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .scrollBounceBehavior(.always)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(configuration.fillBackgroundColor)
                    )
                    .ifApply(configuration.model.calendarStyle == .month, content: {
                        $0.frame(height: configuration.model.monthViewHeight - (configuration.model.showsMonthHeader ? 0 : self.monthHeaderHeight))
                    })
                    .padding(EdgeInsets(
                        top: 0,
                        leading: paddingOffset,
                        bottom: paddingOffset,
                        trailing: paddingOffset
                    ))
                }
                
                if configuration.model.calendarStyle == .expandable {
                    CalendarDragView()
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel(Text("Handle to switch from month view to week view".localizedFioriString()))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    configuration.model.isDragging = true
                                    configuration.model.currentMonthOriginHeight += value.translation.height
                                    configuration.model.currentMonthOriginHeight = min(configuration.model.currentMonthOriginHeight, configuration.model.monthViewHeight)
                                }
                                .onEnded { _ in
                                    configuration.model.isDragging = false
                                    configuration.model.isExpanded.toggle()
                                }
                        )
                }
            })
            .ifApply(configuration.model.scrollPosition != nil, content: {
                $0.animation(.spring, value: configuration.model.isExpanded)
            })
            .onAppear(perform: {
                configuration.model.customLanguageId = self.customLanguageId
                configuration.titleChangeCallback?(configuration.model.title ?? "")
                DispatchQueue.main.async {
                    self.scrollPosition = configuration.model.scrollPosition
                }
            })
            .setOnChange(of: configuration.model.title) {
                configuration.titleChangeCallback?(configuration.model.title ?? "")
            }
            .setOnChange(of: configuration.model.scrollPosition) {
                DispatchQueue.main.async {
                    self.scrollPosition = configuration.model.scrollPosition
                }
            }
            .setOnChange(of: self.scrollPosition) {
                configuration.model.scrollPosition = self.scrollPosition
            }
            .fioriSizeReader { size in
                let availableWidth = max(paddingOffset * 2, size.width)
                if abs(self.availableWidth - availableWidth) > 0.1 {
                    DispatchQueue.main.async {
                        self.availableWidth = availableWidth
                    }
                }
            }
        })
    }
    
    @State var scrollPosition: Int?
    
    func monthViewPaddingBottom(index: Int, _ configuration: CalendarViewConfiguration) -> CGFloat {
        (index == configuration.model.months.count - 1) ? 0 : (configuration.model.showsMonthHeader ? 0 : (configuration.model.calendarStyle == .month ? 30 : self.monthHeaderHeight))
    }
    
    var monthHeaderHeight: CGFloat {
        44 + 17 * self.scaleForSizeChange
    }
    
    var scaleForSizeChange: Double {
        sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
    }
    
    func handleDayViewTapGesture(_ date: Date, state: CalendarDayState, configuration: CalendarViewConfiguration) {
        if configuration.model.calendarStyle == .datesSelection {
            if let checkDates = configuration.model.selectedDates {
                if checkDates.contains(date) {
                    configuration.model.selectedDates?.remove(date)
                } else {
                    configuration.model.selectedDates?.insert(date)
                }
            } else {
                configuration.model.selectedDates = [date]
            }
        } else {
            let calendar = Calendar.autoupdatingCurrent
            if configuration.model.calendarStyle == .rangeSelection {
                if let checkRange = configuration.model.selectedRange {
                    if calendar.compare(date, to: checkRange.upperBound, toGranularity: .day) != .orderedDescending,
                       calendar.compare(date, to: checkRange.lowerBound, toGranularity: .day) != .orderedAscending
                    {
                        let bounds = [checkRange.lowerBound, date].sorted()
                        if let first = bounds.first, let last = bounds.last {
                            configuration.model.selectedRange = first ... last
                        }
                        configuration.model.selectedDate = nil
                    } else {
                        configuration.model.selectedRange = nil
                        configuration.model.selectedDate = date
                    }
                } else if let boundDate = configuration.model.selectedDate {
                    let bounds = [boundDate, date].sorted()
                    if let first = bounds.first, let last = bounds.last {
                        configuration.model.selectedRange = first ... last
                    }
                    configuration.model.selectedDate = nil
                } else {
                    configuration.model.selectedDate = state.isSelected ? nil : date
                }
            } else {
                configuration.model.selectedDate = state.isSelected ? nil : date
            }
        }
    }
}

// Default fiori styles
extension CalendarViewFioriStyle {
    struct ContentFioriStyle: CalendarViewStyle {
        func makeBody(_ configuration: CalendarViewConfiguration) -> some View {
            CalendarView(configuration)
            // Add default style for its content
            // .background()
        }
    }
}
