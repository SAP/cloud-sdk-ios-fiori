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
    @State var safeAreaInsets: EdgeInsets = .init(.zero)
    
    @State var showBannerMessage: Bool = true
    
    @Environment(\.customLanguageId) var customLanguageId
    
    func datesSelectionAndShowBannerMessage(_ model: CalendarModel) -> Bool {
        model.calendarStyle == .datesSelection && self.showBannerMessage
    }
    
    public func makeBody(_ configuration: CalendarViewConfiguration) -> some View {
        ZStack(alignment: .bottom, content: {
            let paddingOffset: CGFloat = 8
            
            VStack(spacing: 0, content: {
                WeekContainerView()
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
                    .scrollPosition(id: configuration.$model.weekViewScrollPosition, anchor: .leading)
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
                            ForEach(0 ..< configuration.model.totalMonths, id: \.self) { index in
                                if let nextDate = self.calendar.date(byAdding: .month, value: index, to: configuration.model.startDate) {
                                    let startComponents = self.calendar.dateComponents([.year, .month], from: nextDate)
                                    if let year = startComponents.year, let month = startComponents.month {
                                        CalendarMonthView(calendarStyle: configuration.model.calendarStyle, year: year, month: month, startDate: configuration.model.startDate, endDate: configuration.model.endDate, showMonthHeader: false, showOutOfMonth: configuration.model.showOutOfMonth, selectedDate: configuration.model.selectedDate, selectedDates: configuration.model.selectedDates, selectedRange: configuration.model.selectedRange, disabledDates: configuration.model.disabledDates, dayTappedCallback: { date, dayViewState in
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
                            }
                        }
                        .scrollTargetLayout()
                    })
                    .scrollPosition(id: configuration.$model.scrollPosition, anchor: .leading)
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
                            ForEach(0 ..< configuration.model.totalMonths, id: \.self) { index in
                                if let nextDate = calendar.date(byAdding: .month, value: index, to: configuration.model.startDate) {
                                    let startComponents = self.calendar.dateComponents([.year, .month], from: nextDate)
                                    if let year = startComponents.year, let month = startComponents.month {
                                        CalendarMonthView(calendarStyle: configuration.model.calendarStyle, year: year, month: month, startDate: configuration.model.startDate, endDate: configuration.model.endDate, showMonthHeader: true, showOutOfMonth: configuration.model.showOutOfMonth, selectedDate: configuration.model.selectedDate, selectedDates: configuration.model.selectedDates, selectedRange: configuration.model.selectedRange, disabledDates: configuration.model.disabledDates, dayTappedCallback: { date, dayViewState in
                                            self.handleDayViewTapGesture(date, state: dayViewState, configuration: configuration)
                                        }, customEventView: configuration.customEventView)
                                            .fioriSizeReader { newValue in
                                                if abs(configuration.model.monthViewHeight - newValue.height) > 0.1 {
                                                    DispatchQueue.main.async {
                                                        configuration.model.monthViewHeight = newValue.height
                                                    }
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        .scrollTargetLayout()
                    })
                    .scrollPosition(id: configuration.$model.scrollPosition, anchor: .top)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .scrollBounceBehavior(.always)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(configuration.fillBackgroundColor)
                    )
                    .ifApply(configuration.model.calendarStyle == .month, content: {
                        $0.frame(height: configuration.model.monthViewHeight)
                    })
                    .padding(EdgeInsets(
                        top: 0,
                        leading: paddingOffset,
                        bottom: configuration.model.showFullScreen ? -1 * self.safeAreaInsets.bottom : paddingOffset,
                        trailing: paddingOffset
                    ))
                }
                
                if configuration.model.calendarStyle == .expandable {
                    CalendarDragView()
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
            })
            .setOnChange(of: configuration.model.title) {
                configuration.titleChangeCallback?(configuration.model.title ?? "")
            }
            .fioriSizeReader { size in
                DispatchQueue.main.async {
                    self.availableWidth = max(paddingOffset * 2, size.width)
                }
            }
            .onGeometryChange(for: EdgeInsets.self, of: { proxy in
                proxy.safeAreaInsets
            }, action: { newValue in
                if self.datesSelectionAndShowBannerMessage(configuration.model),
                   self.safeAreaInsets.bottom >= 0.0,
                   self.safeAreaInsets != newValue
                {
                    DispatchQueue.main.async {
                        self.safeAreaInsets = newValue
                    }
                }
            })
            
            if self.datesSelectionAndShowBannerMessage(configuration.model) {
                CalendarBannerView(title: "DatesSelectionBannerMessageKey".localizedFioriString(), bottomPadding: self.safeAreaInsets.bottom) {
                    self.showBannerMessage = false
                }
            }
        })
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
                        configuration.model.selectedRange = checkRange.lowerBound ... date
                    } else {
                        configuration.model.selectedRange = nil
                    }
                    configuration.model.selectedDate = nil
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
