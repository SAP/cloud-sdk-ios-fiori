import SwiftUI
import XCTest

@testable import FioriSwiftUICore

final class CalendarMonthViewTests: XCTestCase {
    var fm: DateFormatter {
        let fm = DateFormatter()
        fm.timeZone = Calendar.current.timeZone
        fm.locale = Calendar.current.locale
        fm.dateFormat = "yyyy MM dd"
        return fm
    }
    
    func testMonthView_DefaultInitialization() {
        let year = 2025
        let month = 10
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let info = CalendarWeekInfo(year: year, month: month, weekNumber: 43, dates: [
            self.fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
        let model = CalendarMonthModel(year: year, month: month, weeks: [info])
        let view = CalendarMonthView(calendarStyle: .month, model: model, startDate: startDate, endDate: endDate)
        
        XCTAssertNotNil(view)
        XCTAssertEqual(view.calendarStyle, .month)
        XCTAssertEqual(view.model.year, 2025)
        XCTAssertEqual(view.model.month, 10)
        XCTAssertEqual(view.startDate, startDate)
        XCTAssertEqual(view.endDate, endDate)
        XCTAssertFalse(view.showsMonthHeader)
        XCTAssertTrue(view.showsOutOfMonthDates)
        XCTAssertNil(view.selectedDate)
        XCTAssertNil(view.selectedDates)
        XCTAssertNil(view.selectedRange)
        XCTAssertNil(view.disabledDates)
        XCTAssertNil(view.dayTappedCallback)
        XCTAssertTrue(view.customEventView(startDate).isEmpty)
    }
    
    func testMonthView_FullInitialization() {
        let year = 2025
        let month = 10
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedDate = self.fm.date(from: "2025 10 27")!
        let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
        
        let info = CalendarWeekInfo(year: year, month: month, weekNumber: 43, dates: [
            self.fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
        let model = CalendarMonthModel(year: year, month: month, weeks: [info])
        let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
            print("Tapped date:\(date), state:\(state)")
        }
        let view = CalendarMonthView(calendarStyle: .month, model: model, startDate: startDate, endDate: endDate, showsMonthHeader: true, selectedDate: selectedDate, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
            Circle()
        }
        
        XCTAssertNotNil(view)
        XCTAssertEqual(view.calendarStyle, .month)
        XCTAssertEqual(view.model.year, 2025)
        XCTAssertEqual(view.model.month, 10)
        XCTAssertEqual(view.startDate, startDate)
        XCTAssertEqual(view.endDate, endDate)
        XCTAssertTrue(view.showsMonthHeader)
        XCTAssertTrue(view.showsOutOfMonthDates)
        XCTAssertEqual(view.selectedDate, selectedDate)
        XCTAssertNil(view.selectedDates)
        XCTAssertNil(view.selectedRange)
        XCTAssertTrue(disabledDates.isDisabled(self.fm.date(from: "2025 10 26")!))
        XCTAssertTrue(disabledDates.isDisabled(self.fm.date(from: "2025 10 27")!))
        XCTAssertNotNil(view.dayTappedCallback)
        XCTAssertFalse(view.customEventView(startDate).isEmpty)
    }
    
    var configuration: CalendarMonthViewConfiguration {
        let year = 2025
        let month = 10
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedDate = self.fm.date(from: "2025 10 27")!
        let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
        
        let info = CalendarWeekInfo(year: year, month: month, weekNumber: 43, dates: [
            self.fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
        let model = CalendarMonthModel(year: year, month: month, weeks: [info])
        
        let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
            print("Tapped date:\(date), state:\(state)")
        }
        return CalendarMonthViewConfiguration(calendarStyle: .month, model: model, startDate: startDate, endDate: endDate, showsMonthHeader: true, showsOutOfMonthDates: true, selectedDate: selectedDate, selectedDates: nil, selectedRange: nil, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
            Circle()
        }
    }
    
    func testMonthViewConfiguration() {
        XCTAssertNotNil(self.configuration)
        XCTAssertEqual(self.configuration.calendarStyle, .month)
        XCTAssertEqual(self.configuration.model.year, 2025)
        XCTAssertEqual(self.configuration.model.month, 10)
        XCTAssertEqual(self.configuration.startDate, self.configuration.startDate)
        XCTAssertEqual(self.configuration.endDate, self.configuration.endDate)
        XCTAssertTrue(self.configuration.showsMonthHeader)
        XCTAssertTrue(self.configuration.showsOutOfMonthDates)
        XCTAssertEqual(self.configuration.selectedDate, self.configuration.selectedDate)
        XCTAssertNil(self.configuration.selectedDates)
        XCTAssertNil(self.configuration.selectedRange)
        XCTAssertTrue(self.configuration.disabledDates!.isDisabled(self.fm.date(from: "2025 10 26")!))
        XCTAssertTrue(self.configuration.disabledDates!.isDisabled(self.fm.date(from: "2025 10 27")!))
        XCTAssertNotNil(self.configuration.dayTappedCallback)
        XCTAssertFalse(self.configuration.customEventView(self.configuration.startDate).isEmpty)
        
        let style = CalendarMonthViewBaseStyle()
        
        XCTAssertEqual(style.monthText(self.configuration), "October")
        XCTAssertEqual(self.configuration.model.weeks.count, 1)
        
        if let weekNumber = configuration.model.weeks.first?.weekNumber {
            XCTAssertEqual(weekNumber, 43)
        }
        
        if let firstDay = configuration.model.weeks.first?.dates.first {
            XCTAssertTrue(Calendar.current.compare(firstDay, to: self.fm.date(from: "2025 10 26")!, toGranularity: .day) == .orderedSame)
        }
        if let lastDay = configuration.model.weeks.last?.dates.last {
            XCTAssertTrue(Calendar.current.compare(lastDay, to: self.fm.date(from: "2025 11 01")!, toGranularity: .day) == .orderedSame)
        }
        
        let view = CalendarMonthView(configuration)
        XCTAssertEqual(view.selectedDatesInCurrentMonth().count, 1)
    }
    
    func testMonthView_datesSelection() {
        let year = 2025
        let month = 10
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedDates: Set<Date> = [fm.date(from: "2025 10 27")!]
        let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
        
        let info = CalendarWeekInfo(year: year, month: month, weekNumber: 43, dates: [
            self.fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
        let model = CalendarMonthModel(year: year, month: month, weeks: [info])
        
        let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
            print("Tapped date:\(date), state:\(state)")
        }
        let configuration = CalendarMonthViewConfiguration(calendarStyle: .datesSelection, model: model, startDate: startDate, endDate: endDate, showsMonthHeader: true, showsOutOfMonthDates: true, selectedDate: nil, selectedDates: selectedDates, selectedRange: nil, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
            Circle()
        }
        let view = CalendarMonthView(configuration)
        XCTAssertEqual(view.selectedDatesInCurrentMonth().count, 1)
        XCTAssertTrue(view == view)
    }
    
    func testMonthView_dateRange() {
        let year = 2025
        let month = 10
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedRange: ClosedRange<Date> = self.fm.date(from: "2025 10 27")! ... self.fm.date(from: "2025 10 30")!
        let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
        
        let info = CalendarWeekInfo(year: year, month: month, weekNumber: 43, dates: [
            self.fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
        let model = CalendarMonthModel(year: year, month: month, weeks: [info])
        
        let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
            print("Tapped date:\(date), state:\(state)")
        }
        let configuration = CalendarMonthViewConfiguration(calendarStyle: .rangeSelection, model: model, startDate: startDate, endDate: endDate, showsMonthHeader: true, showsOutOfMonthDates: true, selectedDate: nil, selectedDates: nil, selectedRange: selectedRange, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
            Circle()
        }
        let view = CalendarMonthView(configuration)
        XCTAssertEqual(view.selectedDatesInCurrentMonth().count, 4)
        XCTAssertTrue(view == view)
    }
    
    func testCalendarMonthViewBaseStyle() {
        let style = CalendarMonthViewBaseStyle()
        let view = style.makeBody(self.configuration)
        XCTAssertNotNil(view)
    }
    
    func testCalendarMonthViewFioriStyle_ContentFioriStyle() {
        let contentFioriStyle = CalendarMonthViewFioriStyle.ContentFioriStyle()
        let view = contentFioriStyle.makeBody(self.configuration)
        XCTAssertNotNil(view)
        
        let fioriStyle = CalendarMonthViewFioriStyle()
        let v2 = fioriStyle.makeBody(self.configuration)
        XCTAssertNotNil(v2)
    }
    
    func testAnyCalendarMonthViewStyle() {
        let style = AnyCalendarMonthViewStyle { _ in
            EmptyView()
        }
        let view = style.makeBody(self.configuration)
        XCTAssertNotNil(view)
    }
    
    func testCalendarMonthViewWithConfiguration() {
        let monthView = CalendarMonthView(configuration, shouldApplyDefaultStyle: false)
        XCTAssertNotNil(monthView.body)
        
        let monthView2 = CalendarMonthView(configuration, shouldApplyDefaultStyle: true)
        XCTAssertNotNil(monthView2.body)
        
        XCTAssertTrue(self.configuration.isDirectChild("fiori_calendarmonthview_component"))
    }
}
