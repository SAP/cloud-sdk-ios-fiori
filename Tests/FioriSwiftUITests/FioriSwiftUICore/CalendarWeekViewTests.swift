//
//  CalendarWeekViewTests.swift
//  FioriSwiftUI
//
//  Created by Zhang, Hengyi (external - Project) on 2025/10/28.
//
@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class CalendarWeekViewTests: XCTestCase {
    var fm: DateFormatter {
        let fm = DateFormatter()
        fm.timeZone = Calendar.current.timeZone
        fm.locale = Calendar.current.locale
        fm.dateFormat = "yyyy MM dd"
        return fm
    }
    
    var weekInfo: CalendarWeekInfo {
        CalendarWeekInfo(year: 2025, month: 10, weekNumber: 43, dates: [
            self.fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
    }
    
    func testCalendarWeekInfo() {
        let info = self.weekInfo
        XCTAssertEqual(info.year, 2025)
        XCTAssertEqual(info.month, 10)
        XCTAssertEqual(info.weekNumber, 43)
        XCTAssertEqual(info.dates.count, 7)
    }
    
    func testCalendarWeekView_DefaultInitialization() {
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let weekView = CalendarWeekView(calendarStyle: .month, weekInfo: weekInfo, startDate: startDate, endDate: endDate)
        XCTAssertNotNil(weekView)
        XCTAssertEqual(weekView.startDate, startDate)
        XCTAssertEqual(weekView.endDate, endDate)
        XCTAssertTrue(weekView.showOutOfMonth)
        XCTAssertNil(weekView.selectedDate)
        XCTAssertNil(weekView.selectedDates)
        XCTAssertNil(weekView.selectedRange)
        XCTAssertNil(weekView.disabledDates)
        XCTAssertNil(weekView.dayTappedCallback)
        XCTAssertTrue(weekView.customEventView(startDate).isEmpty)
    }
    
    func testCalendarWeekView_FullInitialization() {
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedDate = self.fm.date(from: "2025 10 27")!
        let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
        let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
            print("Tapped date:\(date), state:\(state)")
        }
        let weekView = CalendarWeekView(calendarStyle: .month, weekInfo: weekInfo, startDate: startDate, endDate: endDate, showOutOfMonth: false, selectedDate: selectedDate, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
        }
        XCTAssertNotNil(weekView)
        XCTAssertEqual(weekView.startDate, startDate)
        XCTAssertEqual(weekView.endDate, endDate)
        XCTAssertFalse(weekView.showOutOfMonth)
        XCTAssertEqual(weekView.selectedDate, selectedDate)
        XCTAssertTrue(disabledDates.isDisabled(self.weekInfo.dates.first!))
        XCTAssertFalse(disabledDates.isDisabled(self.weekInfo.dates.last!))
        XCTAssertNotNil(weekView.dayTappedCallback)
        XCTAssertTrue(weekView.customEventView(startDate).isEmpty)
    }
    
    func testCalendarWeekViewConfiguration_selectedDate() {
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedDate = self.fm.date(from: "2025 10 27")!
        let disabledDates = CalendarDisabledDates(weekdays: [1])
        let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
            print("Tapped date:\(date), state:\(state)")
        }
        
        let info = CalendarWeekInfo(year: 2025, month: 10, weekNumber: 43, dates: [
            fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
        
        let configuration = CalendarWeekViewConfiguration(calendarStyle: .month, weekInfo: info, startDate: startDate, endDate: endDate, showOutOfMonth: false, selectedDate: selectedDate, selectedDates: nil, selectedRange: nil, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
            Circle()
        }
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration.startDate, startDate)
        XCTAssertEqual(configuration.endDate, endDate)
        XCTAssertFalse(configuration.showOutOfMonth)
        XCTAssertEqual(configuration.selectedDate, selectedDate)
        XCTAssertTrue(disabledDates.isDisabled(self.weekInfo.dates.first!))
        XCTAssertFalse(disabledDates.isDisabled(self.weekInfo.dates.last!))
        XCTAssertNotNil(configuration.dayTappedCallback)
        XCTAssertFalse(configuration.customEventView(startDate).isEmpty)
        
        let style = CalendarWeekViewBaseStyle()
        XCTAssertTrue(style.weekNumberVisibility(configuration))
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 11 01")!), .outOfMonth)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 26")!), .disabled)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 27")!), .singleSelected)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 28")!), .normal)
        
        let info2 = CalendarWeekInfo(year: 2025, month: 11, weekNumber: 43, dates: [
            fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
        
        let configuration2 = CalendarWeekViewConfiguration(calendarStyle: .fullScreenMonth, weekInfo: info2, startDate: startDate, endDate: endDate, showOutOfMonth: false, selectedDate: selectedDate, selectedDates: nil, selectedRange: nil, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
            Circle()
        }
        let style2 = CalendarWeekViewBaseStyle()
        XCTAssertFalse(style2.weekNumberVisibility(configuration2))
    }
    
    func testCalendarWeekViewConfiguration_selectedDates() {
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedDates: Set<Date> = [fm.date(from: "2025 10 27")!]
        let disabledDates = CalendarDisabledDates(weekdays: [1])
        let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
            print("Tapped date:\(date), state:\(state)")
        }
        
        let info = CalendarWeekInfo(year: 2025, month: 10, weekNumber: 43, dates: [
            fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
        
        let configuration = CalendarWeekViewConfiguration(calendarStyle: .datesSelection, weekInfo: info, startDate: startDate, endDate: endDate, showOutOfMonth: false, selectedDate: nil, selectedDates: selectedDates, selectedRange: nil, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
            Circle()
        }
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration.startDate, startDate)
        XCTAssertEqual(configuration.endDate, endDate)
        XCTAssertFalse(configuration.showOutOfMonth)
        XCTAssertEqual(configuration.selectedDates, selectedDates)
        XCTAssertTrue(disabledDates.isDisabled(self.weekInfo.dates.first!))
        XCTAssertFalse(disabledDates.isDisabled(self.weekInfo.dates.last!))
        XCTAssertNotNil(configuration.dayTappedCallback)
        XCTAssertFalse(configuration.customEventView(startDate).isEmpty)
        
        let style = CalendarWeekViewBaseStyle()
        XCTAssertTrue(style.weekNumberVisibility(configuration))
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 11 01")!), .outOfMonth)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 26")!), .disabled)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 27")!), .singleSelected)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 28")!), .normal)
    }
    
    func testCalendarWeekViewConfiguration_selectedRange() {
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedRange: ClosedRange<Date> = self.fm.date(from: "2025 10 27")! ... self.fm.date(from: "2025 10 30")!
        let disabledDates = CalendarDisabledDates(weekdays: [1, 3])
        let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
            print("Tapped date:\(date), state:\(state)")
        }
        
        let info = CalendarWeekInfo(year: 2025, month: 10, weekNumber: 43, dates: [
            fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
        
        let configuration = CalendarWeekViewConfiguration(calendarStyle: .rangeSelection, weekInfo: info, startDate: startDate, endDate: endDate, showOutOfMonth: false, selectedDate: nil, selectedDates: nil, selectedRange: selectedRange, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
            Circle()
        }
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration.startDate, startDate)
        XCTAssertEqual(configuration.endDate, endDate)
        XCTAssertFalse(configuration.showOutOfMonth)
        XCTAssertEqual(configuration.selectedRange, selectedRange)
        XCTAssertTrue(disabledDates.isDisabled(self.weekInfo.dates.first!))
        XCTAssertFalse(disabledDates.isDisabled(self.weekInfo.dates.last!))
        XCTAssertNotNil(configuration.dayTappedCallback)
        XCTAssertFalse(configuration.customEventView(startDate).isEmpty)
        
        let style = CalendarWeekViewBaseStyle()
        XCTAssertTrue(style.weekNumberVisibility(configuration))
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 26")!), .disabled)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 27")!), .multiSelectedStart)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 28")!), .disabledInMultiSelection)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 29")!), .multiSelectedMiddle)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 30")!), .multiSelectedEnd)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 10 31")!), .normal)
        XCTAssertEqual(style.dayState(configuration, self.fm.date(from: "2025 11 01")!), .outOfMonth)
        
        let alternateDayTitle = style.getAlternateDayTitle(self.fm.date(from: "2025 10 26")!, identifier: .chinese, defaultLocale: Locale(identifier: "zh-Hans"))
        XCTAssertEqual(alternateDayTitle, "06")
        
        XCTAssertNil(style.getSecondaryDayTitle(self.fm.date(from: "2025 10 26")!))
    }
}
