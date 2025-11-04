//
//  CalendarViewTests.swift
//  FioriSwiftUI
//
//  Created by Zhang, Hengyi (external - Project) on 2025/10/29.
//
@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class CalendarViewTests: XCTestCase {
    var fm: DateFormatter {
        let fm = DateFormatter()
        fm.timeZone = Calendar.current.timeZone
        fm.locale = Calendar.current.locale
        fm.dateFormat = "yyyy MM dd"
        return fm
    }
    
    func testCalendarModel() {
        let year = 2025
        let selectedDate: Date = self.fm.date(from: "\(year) 09 29")!
        let scrollToDate: Date = self.fm.date(from: "\(year) 09 29")!
        let model = CalendarModel(selectedDate: selectedDate, scrollToDate: scrollToDate)
        
        XCTAssertEqual(model.calendarStyle, .month)
        XCTAssertFalse(model.isPersistentSelection)
        XCTAssertTrue(Calendar.current.compare(model.startDate, to: self.fm.date(from: "\(year) 01 01")!, toGranularity: .day) == .orderedSame)
        XCTAssertTrue(Calendar.current.compare(model.endDate, to: self.fm.date(from: "\(year + 1) 12 31")!, toGranularity: .day) == .orderedSame)
        XCTAssertTrue(Calendar.current.compare(model.scrollToDate, to: selectedDate, toGranularity: .day) == .orderedSame)
        XCTAssertTrue(Calendar.current.compare(model.selectedDate!, to: selectedDate, toGranularity: .day) == .orderedSame)
        XCTAssertNil(model.disabledDates)
        XCTAssertNil(model.displayDateAtStartup)
        XCTAssertEqual(model.scrollPosition, 8)
        XCTAssertEqual(model.months.count, 24)
        XCTAssertEqual(model.weeks.count, 105)
        XCTAssertNil(model.customLanguageId)
        XCTAssertNil(model.selectedDates)
        XCTAssertNil(model.selectedRange)
        XCTAssertEqual(model.monthViewHeight, 300)
        XCTAssertEqual(model.currentMonthOriginHeight, 0)
        XCTAssertEqual(model.title, "Sep 2025")
        XCTAssertFalse(model.isDragging)
        XCTAssertTrue(model.isExpanded)
        XCTAssertTrue(model.showsOutOfMonthDates)
        XCTAssertFalse(model.showFullScreen)
        
        model.scrollPosition = model.scrollPosition! + 1
        XCTAssertTrue(Calendar.current.compare(model.selectedDate!, to: self.fm.date(from: "\(year) 10 01")!, toGranularity: .day) == .orderedSame)
        
        model.calendarStyle = .week
        XCTAssertEqual(model.weekViewScrollPosition, 39)
        model.weekViewScrollPosition = model.weekViewScrollPosition! - 1
        XCTAssertTrue(Calendar.current.compare(model.selectedDate!, to: self.fm.date(from: "\(year) 09 24")!, toGranularity: .day) == .orderedSame)
        XCTAssertTrue(Calendar.current.compare(model.scrollToDate, to: self.fm.date(from: "\(year) 09 24")!, toGranularity: .day) == .orderedSame)
        
        model.customLanguageId = "zh-hans"
        XCTAssertEqual(model.customLanguageId, model.customLanguageId)
        XCTAssertEqual(model.title, "2025年9月")
        
        model.monthViewHeight = 350
        XCTAssertEqual(model.currentMonthOriginHeight, 350)
        
        model.calendarStyle = .datesSelection
        model.selectedDates = [
            self.fm.date(from: "\(year) 10 25")!
        ]
        XCTAssertEqual(model.title, String(format: "%d Date Selected".localizedFioriString(), 1))
        model.selectedDates = [
            self.fm.date(from: "\(year) 10 25")!,
            self.fm.date(from: "\(year) 10 26")!,
            self.fm.date(from: "\(year) 10 27")!
        ]
        XCTAssertEqual(model.title, String(format: "%d Dates Selected".localizedFioriString(), model.selectedDates!.count))
        
        model.calendarStyle = .rangeSelection
        model.selectedRange = self.fm.date(from: "\(year) 10 25")! ... self.fm.date(from: "\(year) 10 27")!
        XCTAssertEqual(model.title, "2025年10月25日 - 2025年10月27日")
        
        let modelWithStartDate = CalendarModel(startDate: fm.date(from: "2021 01 01"))
        XCTAssertTrue(Calendar.current.compare(modelWithStartDate.endDate, to: self.fm.date(from: "2022 12 31")!, toGranularity: .day) == .orderedSame)
        
        let modelWithEndDate = CalendarModel(endDate: fm.date(from: "2021 01 01"))
        XCTAssertTrue(Calendar.current.compare(modelWithEndDate.startDate, to: self.fm.date(from: "2020 01 01")!, toGranularity: .day) == .orderedSame)
    }
    
    func testCalendarView() {
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedDate = self.fm.date(from: "2025 10 29")!
        let displayDateAtStartup = self.fm.date(from: "2025 10 29")!
        let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
        let model = CalendarModel(startDate: startDate, endDate: endDate, displayDateAtStartup: displayDateAtStartup, selectedDate: selectedDate, disabledDates: disabledDates, isPersistentSelection: true)
        
        let titleChangeCallback: ((String) -> Void)? = {
            print("\($0)")
        }
        let customEventView: ((Date) -> any View) = { _ in
            Circle()
        }
        let customCalendarBackgroundColor = Color.preferredColor(.primaryGroupedBackground)
        let view = CalendarView(model: model, titleChangeCallback: titleChangeCallback, customCalendarBackgroundColor: customCalendarBackgroundColor, customEventView: customEventView)
        XCTAssertNotNil(view.titleChangeCallback)
        XCTAssertNotNil(view.customCalendarBackgroundColor)
        XCTAssertFalse(view.customEventView(startDate).isEmpty)
        
        let configuration = CalendarViewConfiguration(model: model, titleChangeCallback: titleChangeCallback, customCalendarBackgroundColor: customCalendarBackgroundColor, customEventView: customEventView)
        XCTAssertNotNil(configuration.titleChangeCallback)
        XCTAssertNotNil(view.customCalendarBackgroundColor)
        XCTAssertFalse(configuration.customEventView(startDate).isEmpty)
        XCTAssertNotNil(configuration.fillBackgroundColor)
        
        let style = CalendarViewBaseStyle()
        XCTAssertEqual(style.weekViewHeight, 60)
        XCTAssertEqual(style.availableWidth, 16)
        
        style.handleDayViewTapGesture(self.fm.date(from: "2025 10 12")!, state: .normal, configuration: configuration)
        XCTAssertTrue(Calendar.current.compare(model.selectedDate!, to: self.fm.date(from: "2025 10 12")!, toGranularity: .day) == .orderedSame)
        style.handleDayViewTapGesture(self.fm.date(from: "2025 10 12")!, state: .singleSelected, configuration: configuration)
        XCTAssertNil(model.selectedDate)
        
        model.calendarStyle = .datesSelection
        style.handleDayViewTapGesture(self.fm.date(from: "2025 10 12")!, state: .normal, configuration: configuration)
        XCTAssertEqual(model.selectedDates?.count ?? 0, 1)
        style.handleDayViewTapGesture(self.fm.date(from: "2025 10 13")!, state: .normal, configuration: configuration)
        XCTAssertEqual(model.selectedDates?.count ?? 0, 2)
        style.handleDayViewTapGesture(self.fm.date(from: "2025 10 13")!, state: .singleSelected, configuration: configuration)
        XCTAssertEqual(model.selectedDates?.count ?? 0, 1)
        style.handleDayViewTapGesture(self.fm.date(from: "2025 10 12")!, state: .singleSelected, configuration: configuration)
        XCTAssertEqual(model.selectedDates?.count ?? 0, 0)
        
        model.calendarStyle = .rangeSelection
        style.handleDayViewTapGesture(self.fm.date(from: "2025 10 12")!, state: .normal, configuration: configuration)
        style.handleDayViewTapGesture(self.fm.date(from: "2025 10 15")!, state: .normal, configuration: configuration)
        XCTAssertTrue(Calendar.current.compare(model.selectedRange?.lowerBound ?? .now, to: self.fm.date(from: "2025 10 12")!, toGranularity: .day) == .orderedSame)
        XCTAssertTrue(Calendar.current.compare(model.selectedRange?.upperBound ?? .now, to: self.fm.date(from: "2025 10 15")!, toGranularity: .day) == .orderedSame)
        style.handleDayViewTapGesture(self.fm.date(from: "2025 10 14")!, state: .multiSelectedEnd, configuration: configuration)
        XCTAssertTrue(Calendar.current.compare(model.selectedRange?.upperBound ?? .now, to: self.fm.date(from: "2025 10 14")!, toGranularity: .day) == .orderedSame)
        style.handleDayViewTapGesture(self.fm.date(from: "2025 10 15")!, state: .normal, configuration: configuration)
        XCTAssertNil(model.selectedRange)
    }
    
    var configuration: CalendarViewConfiguration {
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedDate = self.fm.date(from: "2025 10 29")!
        let displayDateAtStartup = self.fm.date(from: "2025 10 29")!
        let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
        let model = CalendarModel(startDate: startDate, endDate: endDate, displayDateAtStartup: displayDateAtStartup, selectedDate: selectedDate, disabledDates: disabledDates, isPersistentSelection: true)
        
        let titleChangeCallback: ((String) -> Void)? = {
            print("\($0)")
        }
        let customEventView: ((Date) -> any View) = { _ in
            Circle()
        }
        let customCalendarBackgroundColor = Color.preferredColor(.primaryGroupedBackground)
        return CalendarViewConfiguration(model: model, titleChangeCallback: titleChangeCallback, customCalendarBackgroundColor: customCalendarBackgroundColor, customEventView: customEventView)
    }
    
    func testCalendarViewBaseStyle() {
        let style = CalendarViewBaseStyle()
        let view = style.makeBody(self.configuration)
        XCTAssertNotNil(view)
    }
    
    func testCalendarViewFioriStyle_ContentFioriStyle() {
        let contentFioriStyle = CalendarViewFioriStyle.ContentFioriStyle()
        let view = contentFioriStyle.makeBody(self.configuration)
        XCTAssertNotNil(view)
        
        let fioriStyle = CalendarViewFioriStyle()
        let v2 = fioriStyle.makeBody(self.configuration)
        XCTAssertNotNil(v2)
    }
    
    func testAnyCalendarViewStyle() {
        let style = AnyCalendarViewStyle { _ in
            EmptyView()
        }
        let view = style.makeBody(self.configuration)
        XCTAssertNotNil(view)
    }
    
    func testCalendarViewWithConfiguration() {
        let calendarView = CalendarView(configuration, shouldApplyDefaultStyle: false)
        XCTAssertNotNil(calendarView.body)
        
        let calendarView2 = CalendarView(configuration, shouldApplyDefaultStyle: true)
        XCTAssertNotNil(calendarView2.body)
        
        XCTAssertTrue(self.configuration.isDirectChild("fiori_calendarview_component"))
    }
}
